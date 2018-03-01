Create table uberaccount(
	username varchar(45) not null,
	firstname varchar(45) not null,
	lastname varchar(45) not null,
	secret varchar(64) not null,
	email varchar(100) not null,
	phoneNum varchar(15) not null,
	driverOpt tinyint not null,
	Primary Key(username)
	);

create table driver(
	driverID bigint not null auto_increment,
	username varchar(45) not null,
	Primary Key(driverID),
	Foreign Key(username) REFERENCES uberaccount(username)
	);

create table rideType(
	rideTypeID integer not null,
	typeDescription varchar(45) not null,
	PRIMARY KEY(rideTypeID)
	);

create table receipt(
	receiptNumber integer not null,
	receiptDate Date not null,
	driverID bigint not null,
	username varchar(45) not null,
	primary key(receiptNumber),
	foreign key(driverID) references driver(driverid),
	foreign key(username) references uberaccount(username)
	);
 
create table rideRequest(
	requestID varchar(15) not null,
	rideTypeID int not null,
	latitute float not null,
	longtitute float not null,
	pickupTime time not null,
	dropoffTime time not null,
    	primary key(requestID),
	foreign key(ridetypeid) references rideType(rideTypeID)
	);
    
create table fare(
	amount float not null,
	baseFare float not null,
	surge float,
	toll float,
	requestID varchar(15) not null,
	recieptNum integer not null,
	Foreign Key(requestID) references rideRequest(requestID),
	Foreign Key(recieptNum) references receipt(ReceiptNumber),
	CHECK(amount > 0 and basefar > 0 and surge >= 0 and toll >= 0)
	);

create table userRating(
	username varchar(45) Not Null,
	avgStarRate Float not null,
	RatingComment varchar(255),
	indicator tinyint,
	Foreign Key(username) REFERENCES uberaccount(username),
	CHECK(indicator = 1 or indicator = 0)
	);

create table driverLicense(
	licenseNum varchar(15) not null,
	eyeColor varchar(15) not null,
	height integer not null,
	weight integer not null,
	gender varchar(15) not null,
	DOB Date not null,
	issueDate Date not null,
	expirationDate Date not null,
	driverID bigint,
	Primary Key (licenseNum),
	Foreign Key (driverID) REFERENCES driver(driverID)
	);
    
create table vehicleType(
	vehicleTypeID int not null,
	typeDescription varchar(255) not null,
	engineType varchar(15) not null,
	Primary Key(vehicleTypeID)
	);

create table vehicle(
	carID varchar(15) not null,
	licensePlate varchar(15) not null,
	color varchar(15) not null,
	year int not null,
	model varchar(15) not null,
	numSeats tinyInt not null,
	driverID bigint not null,
	vehicleTypeID int not null,
	PRIMARY KEY(carID),
	Foreign Key(vehicleTypeID) references vehicleType(vehicleTypeID),
	CHECK(numSeats >= 2)
	);

create table address(
	AddressName varchar(45) not null,
	streetName varchar(255) not null,
	aptNum varchar(15),
	city varchar(15) not null,
	zipcode varchar(5) not null,
	username varchar(45) not null,
	foreign key(username) references uberaccount(username)
	);

create table incidentRecord(
	ticketID integer not null,
	violationDesc varchar(255) not null,
	fineAmount float not null,
	dateTimeIncident date not null,
	driverID bigint not null,
	primary key(ticketID),
	foreign key(driverID) references driver(driverID),
	CHECK(fineAmount > 0)
	);

create table bankingAccount(
	accountID integer not null,
	routingNum varchar(25) not null,
	checkingNum varchar(64) not null,
	lastFourSSN varchar(64) not null,
	driverID bigint not null,
	Primary Key(accountID),
	foreign key(driverID) references driver(driverID)
	);
