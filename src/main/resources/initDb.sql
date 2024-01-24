-- Create database  
CREATE DATABASE booking;  
  
-- Switch to the database  
USE booking;  
  
-- User_Info  
CREATE TABLE User_Info (  
    email VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(20) NOT NULL,  
    role_id INT
);  
  
-- User_Detail  
CREATE TABLE User_Detail (  
    email VARCHAR(50),  
    name VARCHAR(20),  
    dob DATE,  
    gender VARCHAR(10),  
    address VARCHAR(255),
    phone VARCHAR(10),
    image VARCHAR(255),
    PRIMARY KEY (email),  
    FOREIGN KEY (email) REFERENCES User_Info(email)  
);  
  
-- Country  
CREATE TABLE Country (  
    id_country INT AUTO_INCREMENT PRIMARY KEY,  
    country_name VARCHAR(30)  
);  
  
-- City  
CREATE TABLE City (  
    id_city INT AUTO_INCREMENT PRIMARY KEY,  
    city_name VARCHAR(20),  
    image_path VARCHAR(100),  
    id_country INT,  
    FOREIGN KEY (id_country) REFERENCES Country(id_country)  
);  
  
-- Airline  
CREATE TABLE Airline (  
    airline_id INT AUTO_INCREMENT PRIMARY KEY,  
    airline_name VARCHAR(30),  
    image_path VARCHAR(50),
    ariline_stand_for VARCHAR(2)
)AUTO_INCREMENT = 2;
  
-- Airport  
CREATE TABLE Airport (  
    airport_id CHAR(10) PRIMARY KEY,  
    airport_name VARCHAR(20),  
    id_city INT,  
    FOREIGN KEY (id_city) REFERENCES City(id_city)  
);  
  
-- Payment  
CREATE TABLE Payment (  
    payment_id INT AUTO_INCREMENT PRIMARY KEY,  
    payment_method VARCHAR(20)  
);  
  
-- Flight  
CREATE TABLE Flight (  
    flight_id INT AUTO_INCREMENT PRIMARY KEY,  
    departure CHAR(10),  
    destination CHAR(10),  
    departure_date DATETIME,  
    arrival_date DATETIME,  
    price DECIMAL(10,2),  
    airline_id INT,  
    num_seat INT,  
    flight_code CHAR(10) UNIQUE,  
    FOREIGN KEY (departure) REFERENCES Airport(airport_id),  
    FOREIGN KEY (destination) REFERENCES Airport(airport_id),  
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  
);  
  
-- Stopover  
CREATE TABLE Stopover (  
    stopover_id INT AUTO_INCREMENT PRIMARY KEY,  
    arrival_time TIME,  
    departure_time TIME,  
    stopover_order INT,  
    flight_id INT,  
    location CHAR(10),  
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id) ON DELETE CASCADE,  
    FOREIGN KEY (location) REFERENCES Airport(airport_id)  
);  
  
-- Flight_Booking  
CREATE TABLE Flight_Booking (  
    flightBooking_id INT AUTO_INCREMENT PRIMARY KEY,  
    flight_id INT,  
    booking_time DATETIME,  
    seat_number CHAR(10),  
    email_user VARCHAR(50),  
    payment_id INT,  
    status_banking BIT,  
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id) ON DELETE CASCADE,  
    FOREIGN KEY (email_user) REFERENCES User_Info(email),  
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)  
);  
  
  
-- Insert data  
  
INSERT INTO User_Info(email, password, role_id) VALUES  
('tranthuyminhthu0611@gmail.com', 'minhthu06112003', 0),  
('duyvu2612003@gmail.com', 'duyvu26102003', 0),  
('admintest@gmail.com', 'admintest', 1),  
('celinatran@gmail.com', 'tran', 0),  
('dylandnguyen@gmail.com', 'nguyen', 0),  
('vnairline@gmail.com', 'airline', 2),  
('vietjetairline@gmail.com', 'airline', 4);  

INSERT INTO User_Detail(email, name, dob, gender, address, phone, image) VALUES  
('tranthuyminhthu0611@gmail.com', 'Trần Thụy Minh Thư', '2003-11-06', 'Nữ', 'Bến Tre', '0123456789', '');

