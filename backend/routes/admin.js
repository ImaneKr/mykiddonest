const express = require('express');
const router = express.Router();
const staffController = require('../controllers/staff');
const authMiddleware = require('../middleware/authMiddleware');

// Create a new staff account
router.post('/', authMiddleware, staffController.createStaff);

// Delete a staff account
router.delete('/:id', authMiddleware, staffController.deleteStaff);

// Edit a staff account
router.put('/:id', authMiddleware, staffController.editStaff);

module.exports = router;
