// routes/kidProfileRoutes.js
const express = require('express');
const router = express.Router();
const kidProfileController = require('../controllers/kid');
const authMiddleware = require('../middleware/authMiddleware');

// Create KidProfile
router.post('/kid', authMiddleware, kidProfileController.createKidProfile);

// Edit KidProfile
router.put('/kid/:id', authMiddleware, kidProfileController.editKidProfile);

// Delete KidProfile
router.delete('/kid/:id', authMiddleware, kidProfileController.deleteKidProfile);

// Activate KidProfile
router.put('/kid/:id/activate', authMiddleware, kidProfileController.activateKidProfile);

// Deactivate KidProfile
router.put('/kid/:id/deactivate', authMiddleware, kidProfileController.deactivateKidProfile);

module.exports = router;
