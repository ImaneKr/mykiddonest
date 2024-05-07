const { Guardian, Staff } = require('../models/models'); 
const bcrypt = require("bcrypt");

// Controller function to create a new staff account
async function createStaff(req, res) {
  try {
      // Check if the user creating the account is a secretary or admin
      /*  const { role } = req.Staff; // Assuming user's role is stored in req.user.role
        if (role !== 'secretary' && role !== 'admin') {
            return res.status(403).json({ error: 'Unauthorized' });
        }*/

      const { firstname, lastname, username, role, staff_pic, phone_number, email, salary, staff_pwd } = req.body;
      const salt = bcrypt.genSaltSync(10);
      const hashedPassword = bcrypt.hashSync(req.body.staff_pwd, salt);
  
      // Create the guardian account
      const staff = await Staff.create({
          firstname: firstname,
          lastname: lastname,
          username: username,
          role:role,
          staff_pic: staff_pic,
          phone_number: phone_number,
          email: email,
          salary: salary,
          staff_pwd: hashedPassword,
      });
        console.log(staff.staff_pwd);
        console.log("----------");
        console.log(hashedPassword);
      return res.status(201).json(staff);
  } catch (error) {
     console.error('Error creating staff:', error);
      return res.status(500).json({ error: 'Failed to create staff account' });
  }
}
// Controller function to delete a staff account
async function deleteStaff (req, res)  {
  try {
    // Check if the user making the request is authorized (admin or secretary)
    if (req.user.role !== 'admin' && req.user.role !== 'secretary') {
      return res.status(403).json({ error: 'Unauthorized access' });
    }

    const { id } = req.params;

    // Find the staff by ID and delete it
    const deletedStaff = await Staff.destroy({ where: { staff_id: id } });

    if (deletedStaff === 0) {
      return res.status(404).json({ error: 'Staff not found' });
    }

    // Respond with success message
    res.status(200).json({ message: 'Staff deleted successfully' });
  } catch (error) {
    console.error('Error deleting staff:', error);
    res.status(500).json({ error: 'Failed to delete staff account' });
  }
};

// Controller function to edit a staff account
async function editStaff(req, res) {
  try {
    // Check if the user making the request is authorized (admin or secretary)
    if (req.user.role !== 'admin' && req.user.role !== 'secretary') {
      return res.status(403).json({ error: 'Unauthorized access' });
    }

    const { id } = req.params;
    const {
      firstname,
      lastname,
      username,
      role,
      staff_pic,
      phone_number,
      email,
      salary,
      staff_pwd
    } = req.body;

    // Find the staff by ID and update its data
    const [updated] = await Staff.update(
      {
        firstname,
        lastname,
        username,
        role,
        staff_pic,
        phone_number,
        email,
        salary,
        staff_pwd
      },
      { where: { staff_id: id } }
    );

    if (updated === 0) {
      return res.status(404).json({ error: 'Staff not found' });
    }

    // Respond with success message
    res.status(200).json({ message: 'Staff updated successfully' });
  } catch (error) {
    console.error('Error updating staff:', error);
    res.status(500).json({ error: 'Failed to update staff account' });
  }
};

module.exports = {
  createStaff,
  deleteStaff,
  editStaff
};