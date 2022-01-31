const express = require('express');
const router = express.Router();
const staff = require('../controllers/staff');

router.route('/staff')
    .get(staff.getStaff)

router.route('/staff/attendance')
    .post(staff.postAttendance)

router.route('/staff/leave')
    .post(staff.postLeave)


module.exports = router;