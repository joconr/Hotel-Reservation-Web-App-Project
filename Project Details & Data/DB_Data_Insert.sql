-- Inserting data into the Hotel table
INSERT INTO Hotel (hotel_name, description, stars) 
VALUES ('The Venetian Resort Las Vegas', 'Every Room is a Suite ! Nearly double the size of your average Las Vegas hotel room, our standard Las Vegas hotel suites have everything you need and more. Whether you are looking for a vacation gateway or need to host a business conference, we promise to amaze you beyond all your expectations. Explore the Towers. Make your visit extraordinary with all of the best things to do. Tour the Resort. Thereʼs so much to see and itʼs all in walking distance from your suite. From hand-painted frescos to award-winning restaurants and lounges, thereʼs a little bit of everything for everyone to enjoy.', '*****');

-- Insert data into Room table
INSERT INTO Room (hotelid, room_name, room_image, room_price, room_rating)
VALUES (1, 'Luxury King Suite City View', '10829769.jpg', 343, '9.2/10 Wonderful'),
       (1, 'Luxury Two Queen Suite City View', 'ff76f628.jpg', 359, '8.8/10 Excellent'),
       (1, 'Premium Two Queen Suite', '01066662.jpg', 375, '8.5/10 Very Good'),
       (1, 'Premium Two Queen Suite City View', 'd1bcdecd.jpg', 407, '7.9/10 Good'),
       (1, 'Grand King Suite', 'dc882e48.jpg', 431, '9/10 Excellent'),
       (1, 'Prestige Club Lounge Luxury Two Queen Suite', '64ddc853.jpg', 441, NULL),
       (1, 'Prestige Club Lounge Grand King Suite', 'f0a26054.jpg', 561, NULL);


-- Insert data into RoomAmenities table
INSERT INTO RoomAmenities (roomid, amenity_text, icon_image)
VALUES (1, '650 sq ft', 'area_icon.jpg'),
       (1, 'City view', 'cityview_icon.jpg'),
       (1, 'Sleeps 4', 'sleeps_icon.jpg'),
       (1, '1 King Bed', 'num_beds_icon.jpg'),
       (1, 'Free self parking', 'parking_icon.jpg'),
       (2, '750 sq ft', 'area_icon.jpg'),
       (2, 'City view', 'cityview_icon.jpg'),
       (2, 'Sleeps 4', 'sleeps_icon.jpg'),
       (2, '2 Queen Beds', 'num_beds_icon.jpg'),
       (2, 'Free self parking', 'parking_icon.jpg'),
       (3, '1100 sq ft', 'area_icon.jpg'),
       (3, 'Sleeps 4', 'sleeps_icon.jpg'),
       (3, '2 Queen Beds', 'num_beds_icon.jpg'),
       (3, 'Free self parking', 'parking_icon.jpg'),
       (4, '1100 sq ft', 'area_icon.jpg'),
       (4, 'City view', 'cityview_icon.jpg'),
       (4, 'Sleeps 4', 'sleeps_icon.jpg'),
       (4, '2 Queen Beds', 'num_beds_icon.jpg'),
       (4, 'Free self parking', 'parking_icon.jpg'),
       (5, '1500 sq ft', 'area_icon.jpg'),
       (5, 'Sleeps 4', 'sleeps_icon.jpg'),
       (5, '1 King Bed', 'num_beds_icon.jpg'),
       (5, 'Free self parking', 'parking_icon.jpg'),
       (6, '750 sq ft', 'area_icon.jpg'),
       (6, 'City view', 'cityview_icon.jpg'),
       (6, 'Sleeps 4', 'sleeps_icon.jpg'),
       (6, '2 Queen Beds', 'num_beds_icon.jpg'),
       (6, 'Free breakfast', 'breakfast_icon.jpg'),
       (6, 'Free self parking', 'parking_icon.jpg'),
       (6, 'Free welcome drink', 'included_icon.jpg'),
       (6, 'Drinks and hors d\'oeuvres', 'included_icon.jpg'),
       (7, '1500 sq ft', 'area_icon.jpg'),
       (7, 'City view', 'cityview_icon.jpg'),
       (7, 'Sleeps 3', 'sleeps_icon.jpg'),
       (7, '1 King Bed', 'num_beds_icon.jpg'),
       (7, 'Free breakfast', 'breakfast_icon.jpg'),
       (7, 'Free self parking', 'parking_icon.jpg'),
       (7, 'Free welcome drink', 'included_icon.jpg'),
       (7, 'Drinks and hors d\'oeuvres', 'included_icon.jpg');
      
-- Insert data into Images table
INSERT INTO Images (hotelid, image_url)
VALUES (1, 'Fountain.jpg'),
       (1, 'lobby.jpg'),
       (1, 'Outside.jpg'),
       (1, 'Sundeck.jpg'),
       (1, 'view_from_room.jpg');

-- Data for the Reservations table will be inserted via the form on the site
