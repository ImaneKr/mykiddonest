// models/kid.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Category = require('./category');
const Event = require('./event');

const Kid = sequelize.define('Kid', {
  kid_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  firstname: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  lastname: {
    type: DataTypes.STRING(50)
  },
  gender: {
    type: DataTypes.ENUM('Male', 'Female', 'Other'),
    allowNull: false
  },
  allergies: {
    type: DataTypes.JSON
  },
  hobbies: {
    type: DataTypes.JSON
  },
  syndroms: {
    type: DataTypes.JSON
  },
  prof_time_creation: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  prof_pic: {
    type: DataTypes.STRING(250)
  },
  guardian_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  category_id: {
    type: DataTypes.INTEGER,
    allowNull:false,
    references: {
      model: 'category',
      key: 'category_id'
    }
  }
});

Kid.belongsTo(Category);
Kid.belongsToMany(Event,{through:'EventList'});// joint tablle shows that  is in event too

module.exports = Kid;
