DROP DATABASE IF EXISTS CarsRental;

CREATE DATABASE IF NOT EXISTS CarsRental;


USE CarsRental;




DROP TABLE IF EXISTS Customers;


CREATE TABLE customers (
	        
	cust_id INTEGER AUTO_INCREMENT ,

	firstName VARCHAR(15) NOT NULL,

	lastName VARCHAR(20) NOT NULL,

	address VARCHAR(20) NOT NULL,

	town VARCHAR(20),

	contactNo VARCHAR(15) NOT NULL,

	dateOfBirth DATE NOT NULL,

	PRIMARY KEY(cust_id) );



INSERT INTO Customers VALUES ( null, 'Martin', 'Kerry', 'Ballymun Road', 'Dublin', '08756875678', '2006-12-21');

INSERT INTO Customers VALUES ( null, 'Ewa', 'Higgins', '55 newtown', 'Longford','085355423', '2000-04-19');

INSERT INTO Customers VALUES ( null, 'Emon', 'Cooke', 'Beamount', 'Dublin', '0878102366', '1982-04-30');

INSERT INTO Customers VALUES ( null, 'Ankita', 'Sharma', 'Whitepark Ave', 'Athlone', '0859876543', '1993-12-12');

INSERT INTO Customers VALUES ( null, 'kimberly', 'Jones', 'Main St', 'Roscommon', '0877897897', '1990-12-25');

INSERT INTO Customers VALUES ( null, 'Colm', 'Carter', 'Cam', 'Brideswell', '0864534276', '1988-02-14');

INSERT INTO Customers VALUES ( null, 'Barbara', 'Hayden', 'Kilcolgan', 'Galway', '0869191919', '1992-05-20');

INSERT INTO Customers VALUES ( null, 'Markus', 'Henry', 'Main St', 'Roscommon', '0862867677', '1992-11-25');

INSERT INTO Customers VALUES ( null, 'Declan', 'Dunne', 'Cam',  'Dublin', '0876549545', '2002-05-14');

INSERT INTO Customers VALUES ( null, 'Helen', 'Penny', 'retreat rd',  'Kildare', '0896534587', '1991-11-19');

INSERT INTO Customers VALUES ( null, 'Divya', 'Sharma', 'ballymahon',  'Cavan', '08764567560', '1992-02-20');

INSERT INTO Customers VALUES ( null, 'paul', 'Dunne', 'Church street', 'Monaghan', '0864844550', '1989-05-08');

INSERT INTO customers VALUES ( null, 'Richie', 'Lignel', 'willow park','Athlone', '08681982309', '1986-03-27');





SELECT * FROM customers;




DROP TABLE IF EXISTS Cars;


CREATE TABLE Cars (


	car_id INTEGER AUTO_INCREMENT ,

	Name VARCHAR(45) NOT NULL,
		
	carType VARCHAR(20) NOT NULL,

	fuelType VARCHAR(10) NOT NULL,
	
	carRegistrationYear VARCHAR(20) NOT NULL,

	rating float(1) NOT NULL,

	PRIMARY KEY(car_id) );




