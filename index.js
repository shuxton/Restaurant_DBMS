var express = require('express');
var bodyParser = require('body-parser')

var routes = require('./routes/index.js');
var port = process.env.PORT || 3000;

var app = express();

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use('/public', express.static(process.cwd() + '/public'));
app.set('view engine', 'ejs');



routes(app);


app.listen(port, function() {
    console.log('Server listening on port ' + port + '...');
});