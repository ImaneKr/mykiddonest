const { Guardian, Staff } = require('../models/models'); // Import the Guardian model

// Controller for creating a guardian account
async function createGuardian(req, res) {
    try {
        // Check if the user creating the account is a secretary or admin
        /*  const { role } = req.Staff; // Assuming user's role is stored in req.user.role
          if (role !== 'secretary' && role !== 'admin') {
              return res.status(403).json({ error: 'Unauthorized' });
          }*/

        const { firstname, lastname, gender, username, guardian_pwd, civilState, email, phone_number, address, acc_pic } = req.body;

        // Create the guardian account
        const guardian = await Guardian.create({
            firstname: firstname,
            lastname: lastname,
            gender: gender,
            username: username,
            guardian_pwd: guardian_pwd,
            civilState: civilState,
            email: email,
            phone_number: phone_number,
            address: address,
            acc_pic: acc_pic
        });

        return res.status(201).json(guardian);
    } catch (error) {
        console.error('Error creating guardian:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Controller for editing a guardian account
async function editGuardian(req, res) {
    try {
        const { guardian_id } = req.params;
        const { firstname, dateOfbirth, lastname, gender, username, guardian_pwd, civilState, email, phone_number, address, acc_pic } = req.body;

        // Find the guardian account by guardian_id
        let guardian = await Guardian.findByPk(guardian_id);
        if (!guardian) {
            return res.status(404).json({ error: 'Guardian not found' });
        }

        // Update the guardian account
        guardian = await guardian.update({
            firstname: firstname,
            lastname: lastname,
            gender: gender,
            username: username,
            guardian_pwd: guardian_pwd,
            civilState: civilState,
            email: email,
            phone_number: phone_number,
            address: address,
            acc_pic: acc_pic
        });

        return res.status(200).json(guardian);
    } catch (error) {
        console.error('Error editing guardian:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

// Controller for fetching all guardian data
async function getAllGuardians(req, res) {
    try {
        // Fetch all guardians
        const guardians = await Guardian.findAll();

        return res.status(200).json(guardians);
    } catch (error) {
        console.error('Error fetching all guardians:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
}

module.exports = { createGuardian, editGuardian, getAllGuardians };