-- Country  
INSERT INTO Country (country_name) VALUES  
('Việt Nam'),  
('Laos'),  
('Japan'),  
('Thailand');  
  
-- City  
INSERT INTO City (city_name, image_path, id_country) VALUES  
('Phú Yên', './images/PhuYen.jpg', 1),  
('Hà Giang', './images/HaGiang.jpg', 1),  
('Nha Trang', './images/NhaTrang.jpg', 1),  
('Ninh Bình', './images/NinhBinh.jpg', 1),  
('Phú Quốc', './images/PhuQuoc.jpg', 1),  
('Lào Cai', './images/LaoCai.jpg', 1),  
('Vũng Tàu', './images/VungTau.jpg', 1),  
('Đà Lạt', './images/DaLat.jpg', 1),  
('TP. Hồ Chí Minh', './images/SaiGon.jpg', 1),  
('Hà Nội', './images/HaNoi.jpg', 1),
('Đà Nẵng', './images/DaNang.jpd',1);
-- Airline  
INSERT INTO Airline (airline_name, image_path, ariline_stand_for) VALUES  
('Vietnam Airlines', './images/VNAirline.png', 'VA'),  
('Bamboo Airways', './images/BBAirline.jpg', 'BA'),  
('VietJet Air', './images/VJAirline.png', 'VJ'),  
('Emirates Airlines', './images/EAirline.png', 'EA');  
  
-- Airport  
INSERT INTO Airport (airport_id, airport_name, id_city) VALUES  
('SGN', 'Sân bay Tân Sơn Nhất', 9),  
('HAN', 'Sân bay Nội Bài', 10),  
('TBB', 'Sân bay Tuy Hoà', 1),  
('CXR', 'Sân bay Cam Ranh', 3),
('DAD', 'Sân bay Đà Nẵng',11);  
  
