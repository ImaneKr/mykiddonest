// kidProfileController.js
const { KidProfile, Guardian, Staff } = require('../models/initModels');

// Create KidProfile only if Guardian exists
async function createKidProfile(req, res) {
    try {
        const { guardianId, firstname, lastname, dateOfbirth, allergies, hobbies, profilePic,authorizedpickups, syndromes } = req.body;

        // Check if Guardian exists
        const guardian = await Guardian.findByPk(guardianId);
        if (!guardian) {
            return res.status(404).json({ error: 'Guardian not found' });
        }

        // Create KidProfile
        const kidProfile = await Kid.create({
            guardian_id: guardianId,
            firstname: firstname,
            lastname: lastname,
            dateOfbirth:dateOfbirth,
            allergies:allergies,
            hobbies:hobbies,
            profile_pic: profilePic,
            syndromes:syndromes,
            authorizedpickups:authorizedpickups,
            active:true,
        });

        return res.status(201).json(kidProfile);
    } catch (error) {
        console.error('Error creating KidProfile:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Edit KidProfile
async function editKidProfile(req, res) {
    try {
        const { id } = req.params;
        const { firstname, lastname, dateOfbirth, allergies, hobbies, authorizedpickups, syndromes } = req.body;

        // Find KidProfile by id
        let kidProfile = await Kid.findByPk(id);
        if (!kidProfile) {
            return res.status(404).json({ error: 'KidProfile not found' });
        }

        // Update KidProfile
        kidProfile = await kidProfile.update({
            firstname:firstname,
            lastname:lastname,
            dateOfbirth:dateOfbirth,
            allergies:allergies,
            hobbies:hobbies,
            authorizepickups: authorizedpickups ,
            syndromes:syndromes,
        });

        return res.status(200).json(kidProfile);
    } catch (error) {
        console.error('Error editing KidProfile:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Delete KidProfile
async function deleteKidProfile(req, res) {
    try {
        const { id } = req.params;

        // Find KidProfile by id
        const kidProfile = await Kid.findByPk(id);
        if (!kidProfile) {
            return res.status(404).json({ error: 'KidProfile not found' });
        }

        // Delete KidProfile
        await kid.destroy();

        return res.status(204).end();
    } catch (error) {
        console.error('Error deleting KidProfile:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Activate KidProfile (only accessible by secretary or admin)
async function activateKidProfile(req, res) {
    try {
        const { id } = req.params;

        // Check if user is secretary or admin
        const staff = await Staff.findByPk(req.user.id);
        if (!staff || (staff.role !== 'secretary' && staff.role !== 'admin')) {
            return res.status(403).json({ error: 'Unauthorized' });
        }

        // Find KidProfile by id
        const kidProfile = await Kid.findByPk(id);
        if (!kidProfile) {
            return res.status(404).json({ error: 'KidProfile not found' });
        }

        // Activate KidProfile
        await kidProfile.update({ active: true });

        return res.status(200).json(kidProfile);
    } catch (error) {
        console.error('Error activating KidProfile:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Deactivate KidProfile (only accessible by secretary or admin)
async function deactivateKidProfile(req, res) {
    try {
        const { id } = req.params;

        // Check if user is secretary or admin
        const staff = await Staff.findByPk(req.user.id);
        if (!staff || (staff.role !== 'secretary' && staff.role !== 'admin')) {
            return res.status(403).json({ error: 'Unauthorized' });
        }

        // Find KidProfile by id
        const kidProfile = await KidProfile.findByPk(id);
        if (!kidProfile) {
            return res.status(404).json({ error: 'KidProfile not found' });
        }

        // Deactivate KidProfile
        await kidProfile.update({ active: false });

        return res.status(200).json(kidProfile);
    } catch (error) {
        console.error('Error deactivating KidProfile:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

module.exports = {
    createKidProfile,
    editKidProfile,
    deleteKidProfile,
    activateKidProfile,
    deactivateKidProfile
};
