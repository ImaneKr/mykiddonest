// models/Payment.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Guardian = require('./guardian');
const Kid = require('./kid');

const Payment = sequelize.define('Payment', {
  payment_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  payment_date: {
    type: DataTypes.DATE
  },
  guardian_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: Guardian,
      key: 'guardian_id'
    }
  },
  kid_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: Kid,
      key: 'kid_id'
    }
  },
  amount: {
    type: DataTypes.STRING(10),
    allowNull: false
  },
  status: {
    type: DataTypes.ENUM('paid', 'unpaid'),
    allowNull: false
  }
});

module.exports = Payment;
