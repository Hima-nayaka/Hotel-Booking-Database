Create Database HotelBookingDB;
USE HotelBookingDB;
# Customer Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    City VARCHAR(30)
);

# Rooms Table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomType VARCHAR(30),
    Price DECIMAL(10,2),
    Availability VARCHAR(20)
);

# Booking Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckIn DATE,
    CheckOut DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

# Payment Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

# Customers Data
INSERT INTO Customers VALUES
(1, 'Rahul', '9876543210', 'rahul@gmail.com', 'Bangalore'),
(2, 'Priya', '9876543211', 'priya@gmail.com', 'Hyderabad');

# Rooms Data
INSERT INTO Rooms VALUES
(101, 'Single Room', 2000, 'Available'),
(102, 'Double Room', 3500, 'Booked');

# Booking Data
INSERT INTO Bookings VALUES
(1, 1, 101, '2026-06-01', '2026-06-05'),
(2, 2, 102, '2026-06-03', '2026-06-06');

# Payment Data
INSERT INTO Payments VALUES
(1, 1, 8000, '2026-06-01', 'UPI'),
(2, 2, 10500, '2026-06-03', 'Card');

select * from Customers;
select * from Rooms;
select * from Bookings;
select Customers.Name, Rooms.RoomType, Bookings.CheckIn, Bookings.CheckOut from Bookings
Join Customers ON Bookings.CustomerID = Customers.CustomerID
Join Rooms ON Bookings.RoomID = Rooms.RoomID;

select SUM(Amount) As Total_Revenue
from Payments;