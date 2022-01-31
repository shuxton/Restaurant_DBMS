const express = require('express');
const router = express.Router();
const customer = require('../controllers/customer');

router.route('/customer')
    .get(customer.getCustomer)

router.route('/customer/invoice')
    .get(customer.getInvoice)

router.route('/customer/table')
    .post(customer.postTable)

router.route('/customer/placeorder')
    .post(customer.postOrder)



module.exports = router;