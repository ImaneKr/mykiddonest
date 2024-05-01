// models/Event.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Kid = require('./kid');

const Event = sequelize.define('Event', {
  event_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  event_name: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  event_desc: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  event_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
});
Event.belongsToMany(Kid,{through:'EventList'});

const EventList = sequelize.define(EventList,{

  accept: {
    type: DataTypes.BOOLEAN,
    defaultValue: false // Default value for accept column
  },
  decline: {
    type: DataTypes.BOOLEAN,
    defaultValue: false // Default value for decline column
  }
});

module.exports = {Event,EventList};
