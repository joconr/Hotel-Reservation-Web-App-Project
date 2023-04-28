// Import required packages
const express = require('express');
const ejs = require('ejs');
const mysql = require('mysql');
const bodyParser = require('body-parser');

// Create an instance of the Express app
const app = express();

// Set the view engine to EJS
app.set('view engine', 'ejs');

// Set the static directory to public
app.use(express.static('public'));

// Use the body-parser package in the website for resevations
app.use(bodyParser.urlencoded({ extended: true }));

// Create a MySQL connection
const db = mysql.createConnection({
    host: 'lmu.build',
    port: 3306,
    user: 'conroylm_dba',
    password: 'springLMU_2023',
    database: 'conroylm_hotel_res'
});

// Connect to the MySQL database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to the MySQL database');
});

// Define the necessary routes (overview, rooms, location, reservation)

app.get('/', (req, res) => {
    db.query('SELECT * FROM Hotel WHERE hotelid = 1', (err, results) => {
        if (err) {
            console.error('Error fetching hotel data:', err);
            res.status(500).send('Error fetching hotel data');
            return;
        }

        const hotelData = results[0];
        res.render('overview', {
            hotel_name: hotelData.hotel_name,
            description: hotelData.description,
            stars: hotelData.stars,
        });
    });
});

app.get('/rooms', (req, res) => {
    const query = `
        SELECT r.*, ra.amenity_text, ra.icon_image
        FROM Room r
        LEFT JOIN RoomAmenities ra ON r.roomid = ra.roomid
        ORDER BY r.roomid`;

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send("Error retrieving rooms data");
        } else {
            const rooms = [];
            let currentRoom = null;

            results.forEach(row => {
                if (!currentRoom || currentRoom.roomid !== row.roomid) {
                    currentRoom = {
                        roomid: row.roomid,
                        room_name: row.room_name,
                        room_rating: row.room_rating,
                        room_image: row.room_image,
                        room_price: row.room_price,
                        amenities: []
                    };
                    rooms.push(currentRoom);
                }

                if (row.amenity_text) {
                    currentRoom.amenities.push({
                        amenity_text: row.amenity_text,
                        icon_image: row.icon_image
                    });
                }
            });

            res.render('rooms', { rooms });
        }
    });
});

// Add a new route to serve the amenities data for each room
app.get('/room-amenities/:roomid', (req, res) => {
    const roomid = req.params.roomid;

    const query = `
        SELECT ra.amenity_text, ra.icon_image
        FROM RoomAmenities ra
        WHERE ra.roomid = ?`;

    db.query(query, [roomid], (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send("Error retrieving amenities data");
        } else {
            res.json(results);
        }
    });
});

app.get('/location', (req, res) => {
    res.render('location');
});

app.get('/reservation/:roomid', (req, res) => {
    db.query('SELECT * FROM Room WHERE roomid = ?', [req.params.roomid], (err, result) => {
        if (err) throw err;

        if (result.length === 0) {
            res.sendStatus(404);
        } else {
            res.render('reservation', { roomid: req.params.roomid, errorMessage: null });
        }
    });
});

app.post('/reservation', (req, res) => {
    const roomid = req.body.roomid;
    const cust_name = req.body.cust_name;
    const cust_email = req.body.cust_email;
    const cust_phone = req.body.cust_phone;
    const res_from = req.body.res_from;
    const res_to = req.body.res_to;

    // Check if room is already reserved during the specified dates
    const query = "SELECT * FROM Reservation WHERE roomid = ? AND ((res_from <= ? AND res_to >= ?) OR (res_from <= ? AND res_to >= ?) OR (res_from >= ? AND res_to <= ?))";

    db.query(query, [roomid, res_from, res_from, res_to, res_to, res_from, res_to], (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
            // Room is already reserved during the specified dates
            res.render('reservation', { errorMessage: 'The room is not available on the selected dates.', roomid: roomid });
        } else {
            // Insert reservation into the database
            const insertQuery = "INSERT INTO Reservation (roomid, cust_name, cust_email, cust_phone, res_from, res_to) VALUES (?, ?, ?, ?, ?, ?)";

            db.query(insertQuery, [roomid, cust_name, cust_email, cust_phone, res_from, res_to], (err, result) => {
                if (err) throw err;

                res.render('success'); // Redirect to success page
            });
        }
    });
});

app.get('/success', (req, res) => {
    res.render('success');
});

// Start the server on port 3000
app.listen(3000, () => {
    console.log('Server started on port 3000');
});