-- 1. List all the routes along with total number of trips scheduled on each route.

SELECT r.RouteName, COUNT(t.TripID) AS TotalTrips
FROM Route r
JOIN Trip t ON r.RouteID = t.RouteID
GROUP BY r.RouteName;

-- 2. List all trips departing from Pokhara with departure time and route name.

SELECT t.TripID, t.DepartureTime, r.RouteName
FROM Trip t
JOIN Route r ON t.RouteID = r.RouteID
WHERE r.SourceCity = 'Pokhara';

-- 3. List passenger names starting with A and total trips booked.

SELECT p.PassengerName, COUNT(b.BookingID) AS TotalTrips
FROM Passenger p
JOIN Booking b ON p.PassengerID = b.PassengerID
WHERE p.PassengerName LIKE 'A%'
GROUP BY p.PassengerName;

-- 4. List passengers who booked more than 2 trips in December 2025.

SELECT p.PassengerName, COUNT(b.BookingID) AS TotalBookings
FROM Passenger p
JOIN Booking b ON p.PassengerID = b.PassengerID
WHERE TO_CHAR(b.BookingDate, 'MM-YYYY') = '12-2025'
GROUP BY p.PassengerName
HAVING COUNT(b.BookingID) > 2;

-- 5. List tickets issued in January 2026 with passenger names, TripID and payment status.

SELECT p.PassengerName,
       b.TripID,
       t.TicketID,
       CASE
           WHEN pay.PaymentID IS NOT NULL THEN 'Paid'
           ELSE 'Unpaid'
       END AS PaymentStatus
FROM Passenger p
JOIN Booking b ON p.PassengerID = b.PassengerID
JOIN Ticket t ON b.BookingID = t.BookingID
LEFT JOIN Payment pay ON t.TicketID = pay.TicketID
WHERE TO_CHAR(t.IssueDate, 'MM-YYYY') = '01-2026';

-- 6. Find the trip with the latest departure time.

SELECT *
FROM Trip
WHERE DepartureTime = (
    SELECT MAX(DepartureTime)
    FROM Trip
);

-- 7. List top three passengers who booked the most trips.

SELECT p.PassengerName, COUNT(b.BookingID) AS TotalBookings
FROM Passenger p
JOIN Booking b ON p.PassengerID = b.PassengerID
GROUP BY p.PassengerName
ORDER BY TotalBookings DESC
FETCH FIRST 3 ROWS ONLY;

-- 8. List passengers who paid more than average payment amount.

SELECT p.PassengerName,
       SUM(pay.Amount) AS TotalPaid
FROM Passenger p
JOIN Booking b ON p.PassengerID = b.PassengerID
JOIN Ticket t ON b.BookingID = t.BookingID
JOIN Payment pay ON t.TicketID = pay.TicketID
GROUP BY p.PassengerName
HAVING SUM(pay.Amount) > (
    SELECT AVG(Amount)
    FROM Payment
);

-- 9. Calculate total revenue generated per route.

SELECT r.RouteName,
       SUM(pay.Amount) AS TotalRevenue,
       COUNT(t.TripID) AS TotalTrips
FROM Route r
JOIN Trip t ON r.RouteID = t.RouteID
JOIN Booking b ON t.TripID = b.TripID
JOIN Ticket tk ON b.BookingID = tk.BookingID
JOIN Payment pay ON tk.TicketID = pay.TicketID
GROUP BY r.RouteName;

-- 10. List trips where booked tickets are less than 50% of bus capacity.

SELECT t.TripID,
       b.BusCapacity,
       COUNT(book.BookingID) AS TotalBookings
FROM Trip t
JOIN Bus b ON t.BusID = b.BusID
LEFT JOIN Booking book ON t.TripID = book.TripID
GROUP BY t.TripID, b.BusCapacity
HAVING COUNT(book.BookingID) < (b.BusCapacity * 0.5);