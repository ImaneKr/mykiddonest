// app.js
const initModels = require('./models/initModels');
const express = require('express');
const sequelize = require('./config/db'); // Import db.js
const app = express();
const PORT = process.env.PORT || 3001;

async function startServer() {
    try {

        // Sync the database with the models and establish a connection
        const models = initModels(sequelize);
    
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

startServer();
