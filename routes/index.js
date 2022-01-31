const express = require('express');
const router = express.Router();
const index = require('../controllers/index');

router.route('/')
    .get(index.getHomePage)

router.route('/login')
    .get(index.getLogin)
    .post(index.postLogin)

router.route('/signup')
    .get(index.getSignUp)
    .post(index.postSignUp)





module.exports = router;




