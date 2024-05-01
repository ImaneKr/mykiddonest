// models/Guardian.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Guardian = sequelize.define('Guardian', {
  guardian_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  firstname: {
    type: DataTypes.STRING(100),
    allowNull:false
  },
  lastname: {
    type: DataTypes.STRING(50),
    allowNull:false
  },
  gender: {
    type: DataTypes.STRING(255),
    allowNull:false
  },
  username: {
    type: DataTypes.STRING(100),
    allowNull:false
  },
  guardian_pwd: {
    type: DataTypes.STRING(40),
    allowNull:false
  },
  civilState: {
    type: DataTypes.STRING(100),
    allowNull:false
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull:false
  },
  phone_number: {
    type: DataTypes.STRING(20),
    allowNull:false
  },
  acc_time_creation: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  address: {
    type: DataTypes.STRING(200)
  },
  acc_pic: {
    type: DataTypes.STRING(250)
  },
  acc_active: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  }
});

module.exports = Guardian;
