var mysql = require('mysql2');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

module.exports.getCashier =  (req, res)=> {
    if (! req.session.userId || req.session.userType != 'Cashier') 
    res.redirect('/login')
 else {
    var orders = []
    try {
        var params = []
        var sql = 'select o.*,t.tableNo from orders o inner join tables t on o.customerId = t.customerId order by create_date;'
        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                console.log(error);
            


            orders = results

            res.render('cashier/cashier', {orders});


        });
    } catch (e) {
        console.log(e);
        res.render('cashier/cashier', {orders});
    }
}
};

module.exports.getPayment =  (req, res)=> {
    if (! req.session.userId || req.session.userType != 'Cashier') 
    res.redirect('/login')
 else {
    var order = null,
        items = []
    try {
        var params = []
        var sql = 'call order_details(?);'
        params = [req.query.orderNo]  //to be fixed


        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                console.log(error);
            


            order = results[0]
            if (order) 
                order = order[0]

            items = results[1]
            res.render('cashier/invoice', {order, items});


        });
    } catch (e) {
        console.log(e);
        res.render('cashier');
    }
}

};


module.exports.postPayment =  (req, res)=> {
    if (! req.session.userId || req.session.userType != 'Cashier') 
    res.json({error:'Unauthorised'})
 else {
    try {
        var params = []
        var sql = "call order_update(?,?)"
        params = ['C',req.body.orderNo]


        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                console.log(error);
            


            res.json({success: "Success"});


        });
    } catch (e) {
        console.log(e);
        res.json({error: "Error"});

    }
}
};
