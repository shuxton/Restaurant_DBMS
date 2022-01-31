const express = require('express');
const router = express.Router();
const cookingStaff = require('../controllers/cookingStaff');

router.route('/cookingStaff')
    .get(cookingStaff.getCookingStaff)
    .post(cookingStaff.postCookingStaff)

module.exports = router;