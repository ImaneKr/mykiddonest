// models/Staff.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Staff = sequelize.define('Staff', {
    staff_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    firstname: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    lastname: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    username: {
        type: DataTypes.STRING(100),
        allowNull: false
    },
    role: {
        type: DataTypes.ENUM('admin', 'secretary', 'teacher'),
        allowNull: false
    },
    registration_date: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    staff_pic: {
        type: DataTypes.STRING(255),
        allowNull: false
    },
    phone_number: {
        type: DataTypes.STRING(20)
    },
    email: {
        type: DataTypes.STRING(255),
        allowNull: false,
        unique: true
    },
    salary: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    staff_pwd: {
        type: DataTypes.STRING(50),
        allowNull: false
    }
});

module.exports = Staff;
