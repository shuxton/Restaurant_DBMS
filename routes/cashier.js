const express = require('express');
const router = express.Router();
const cashier = require('../controllers/cashier');

router.route('/cashier')
    .get(cashier.getCashier)

router.route('/cashier/payment')
    .get(cashier.getPayment)
    .post(cashier.postPayment)


module.exports = router;