INSERT INTO Cars VALUES ( null, 'Volkswagen Polo','Economy','Petrol','2005',4.5);
INSERT INTO Cars VALUES ( null, 'Nissan Micra', 'Economy','Petrol','2006',4.6);
INSERT INTO Cars VALUES ( null, 'Peugeot 107', 'Mini','Petrol','2010',3.9);
INSERT INTO Cars VALUES ( null, 'Ford Ka', 'Mini','Petrol','2008',3.8);
INSERT INTO Cars VALUES ( null, 'Ford Focus', 'Compact','Diesel','2009',4.2);
INSERT INTO Cars VALUES ( null, 'Opel Astra', 'Compact','Diesel','2012',4.2);
INSERT INTO Cars VALUES ( null, 'Renault Clio', 'Economy','Petrol','2017',4.0);
INSERT INTO Cars VALUES ( null, 'Toyota Corolla', 'Compact','Petrol','2016',4.3);
INSERT INTO Cars VALUES ( null, 'Volkswagen Golf', 'Compact','Diesel','2014',4.6);
INSERT INTO Cars VALUES ( null, 'Opel Zafira', 'People Carrier','Diesel','2011',3.7);
INSERT INTO Cars VALUES ( null, 'Ford Fiesta','Economy','Petrol','2007',4.1);
INSERT INTO Cars VALUES ( null, 'Toyota Avensis', 'Intermediate','Petrol','2013',4);
INSERT INTO Cars VALUES ( null, 'Mercedes-Benz E-Class ', 'Luxury','Petrol','2015',4.8);
INSERT INTO Cars VALUES ( null, 'Ford Galaxy', 'People Carrier','Petrol','2009',3.9);
INSERT INTO Cars VALUES ( null, 'Ford Mondeo', 'Intermediate','Diesel','2010',4.1);
INSERT INTO Cars VALUES ( null, 'BMW 5-Series  ', 'Luxury','Petrol','2014',4.8);
INSERT INTO Cars VALUES ( null, 'Nissan Qashqai', 'SUV','Diesel','2016',5.0);
INSERT INTO Cars VALUES ( null, 'Land Rover Discovery', 'SUV','Diesel','2017',4.7);
INSERT INTO Cars VALUES ( null, 'Hyundai I40', 'Estate','Hybrid','2007',4.5);
INSERT INTO Cars VALUES ( null, 'Renault Grand Magane', 'Estate','Petrol','2006',4.1);


SELECT * FROM Cars;




DROP TABLE IF EXISTS Rental;



CREATE TABLE Rental (
	
	rent_id INTEGER AUTO_INCREMENT,
		
	rentaldate date NOT NULL,

	duedate date NOT NULL,
	
	cust_id INTEGER NOT NULL,

	car_id INTEGER NOT NULL,

	PRIMARY KEY(rent_id),

	FOREIGN KEY (cust_id) REFERENCES Customers (cust_id),

	FOREIGN KEY (car_id) REFERENCES Cars (car_id));



INSERT INTO Rental VALUES ( null, '2017-10-15','2017-10-28',2,11 );
INSERT INTO Rental VALUES ( null, '2017-11-10','2017-12-23',5,1 );
INSERT INTO Rental VALUES ( null, '2017-10-07','2017-11-21',9,9 );
INSERT INTO Rental VALUES ( null, '2017-11-02','2017-12-13',11,15 );
INSERT INTO Rental VALUES ( null, '2017-11-19','2018-01-15',4,20 );
INSERT INTO Rental VALUES ( null, '2017-10-01','2017-11-30',1,18 );
INSERT INTO Rental VALUES ( null, '2017-10-15','2017-10-30',3,8 );
INSERT INTO Rental VALUES ( null, '2017-12-11','2018-02-05',8,6 );
INSERT INTO Rental VALUES ( null, '2017-10-28','2017-12-23',7,2 );
INSERT INTO Rental VALUES ( null, '2017-12-03','2018-01-20',12,1 );
INSERT INTO Rental VALUES ( null, '2017-11-23','2017-12-11',6,7 );
INSERT INTO Rental VALUES ( null, '2017-10-16','2017-10-26',2,3 );
INSERT INTO Rental VALUES ( null, '2017-10-20','2017-11-01',5,19 );
INSERT INTO Rental VALUES ( null, '2017-11-13','2017-12-22',13,12 );




SELECT * FROM Rental;

select * from Customers;

select * from Cars;

select count(*) from Cars;

select carType,count(*) from Cars group by carType;

select * from Cars where carType='Economy';

select * from Cars where carRegistrationYear>'2010';

select datediff(duedate,rentaldate) from rental
where rent_id=1;

select firstname,lastname,town from customers 
inner join rental 
on Customers.cust_id
=Rental.cust_id 
where rental.car_id=1;




