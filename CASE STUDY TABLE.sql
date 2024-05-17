drop database if exists TransportManagementSystem;

create database TransportManagementSystem;

use TransportManagementSystem;

drop table if exists Vehicles;

create table Vehicles 
( 
VehicleID int auto_increment primary key, 
Model varchar(255), 
Capacity decimal(10, 2), 
Type varchar(50), 
Status varchar(50)
);

drop table if exists Routes;

create table Routes
(
RouteID int primary key auto_increment,
StartDestination varchar(255),
EndDestination varchar(255),
Distance decimal(10,2)
);

drop table if exists trips;

create table Trips (
    TripID int auto_increment primary key,
    VehicleID int,
    RouteID int,
    DepartureDate datetime,
    ArrivalDate datetime,
    Status varchar(50),
    TripType varchar(50) default 'Freight',
    MaxPassengers int,
    foreign key (VehicleID) references Vehicles(VehicleID) on delete cascade,
    foreign key (RouteID) references Routes(RouteID) on delete cascade
);

drop table if exists passengers;

create table Passengers(
	PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    Gender VARCHAR(255),
    Age INT,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(50)
);

drop table if exists Bookings;

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    TripID INT,
    PassengerID INT,
    BookingDate DATETIME,
    Status VARCHAR(50),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID) on delete cascade,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID) on delete cascade
);
Create table Drivers(
DriverID INT AUTO_INCREMENT PRIMARY KEY,
TripID INT,
VehicleID INT,
Type varchar(50),
FOREIGN KEY (TripID) REFERENCES Trips(TripID) on delete cascade,
FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) on delete cascade
);

insert into vehicles (model, capacity, type, status)
values
('MrM Travels', 150.00, 'bus', 'available'),
('Tempo Traveller', 125, 'van', 'on trip'),
('Volvo', 200.00, 'bus', 'maintenance'),
('Volkswagen transporter', 1800.00, 'van', 'available'),
('Ford', 220.00, 'van', 'available'),
('Force traveller', 280.00, 'van', 'available'),
('Tata', 300.00, 'truck', 'on trip'),
('Volvo vnl', 350.00, 'truck', 'available'),
('Toyota', 300.00, 'bus', 'maintenance'),
('Eicher', 400.00, 'bus', 'available');

insert into Routes (StartDestination, EndDestination, Distance) 
values
('Kerala', 'Chennai', 649.70),
('Vellore', 'Salem', 229.40),
('Tuticorin', 'Chennai', 604.30),
('Chennai', 'Bangalore', 347.50),
('Madurai', 'Tirunelveli', 161.50),
('Chennai', 'Kochi', 690.40),
('Hyderabad', 'Tirupati', 559.80),
('Tuticorin', 'Tirunelveli', 45.10),
('Chennai', 'Kanchipuram', 72.10),
('Hyderabad', 'Chennai', 629.70);

insert into Trips (VehicleID, RouteID, DepartureDate, ArrivalDate,Status,Triptype, MaxPassengers) 
values
(1, 1, '2024-05-01 08:00:00', '2024-05-01 12:00:00', 'Scheduled','Passenger', 50),
(2, 2, '2024-05-02 10:30:00', '2024-05-02 15:30:00', 'In Progress','Freight' ,40),
(3, 3, '2024-05-03 09:45:00', '2024-05-03 14:45:00', 'Completed', 'Passenger' ,30),
(4, 4, '2024-05-04 11:15:00', '2024-05-04 16:15:00', 'Scheduled', 'Freight',35),
(5, 5, '2024-05-05 13:30:00', '2024-05-05 17:30:00', 'Scheduled','Passenger', 45),
(6, 6, '2024-05-06 07:45:00', '2024-05-06 11:45:00', 'In Progress', 'Passenger' ,25),
(7, 7, '2024-05-07 10:00:00', '2024-05-07 14:00:00', 'Scheduled', 'Freight',40),
(8, 8, '2024-05-08 08:30:00', '2024-05-08 12:30:00', 'Scheduled', 'Freight',30),
(9, 9, '2024-05-09 12:45:00', '2024-05-09 17:45:00', 'In Progress','Passenger', 20),
(10,10, '2024-05-10 11:00:00', '2024-05-10 15:00:00', 'Completed', 'Freight',30);

INSERT INTO Passengers (FirstName, Gender, Age, Email, PhoneNumber) 
VALUES ('John', 'Male', 30, 'john@gmail.com', '9234567890'),
('Zoya', 'Female', 25, 'zoya@gmail.com', '9876543210'),
('Michael', 'Male', 45, 'michael@gmail.com', '9567891230'),
('Sophia', 'Female', 35, 'sophia@gmail.com', '7891234560'),
('James', 'Male', 28, 'james@gmail.com', '6216549870'),
('Olivia', 'Female', 22, 'olivia@gmail.com', '6543219870'),
('William', 'Male', 40, 'william@gmail.com', '8561237890'),
('Tara', 'Female', 31, 'tara@gmail.com', '8873216540'),
('Benjamin', 'Male', 27, 'benjamin@gmail.com', '6547891230'),
('Bela', 'Female', 33, 'bela@gmail.com', '8239874560'),
('Charlie', 'Male', 29, 'charlie@gmail.com', '9217894560');

INSERT INTO Bookings (TripID, PassengerID, BookingDate, Status) 
VALUES(21, 1,'2024-05-01 09:00:00', 'Confirmed'),
(22, 2, '2024-05-02 10:20:00', 'Confirmed'),
(23, 3, '2024-05-03 09:55:00', 'Cancelled'),
(24, 4, '2024-05-04 10:15:00', 'Completed'),
(25, 5, '2024-05-05 12:30:00', 'Confirmed'),
(26, 6, '2024-05-06 06:45:00', 'Confirmed'),
(27, 7, '2024-05-07 01:00:00', 'Cancelled'),
(28, 8, '2024-05-08 05:30:00', 'Completed'),
(29, 9, '2024-05-09 12:35:00', 'Confirmed'),
(30,10, '2024-05-10 01:00:00', 'Cancelled');

Insert into Drivers(TripID,VehicleID,Type)
values(21,1,"Car"),
(23,3,"Van"),
(24,4,"Truck"),
(25,5,"Car"),
(26,6,"Van"),
(27,7,"Truck"),
(28,8,"Car"),
(29,9,"Cab");

select * from vehicles;

select * from routes;

select * from trips;

select * from passengers;

select * from bookings;

select * from Drivers;

