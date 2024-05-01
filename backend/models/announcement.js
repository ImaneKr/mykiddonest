// models/Announcement.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Announcement = sequelize.define('Announcement', {
  announcement_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  announcement_title: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  announcement_desc: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  announcement_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
});

module.exports = Announcement;
