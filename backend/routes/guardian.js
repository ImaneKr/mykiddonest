const express = require('express');
const router = express.Router();
const guardianController = require('../controllers/guardian');
const authMiddleware = require('../middleware/authMiddleware');

// Create a new guardian account
router.post('/', authMiddleware, guardianController.createGuardian);

// Delete a guardian account
router.delete('/:id', authMiddleware, guardianController.deleteGuardian);

// Edit a guardian account
router.put('/:id', authMiddleware, guardianController.editGuardian);

module.exports = router;
