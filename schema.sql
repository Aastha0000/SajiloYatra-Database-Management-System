-- SajiloYatra Database Management System
-- Author: Aastha Karki
-- Database: Oracle SQL

CREATE TABLE Passenger (
    PassengerID NUMBER(10) PRIMARY KEY,
    PassengerName VARCHAR2(20) NOT NULL,
    ContactNumber VARCHAR2(10) UNIQUE,
    Email VARCHAR2(50) UNIQUE,
    LuggagePreference VARCHAR2(20),
    NotificationPreference VARCHAR2(20)
);

CREATE TABLE BookingFare (
    BookingClass VARCHAR2(30) PRIMARY KEY,
    BookingFare NUMBER(10,2) NOT NULL
);

CREATE TABLE Route (
    RouteID NUMBER(10) PRIMARY KEY,
    RouteName VARCHAR2(20) NOT NULL,
    SourceCity VARCHAR2(20) NOT NULL,
    DestinationCity VARCHAR2(20) NOT NULL
);

CREATE TABLE Bus (
    BusID NUMBER(10) PRIMARY KEY,
    BusNumber VARCHAR2(20) NOT NULL,
    BusCapacity NUMBER(10) NOT NULL,
    BusStatus VARCHAR2(20) NOT NULL,
    SeatNumber VARCHAR2(20) NOT NULL,
    SeatStatus VARCHAR2(20) NOT NULL
);

CREATE TABLE Staff (
    StaffID NUMBER(10) PRIMARY KEY,
    Name VARCHAR2(20) NOT NULL,
    Role VARCHAR2(20) NOT NULL,
    ContactNumber VARCHAR2(10) UNIQUE
);

CREATE TABLE Trip (
    TripID NUMBER(10) PRIMARY KEY,
    TripDate DATE NOT NULL,
    DepartureTime VARCHAR2(10) NOT NULL,
    ArrivalTime VARCHAR2(10) NOT NULL,
    RouteID NUMBER(10),
    BusID NUMBER(10),
    CONSTRAINT fk_trip_route FOREIGN KEY (RouteID)
        REFERENCES Route(RouteID),
    CONSTRAINT fk_trip_bus FOREIGN KEY (BusID)
        REFERENCES Bus(BusID)
);

CREATE TABLE Booking (
    BookingID NUMBER(10) PRIMARY KEY,
    BookingDate DATE NOT NULL,
    BookingStatus VARCHAR2(20) NOT NULL,
    PassengerID NUMBER(10),
    BookingClass VARCHAR2(20),
    TripID NUMBER(10),
    CONSTRAINT fk_booking_passenger FOREIGN KEY (PassengerID)
        REFERENCES Passenger(PassengerID),
    CONSTRAINT fk_booking_class FOREIGN KEY (BookingClass)
        REFERENCES BookingFare(BookingClass),
    CONSTRAINT fk_booking_trip FOREIGN KEY (TripID)
        REFERENCES Trip(TripID)
);

CREATE TABLE Ticket (
    TicketID NUMBER(10) PRIMARY KEY,
    Fare NUMBER(10,2) NOT NULL,
    IssueDate DATE NOT NULL,
    BookingID NUMBER(10),
    CONSTRAINT fk_ticket_booking FOREIGN KEY (BookingID)
        REFERENCES Booking(BookingID)
);

CREATE TABLE Payment (
    PaymentID NUMBER(10) PRIMARY KEY,
    Amount NUMBER(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR2(20) NOT NULL,
    TicketID NUMBER(10),
    CONSTRAINT fk_payment_ticket FOREIGN KEY (TicketID)
        REFERENCES Ticket(TicketID)
);

CREATE TABLE Staff_Trip (
    StaffID NUMBER(10),
    TripID NUMBER(10),
    PRIMARY KEY (StaffID, TripID),
    CONSTRAINT fk_stafftrip_staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID),
    CONSTRAINT fk_stafftrip_trip FOREIGN KEY (TripID)
        REFERENCES Trip(TripID)
);