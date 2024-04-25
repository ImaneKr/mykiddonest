const mysql = require('mysql2');
require('dotenv').config();

const pool = mysql.createPool({
  host: 'mysql-cf7e496-mykiddonest-caac.j.aivencloud.com',
  port: '25298',
  database: 'defaultdb',
  user: 'avnadmin',
  password: process.env.DB_PASSWORD,
});

module.exports = pool.promise();