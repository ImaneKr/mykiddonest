// routes/kidProfileRoutes.js
const express = require('express');
const router = express.Router();
const kidProfile = require('../controllers/kid');
const authMiddleware = require('../middleware/authMiddleware');

// Create KidProfile
router.post('/kid', authMiddleware, kidProfile.createKidProfile);

// Edit KidProfile
router.put('/kid/:id', authMiddleware, kidProfile.editKidProfile);

// Delete KidProfile
router.delete('/kid/:id', authMiddleware, kidProfile.deleteKidProfile);

// Activate KidProfile
router.put('/kid/:id/activate', authMiddleware, kidProfile.activateKidProfile);

// Deactivate KidProfile
router.put('/kid/:id/deactivate', authMiddleware, kidProfile.deactivateKidProfile);

module.exports = router;
