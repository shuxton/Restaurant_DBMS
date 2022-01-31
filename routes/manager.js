const express = require('express');
const router = express.Router();
const manager = require('../controllers/manager');

router.route('/manager/menu')
    .get(manager.getMenu)
    .post(manager.postMenu)
    .delete(manager.deleteMenu)

router.route('/manager/staff')
    .get(manager.getStaff)
    .post(manager.postStaff)
    .delete(manager.deleteStaff)


router.route('/manager/leaves')
    .get(manager.getLeaves)
    .post(manager.postLeaves)



module.exports = router;