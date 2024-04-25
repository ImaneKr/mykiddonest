const express = require('express');
const pool = require('./db');
const kid = require('./routes/kids');
const guardian = require('./routes/guardian');


const app = express();
const PORT = 3000;

app.listen(PORT ,()=>{
  console.log(`server is running on port ${PORT}`);
});