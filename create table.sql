CREATE TABLE uberaccount (
    username VARCHAR(45) NOT NULL,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phoneNum VARCHAR(15) NOT NULL,
    driverOpt TINYINT NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE secrets(
    password VARCHAR(64) NOT NULL,
    hashValue VARCHAR(64) NOT NULL,
    username VARCHAR(45) NOT NULL,
    FOREIGN KEY(username) REFERENCES uberaccount(username)
);

CREATE TABLE driver (
    driverID BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    PRIMARY KEY (driverID),
    FOREIGN KEY (username)
        REFERENCES uberaccount (username)
);

CREATE TABLE rideType (
    rideTypeID INTEGER NOT NULL,
    typeDescription VARCHAR(45) NOT NULL,
    PRIMARY KEY (rideTypeID)
);

CREATE TABLE receipt (
    receiptNumber INTEGER NOT NULL,
    receiptDate DATE NOT NULL,
    driverID BIGINT NOT NULL,
    Riderusername VARCHAR(45) NOT NULL,
    PRIMARY KEY (receiptNumber),
    FOREIGN KEY (driverID)
        REFERENCES driver (driverid),
    FOREIGN KEY (Riderusername)
        REFERENCES uberaccount (username)
);
 
CREATE TABLE rideRequest (
    requestID VARCHAR(15) NOT NULL,
    rideTypeID INT NOT NULL,
    latitute FLOAT NOT NULL,
    longtitute FLOAT NOT NULL,
    pickupTime TIME NOT NULL,
    dropoffTime TIME NOT NULL,
    username VARCHAR(45) NOT NULL,
    PRIMARY KEY (requestID),
    FOREIGN KEY (ridetypeid)
        REFERENCES rideType (rideTypeID),
    FOREIGN KEY (username)
        REFERENCES uberaccount (username)
);
    
CREATE TABLE fare (
    amount FLOAT NOT NULL,
    baseFare FLOAT NOT NULL,
    surge FLOAT,
    toll FLOAT,
    requestID VARCHAR(15) NOT NULL,
    recieptNum INTEGER NOT NULL,
    FOREIGN KEY (requestID)
        REFERENCES rideRequest (requestID),
    FOREIGN KEY (recieptNum)
        REFERENCES receipt (ReceiptNumber),
    CHECK (amount > 0 AND basefar > 0
        AND surge >= 0
        AND toll >= 0)
);

CREATE TABLE userRating (
    username VARCHAR(45) NOT NULL,
    avgStarRate FLOAT NOT NULL,
    RatingComment VARCHAR(255),
    indicator TINYINT,
    FOREIGN KEY (username)
        REFERENCES uberaccount (username),
    CHECK (indicator = 1 OR indicator = 0)
);

CREATE TABLE driverLicense (
    licenseNum VARCHAR(15) NOT NULL,
    eyeColor VARCHAR(15) NOT NULL,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    gender VARCHAR(15) NOT NULL,
    DOB DATE NOT NULL,
    issueDate DATE NOT NULL,
    expirationDate DATE NOT NULL,
    driverID BIGINT,
    PRIMARY KEY (licenseNum),
    FOREIGN KEY (driverID)
        REFERENCES driver (driverID)
);
    
CREATE TABLE vehicleType (
    vehicleTypeID INT NOT NULL,
    typeDescription VARCHAR(255) NOT NULL,
    engineType VARCHAR(15) NOT NULL,
    PRIMARY KEY (vehicleTypeID)
);

CREATE TABLE vehicle (
    carID VARCHAR(15) NOT NULL,
    licensePlate VARCHAR(15) NOT NULL,
    color VARCHAR(15) NOT NULL,
    year INT NOT NULL,
    model VARCHAR(15) NOT NULL,
    numSeats TINYINT NOT NULL,
    driverID BIGINT NOT NULL,
    vehicleTypeID INT NOT NULL,
    PRIMARY KEY (carID),
    FOREIGN KEY (vehicleTypeID)
        REFERENCES vehicleType (vehicleTypeID),
    CHECK (numSeats >= 2)
);

CREATE TABLE address (
    AddressName VARCHAR(45) NOT NULL,
    streetName VARCHAR(255) NOT NULL,
    aptNum VARCHAR(15),
    city VARCHAR(15) NOT NULL,
    state VARCHAR(15),
    country VARCHAR(15) NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    username VARCHAR(45) NOT NULL,
    FOREIGN KEY (username)
        REFERENCES uberaccount (username)
);

CREATE TABLE incidentRecord (
    ticketID INTEGER NOT NULL,
    violationDesc VARCHAR(255) NOT NULL,
    fineAmount FLOAT NOT NULL,
    dateTimeIncident DATE NOT NULL,
    driverID BIGINT NOT NULL,
    PRIMARY KEY (ticketID),
    FOREIGN KEY (driverID)
        REFERENCES driver (driverID),
    CHECK (fineAmount > 0)
);

CREATE TABLE bankingAccount (
    accountID INTEGER NOT NULL,
    routingNum VARCHAR(25) NOT NULL,
    checkingNum VARCHAR(64) NOT NULL,
    lastFourSSN VARCHAR(64) NOT NULL,
    driverID BIGINT NOT NULL,
    PRIMARY KEY (accountID),
    FOREIGN KEY (driverID)
        REFERENCES driver (driverID)
);
