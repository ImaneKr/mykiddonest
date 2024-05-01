// models/Category.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Category = sequelize.define('Category', {
  category_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  category_name: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  category_desc: {
    type: DataTypes.STRING(255),
    allowNull: false
  }
});

module.exports = Category;
