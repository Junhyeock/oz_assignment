DROP TABLE IF EXISTS Services, Reservations, Rooms, Pets, PetOwners;

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


-- 고객 데이터
INSERT INTO PetOwners (name, contact) VALUES
('홍길동', '010-1234-5678'),
('김영희', '010-9876-5432');

-- 반려동물 데이터
INSERT INTO Pets (ownerID, name, species, breed) VALUES
(1, '멍멍이', '개', '푸들'),
(1, '야옹이', '고양이', '코리안숏헤어'),
(2, '쿠쿠', '개', '말티즈');

-- 객실 데이터
INSERT INTO Rooms (roomNumber, roomType, pricePerNight) VALUES
('101', '스탠다드', 50000),
('102', '디럭스', 80000),
('201', '프리미엄', 120000);

-- 예약 데이터
INSERT INTO Reservations (petID, roomID, startDate, endDate) VALUES
(1, 1, '2025-08-01', '2025-08-03'),
(2, 2, '2025-08-05', '2025-08-08'),
(3, 3, '2025-08-10', '2025-08-13');

-- 서비스 데이터
INSERT INTO Services (reservationID, serviceName, servicePrice) VALUES
(1, '목욕', 15000),
(1, '산책', 10000),
(2, '미용', 25000),
(3, '건강검진', 30000);

SELECT * FROM users;