const express = require('express');
const {Sequelize} =require('sequelize');

const config = require('./config/config.json')[process.env.NODE_ENV || 'development'];

const app = express();

const sequelize = new Sequelize(config.databse, config.username ,config.password, {
  host : config.host,
  port: config.port,
  dialect: config.dialect,
  logging: config.logging
});
sequelize.sync({ force: false })
  .then(() => {
    console.log('Database synchronized');
  })
  .catch(err => {
    console.error('Error synchronizing database:', err);
  });

sequelize.authenticate()
  .then(()=>{
    console.log('Database connection established successfully');
  })
  .catch(err =>{
    console.error('Unable to connect to the database: ',err);
  });

  const PORT = process.env.PORT || 3000;
  app.listen(PORT ,() =>{
    console.log(`Server is running on port ${PORT}`);
  })