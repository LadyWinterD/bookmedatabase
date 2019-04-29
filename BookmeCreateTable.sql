CREATE TABLE Logon(
Username VARCHAR2(20) PRIMARY KEY,
Password VARCHAR2(20) NOT NULL,
UserType VARCHAR2(20),
CustomerID NUMBER(20));

CREATE TABLE UseType(
UserType VARCHAR2(20) PRIMARY KEY,
Status VARCHAR2(20)
);

CREATE TABLE Customer(
CustomerID NUMBER(20) PRIMARY KEY,
LastName VARCHAR2(20),
FirstName VARCHAR2(20),
PhoneNo NUMBER(20),
Email VARCHAR2(20),
AddressSuburb VARCHAR2(20),
AddressCity VARCHAR2(20)
);

CREATE TABLE Rentals(
RentalID NUMBER(20) PRIMARY KEY,
RentalDATE DATE,
CustomerID NUMBER(20)
);

CREATE TABLE Payments(
PaymentNO NUMBER PRIMARY KEY,
PayDate DATE,
PayMethod VARCHAR2(20),
RentalID NUMBER(20)
);

CREATE TABLE RentalDetails(
RentalLineNO NUMBER(20),
RentalID NUMBER(20),
ProductID NUMBER(20),
Quantity NUMBER(20),
UnitCost NUMBER(20,2),
LineCost NUMBER(20,2),
RentalDays DATE
);

CREATE TABLE Products(
ProductsID NUMBER(20) PRIMARY KEY,
ProductName VARCHAR2(20),
UnitCost NUMBER(20,2),
RentalType VARCHAR2(20),
RentalDays DATE
);


ALTER TABLE logon ADD CONSTRAINT Logon_fk FOREIGN KEY(UserType)
REFERENCES UseType(UserType);
ALTER TABLE logon ADD CONSTRAINT Logon_customers_fk FOREIGN KEY(CustomerID)
REFERENCES Customer(CustomerID);

ALTER TABLE Rentals ADD CONSTRAINT Rentals_customerid_fk FOREIGN KEY(CustomerID)
REFERENCES Customer(CustomerID);


ALTER TABLE RentalDetails ADD CONSTRAINT RentalDetails_pk PRIMARY KEY(RentalLineNO,RentalID,ProductID);
ALTER TABLE RentalDetails ADD CONSTRAINT RentalDetails_ProductsID_FK FOREIGN KEY(ProductsID)
REFERENCES Rentals(ProductsID);
ALTER TABLE RentalDetails ADD CONSTRAINT RentalDetails_RentalID_FK FOREIGN KEY(RentalID)
REFERENCES Rentals(RentalID);

ALTER TABLE Payments ADD CONSTRAINT Payments_RENTALID_FK FOREIGN KEY(RentalID)
REFERENCES Rentals(RentalID);


DROP TABLE logon;
drop table customer;
DROP TABLE usetype;
DROP TABLE rentals;
DROP TABLE payments;
DROP TABLE RentalDetails;
DROP TABLE Products;

