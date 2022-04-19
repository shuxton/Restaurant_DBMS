var mysql = require('mysql2');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

module.exports.getCookingStaff =  (req, res)=> {
    if (! req.session.userId || req.session.userType != 'Cheff') 
    res.redirect('/login')
 else {
    var orders = [],
        items = []
    try {
        var params = []
        var sql = 'call cooking_staff();'
        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                console.log(error);
            

console.log(results)
            orders = results[0]
            items = results[1]

            res.render('cookingStaff/cookingStaff', {orders, items});


        });
    } catch (e) {
        console.log(e);
        res.render('cookingStaff/cookingStaff', {orders, items});
    }
}
};

module.exports.postCookingStaff =  (req, res)=> {
    if (! req.session.userId || req.session.userType != 'Cheff') 
    res.json({error:"Unauthorised"})
 else {
    try {
        var params = []
        var sql = 'call order_update(?,?)'
        params = [req.body.status, req.body.orderNo]
        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                console.log(error);
            


            console.log("Affected rows - " + results.affectedRows)

            res.json({success: "Success"});


        });
    } catch (e) {
        console.log(e);
        res.json({error: "Error"});
    }
}
};
