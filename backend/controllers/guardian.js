const Guardian = require('../models/initModels');

// Controller function to create a new guardian account
const createGuardian = async (req, res) => {
    try {
        // Check if the user making the request is authorized (admin or secretary)
        if (req.staff.role !== 'admin' && req.staff.role !== 'secretary') {
            return res.status(403).json({ error: 'Unauthorized access' });
        }

        // Extract guardian data from request body
        const { firstname, dateOfbirth, lastname, gender, username, guardian_pwd, civilState, email, phone_number, address, acc_pic } = req.body;

        // Create guardian account in the database
        const guardian = await Guardian.create({
            firstname,
            dateOfbirth,
            lastname,
            gender,
            username,
            guardian_pwd,
            civilState,
            email,
            phone_number,
            address,
            acc_pic
        });

        // Respond with the created guardian object
        res.status(201).json(guardian);
    } catch (error) {
        console.error('Error creating guardian:', error);
        res.status(500).json({ error: 'Failed to create guardian account' });
    }
};

// Controller function to delete a guardian account
const deleteGuardian = async (req, res) => {
    try {
        // Check if the user making the request is authorized (admin or secretary)
        if (req.user.role !== 'admin' && req.user.role !== 'secretary') {
            return res.status(403).json({ error: 'Unauthorized access' });
        }

        // Extract guardian ID from request parameters
        const { id } = req.params;

        // Find the guardian by ID and delete it
        const deletedGuardian = await Guardian.destroy({ where: { guardian_id: id } });

        if (deletedGuardian === 0) {
            return res.status(404).json({ error: 'Guardian not found' });
        }

        // Respond with success message
        res.status(200).json({ message: 'Guardian deleted successfully' });
    } catch (error) {
        console.error('Error deleting guardian:', error);
        res.status(500).json({ error: 'Failed to delete guardian account' });
    }
};

// Controller function to edit a guardian account
const editGuardian = async (req, res) => {
    try {
        // Check if the user making the request is authorized (admin or secretary)
        if (req.user.role !== 'admin' && req.user.role !== 'secretary') {
            return res.status(403).json({ error: 'Unauthorized access' });
        }

        // Extract guardian ID from request parameters
        const { id } = req.params;

        // Extract updated guardian data from request body
        const { firstname, dateOfbirth, lastname, gender, username, guardian_pwd, civilState, email, phone_number, address, acc_pic } = req.body;

        // Find the guardian by ID and update its data
        const [updated] = await Guardian.update({
            firstname,
            dateOfbirth,
            lastname,
            gender,
            username,
            guardian_pwd,
            civilState,
            email,
            phone_number,
            address,
            acc_pic
        }, {
            where: { guardian_id: id }
        });

        if (updated === 0) {
            return res.status(404).json({ error: 'Guardian not found' });
        }

        // Respond with success message
        res.status(200).json({ message: 'Guardian updated successfully' });
    } catch (error) {
        console.error('Error updating guardian:', error);
        res.status(500).json({ error: 'Failed to update guardian account' });
    }
};

module.exports = {
    createGuardian,
    deleteGuardian,
    editGuardian
};
