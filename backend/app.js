const express = require('express');

const sequelize = require('./config/db'); // Import db.js
const guardianRouter = require('./routes/guardian');
const staffRouter = require('./routes/staffRoute');
const authRoute = require('./routes/authentication');
const dummyRoute = require('./routes/dummyRoutes');
const cookieParser = require('cookie-parser');
//const { Guardian } = require('./models/models');

const bcrypt = require('bcrypt');
// Initialize Express app
const app = express();

// Define port
const PORT = process.env.PORT || 3001;

// Define middleware
app.use(express.json()); // Parse JSON request bodies
app.use(cookieParser());
// Define routes
app.use('/guardian', guardianRouter);
app.use('/staff', staffRouter );
app.use('/auth', authRoute);
app.use('/create', dummyRoute);
// Define a function to start the server

async function startServer() {
    try {
        // Sync the database with the models and establish a connection
        await sequelize.authenticate();
        console.log('Connection to database has been established successfully.');

        // Start the Express server
        app.listen(PORT, () => {
            console.log(`Server is running on port ${PORT}`);
        });
    } catch (error) {
        console.error('Error starting server:', error);
        // Ensure graceful shutdown in case of an error
        process.exit(1);
    }
}

// Call the function to start the server
startServer();