-- Flight  
INSERT INTO Flight (departure, destination, departure_date, arrival_date, price, airline_id, num_seat, flight_code) VALUES  
('SGN', 'CXR', '2023-12-06 09:45:00', '2023-12-06 12:00:00', 960000, 2, 150, 'CB102'),  
('SGN', 'HAN', '2023-12-09 09:30:00', '2023-12-10 11:45:00', 950000, 2, 300, 'MT611'),  
('SGN', 'HAN', '2023-11-28 16:00:00', '2023-11-28 20:20:00', 930000, 3, 124, 'DV261'),  
('TBB', 'SGN', '2023-11-04 09:00:00', '2023-11-04 13:15:00', 860000, 4, 120, 'DV611'),  
('HAN', 'CXR', '2023-12-22 10:00:00', '2023-12-22 12:45:00', 970000, 2, 340, 'MT261'),  
('TBB', 'CXR', '2023-11-29 11:45:00', '2023-11-29 13:00:00', 700000, 2, 156, 'NL203'),  
('CXR', 'SGN', '2023-11-09 09:00:00', '2023-11-09 13:10:00', 800000, 3, 340, 'BG001'),  
('SGN', 'TBB', '2023-11-16 08:45:00', '2023-11-17 14:05:00', 820000, 4, 140, 'GM100'),
('SGN', 'DAD', '2023-11-30 09:00:00', '2023-11-30 11:15:00', 900000, 3, 180, 'VN456'),
('CXR', 'DAD', '2023-12-05 15:30:00', '2023-12-05 17:45:00', 870000, 2, 200, 'QB789'),
('SGN', 'DAD', '2023-12-10 10:45:00', '2023-12-10 13:00:00', 920000, 4, 250, 'DA999'),
('HAN', 'CXR', '2023-12-15 14:30:00', '2023-12-15 16:45:00', 880000, 4, 180, 'DA301'),
('DAD', 'SGN', '2023-11-20 12:15:00', '2023-11-20 15:30:00', 920000, 3, 200, 'VN123'),
('CXR', 'HAN', '2023-11-25 08:00:00', '2023-11-25 10:15:00', 890000, 2, 250, 'QB555'),
('HAN', 'DAD', '2023-12-01 11:30:00', '2023-12-01 14:45:00', 910000, 2, 220, 'VN789'),
('SGN', 'CXR', '2023-12-08 17:15:00', '2023-12-08 19:30:00', 930000, 4, 300, 'QB111'),
('DAD', 'HAN', '2023-12-12 09:30:00', '2023-12-12 11:45:00', 940000, 3, 180, 'DA555'),
('HAN', 'SGN', '2023-12-18 16:45:00', '2023-12-18 19:00:00', 960000, 2, 200, 'VN666'),
('CXR', 'SGN', '2023-12-20 13:00:00', '2023-12-20 15:15:00', 880000, 4, 220, 'QB222'),
('DAD', 'HAN', '2023-12-25 10:15:00', '2023-12-25 12:30:00', 910000, 3, 250, 'DA789'),
('SGN', 'HAN', '2023-12-28 08:30:00', '2023-12-28 10:45:00', 930000, 2, 180, 'VN321'),
('CXR', 'DAD', '2023-12-31 14:00:00', '2023-12-31 16:15:00', 940000, 4, 200, 'QB777'),
('HAN', 'SGN', '2024-01-05 11:45:00', '2024-01-05 14:00:00', 950000, 3, 220, 'DA888'),
('SGN', 'CXR', '2024-01-10 09:00:00', '2024-01-10 11:15:00', 960000, 2, 250, 'VN432'),
('DAD', 'HAN', '2024-01-15 15:30:00', '2024-01-15 17:45:00', 970000, 4, 180, 'QB333'),
('HAN', 'CXR', '2024-01-20 10:45:00', '2024-01-20 13:00:00', 980000, 3, 200, 'DA777'),
('CXR', 'SGN', '2024-01-25 08:00:00', '2024-01-25 10:15:00', 990000, 2, 220, 'VN555'),
('DAD', 'SGN', '2024-01-30 11:30:00', '2024-01-30 13:45:00', 1000000, 3, 250, 'QB444'),
('SGN', 'DAD', '2024-02-05 09:00:00', '2024-02-05 11:15:00', 1020000, 3, 180, 'VN777'),
('CXR', 'DAD', '2024-02-10 15:30:00', '2024-02-10 17:45:00', 980000, 2, 200, 'QB888'),
('SGN', 'DAD', '2024-02-15 10:45:00', '2024-02-15 13:00:00', 1050000, 4, 250, 'DA111'),
('HAN', 'CXR', '2024-02-20 14:30:00', '2024-02-20 16:45:00', 1010000, 4, 180, 'DA444'),
('DAD', 'SGN', '2024-02-25 12:15:00', '2024-02-25 15:30:00', 950000, 3, 200, 'VN999'),
('CXR', 'HAN', '2024-03-01 08:00:00', '2024-03-01 10:15:00', 970000, 2, 250, 'QB666'),
('HAN', 'DAD', '2024-03-05 11:30:00', '2024-03-05 14:45:00', 990000, 2, 220, 'VN333'),
('SGN', 'CXR', '2024-03-10 17:15:00', '2024-03-10 19:30:00', 1000000, 4, 300, 'QB222'),
('DAD', 'HAN', '2024-03-15 09:30:00', '2024-03-15 11:45:00', 1020000, 3, 180, 'DA555'),
('HAN', 'SGN', '2024-03-20 16:45:00', '2024-03-20 19:00:00', 1040000, 2, 200, 'VN666');
  
  
-- Stopover  
INSERT INTO Stopover (arrival_time, departure_time, stopover_order, flight_id, location) VALUES  
('10:45:00', '11:00:00', 1, 2, 'CXR'),  
('11:30:00', '11:45:00', 2, 2, 'TBB'),  
('12:45:00', '13:00:00', 1, 5, 'CXR'),  
('11:45:00', '12:00:00', 1, 1, 'TBB'),  
('14:45:00', '15:30:00', 1, 8, 'HAN');  
  
-- Payment  
INSERT INTO Payment (payment_method) VALUES   
('Master Card'),   
('Visa'),   
('COD');  

