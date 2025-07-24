CREATE TABLE PetOwners (
  ownerID INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  contact VARCHAR(100)
);

CREATE TABLE Pets (
  petID INT AUTO_INCREMENT PRIMARY KEY,
  ownerID INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  species VARCHAR(50),
  breed VARCHAR(50),
  FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);


CREATE TABLE Rooms (
  roomID INT AUTO_INCREMENT PRIMARY KEY,
  roomNumber VARCHAR(10),
  roomType VARCHAR(30),
  pricePerNight DECIMAL(10, 2)
);

CREATE TABLE Reservations (
    reservationID INT AUTO_INCREMENT PRIMARY KEY,
    petID INT,
    roomID INT,
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (petID) REFERENCES Pets(petID),
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

CREATE TABLE Services (
    serviceID INT AUTO_INCREMENT PRIMARY KEY,
    reservationID INT,
    serviceName VARCHAR(50),
    servicePrice DECIMAL(10, 2),
    FOREIGN KEY (reservationID) REFERENCES Reservations(reservationID)
);