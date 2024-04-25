const express = require('express');
//const guardianModel = require('../models/guardian_model');

const router = express.Router();

router.get("/", (request, response) => {
   console.log(request.body);
    
    response.send(`Guardian info: ${request.body.id} , ${request.body.fname} , ${request.body.lname}`);
});

module.exports = router;