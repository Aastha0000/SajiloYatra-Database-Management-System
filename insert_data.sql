-- Insert into Passenger

INSERT INTO Passenger VALUES (1, 'Aastha Karki', '9811111111', 'aastha@gmail.com', 'Light', 'Email');
INSERT INTO Passenger VALUES (2, 'Aayush Sharma', '9822222222', 'aayush@gmail.com', 'Heavy', 'SMS');
INSERT INTO Passenger VALUES (3, 'Anish Rai', '9833333333', 'anish@gmail.com', 'Medium', 'Email');
INSERT INTO Passenger VALUES (4, 'Bikash Thapa', '9844444444', 'bikash@gmail.com', 'Light', 'SMS');
INSERT INTO Passenger VALUES (5, 'Sita Lama', '9855555555', 'sita@gmail.com', 'Heavy', 'Email');

-- Insert into BookingFare

INSERT INTO BookingFare VALUES ('Economy', 1500);
INSERT INTO BookingFare VALUES ('Business', 2500);
INSERT INTO BookingFare VALUES ('VIP', 4000);

-- Insert into Route

INSERT INTO Route VALUES (1, 'Kathmandu-Pokhara', 'Kathmandu', 'Pokhara');
INSERT INTO Route VALUES (2, 'Pokhara-Chitwan', 'Pokhara', 'Chitwan');
INSERT INTO Route VALUES (3, 'Kathmandu-Butwal', 'Kathmandu', 'Butwal');

-- Insert into Bus

INSERT INTO Bus VALUES (1, 'BA-1234', 40, 'Available', 'A1', 'Booked');
INSERT INTO Bus VALUES (2, 'BA-5678', 35, 'Available', 'B1', 'Available');
INSERT INTO Bus VALUES (3, 'BA-9101', 50, 'Maintenance', 'C1', 'Available');

-- Insert into Staff

INSERT INTO Staff VALUES (1, 'Ram Sharma', 'Driver', '9800000001');
INSERT INTO Staff VALUES (2, 'Hari Rai', 'Conductor', '9800000002');
INSERT INTO Staff VALUES (3, 'Suman Thapa', 'Manager', '9800000003');

-- Insert into Trip

INSERT INTO Trip VALUES (1, TO_DATE('2026-01-10','YYYY-MM-DD'), '08:00', '14:00', 1, 1);
INSERT INTO Trip VALUES (2, TO_DATE('2026-01-12','YYYY-MM-DD'), '09:00', '13:00', 2, 2);
INSERT INTO Trip VALUES (3, TO_DATE('2026-01-15','YYYY-MM-DD'), '07:30', '15:00', 3, 3);

-- Insert into Booking

INSERT INTO Booking VALUES (1, TO_DATE('2026-01-01','YYYY-MM-DD'), 'Confirmed', 1, 'Economy', 1);
INSERT INTO Booking VALUES (2, TO_DATE('2026-01-02','YYYY-MM-DD'), 'Confirmed', 2, 'Business', 2);
INSERT INTO Booking VALUES (3, TO_DATE('2026-01-03','YYYY-MM-DD'), 'Pending', 3, 'VIP', 3);
INSERT INTO Booking VALUES (4, TO_DATE('2026-01-04','YYYY-MM-DD'), 'Confirmed', 1, 'Economy', 2);
INSERT INTO Booking VALUES (5, TO_DATE('2026-01-05','YYYY-MM-DD'), 'Confirmed', 1, 'VIP', 1);

-- Insert into Ticket

INSERT INTO Ticket VALUES (1, 1500, TO_DATE('2026-01-01','YYYY-MM-DD'), 1);
INSERT INTO Ticket VALUES (2, 2500, TO_DATE('2026-01-02','YYYY-MM-DD'), 2);
INSERT INTO Ticket VALUES (3, 4000, TO_DATE('2026-01-03','YYYY-MM-DD'), 3);

-- Insert into Payment

INSERT INTO Payment VALUES (1, 1500, TO_DATE('2026-01-01','YYYY-MM-DD'), 'eSewa', 1);
INSERT INTO Payment VALUES (2, 2500, TO_DATE('2026-01-02','YYYY-MM-DD'), 'Cash', 2);
INSERT INTO Payment VALUES (3, 4000, TO_DATE('2026-01-03','YYYY-MM-DD'), 'Card', 3);

-- Insert into Staff_Trip

INSERT INTO Staff_Trip VALUES (1, 1);
INSERT INTO Staff_Trip VALUES (2, 1);
INSERT INTO Staff_Trip VALUES (3, 2);