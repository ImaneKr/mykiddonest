const express = require('express');
const router = express.Router();
import auth from '../controllers/authentication';

router.route('/login').post(auth.login);
router.route('/logout').get(auth.logout);

module.exports = router;