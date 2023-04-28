CREATE TABLE Hotel (
    hotelid INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(50),
    description TEXT,
    rating VARCHAR(50),
    stars VARCHAR(5)
);

CREATE TABLE Room (
    roomid INT PRIMARY KEY AUTO_INCREMENT,
    hotelid INT,
    room_image VARCHAR(100),
    room_name VARCHAR(100),
    room_price DECIMAL(10,2),
    room_rating VARCHAR(50),
    FOREIGN KEY (hotelid) REFERENCES Hotel(hotelid)
);

CREATE TABLE RoomAmenities (
    amenityid INT PRIMARY KEY AUTO_INCREMENT,
    roomid INT,
    icon_image VARCHAR(100),
    amenity_text VARCHAR(50),
    FOREIGN KEY (roomid) REFERENCES Room(roomid)
);

CREATE TABLE Images (
    imageid INT PRIMARY KEY AUTO_INCREMENT,
    hotelid INT,
    roomid INT,
    image_url VARCHAR(100),
    FOREIGN KEY (hotelid) REFERENCES Hotel(hotelid),
    FOREIGN KEY (roomid) REFERENCES Room(roomid)
);

CREATE TABLE Reservation (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    roomid INT,
    cust_name VARCHAR(100),
    cust_email VARCHAR(100),
    cust_phone VARCHAR(100),
    res_from DATE,
    res_to DATE,
    FOREIGN KEY (roomid) REFERENCES Room(roomid)
);
