const express = require('express');
const sequelize = require('./config/db'); // Import Sequelize instance from database.js

const app = express();

// Define your routes and middleware here

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// Example: Define models and perform database operations
//const { ModelName } = require('./models'); // Import your Sequelize models

// Example: Sync the models with the database
sequelize.sync({ force: false })
  .then(() => {
    console.log('Database synchronized');
  })
  .catch(err => {
    console.error('Error synchronizing database:', err);
  });

// Example: Test the database connection
sequelize.authenticate()
  .then(() => {
    console.log('Database connection established successfully');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });
