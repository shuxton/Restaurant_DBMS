var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

module.exports.getCustomer = (req, res) => {

    if (!req.session.userId || req.session.userType != 'Customer') 
        res.redirect('/login')
     else {
        var tableStatus = null,
            menu = []
        try {
            var params = []
            var sql = "select tableNo from tables where customerId=? and isOccupied='Y' limit 1;"
            params = [req.session.userId]
            console.log(req.session.userId)

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Table No: ', results.length, results);
                if (results.length > 0) 
                    tableStatus = results[0]['tableNo']


                


                console.log(tableStatus)
                if (! tableStatus) 
                    tableStatus = null
                 else 
                    tableStatus = "Table no. " + tableStatus + " assigned"

                 connection.query("select * from menu where isAvailable='Y'", [], function (error, results, fields) {
                    if (error) 
                        console.log(error);
                    


                    console.log('Menu: ', results.length);
                    menu = results

                    var orderNo = null
                    connection.query("select orderNo from orders where status<>'C' and customerId=? limit 1", [req.session.userId], function (error, results, fields) {
                        if (error) 
                            console.log(error);
                        


                        console.log('Order No ', results.length);

                        if (results.length > 0) 
                            orderNo = results[0]['orderNo']


                        


                        res.render('customer/customer', {tableStatus, menu, orderNo});

                    })

                })


            });
        } catch (e) {
            console.log(e);
            tableStatus = null

            res.render('customer/customer', {tableStatus, menu});

        }
    }

};

module.exports.postTable = (req, res) => {
    if (!req.session.userId || req.session.userType != 'Customer') 
        res.json({error: "Unauthorised"});
     else {
        try {
            console.log(req.body)
            var params = []
            var sql = 'call assign_table(?,?,@tableNo); select @tableNo;'
            params = [
                req.session.userId,
                req.body.capacity == "" ? 0 : req.body.capacity
            ]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results[0].affectedRows);

                if (results[1][0]['@tableNo']) 
                    res.json({
                        success: "Table " + results[1][0]['@tableNo'] + " Assigned"
                    });
                 else 
                    res.json({error: "No table is available. Please try again later"});
                


            });
        } catch (e) {
            console.log(e);
            res.json({error: "No table is available. Please try again later"});

        }
    }

};


module.exports.postOrder = (req, res) => {
    if (!req.session.userId || req.session.userType != 'Customer') 
        res.json({error: "Unauthorised"});
     else {
        try {

            var orderNo = null
            var sgst = parseFloat(req.body.total) * 2.5 / 100
            var cgst = sgst;
            var total = sgst + cgst + parseFloat(req.body.total)
            var params = []
            var sql = 'call customer_order(@orderNo,?,?,?,?,?,?,?); select @orderNo;'
            params = [
                req.session.userId,
                cgst,
                sgst,
                total,
                req.body.total,
                'P',
                null
            ]


            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results[0].affectedRows);
                orderNo = results[1][0]['@orderNo']

                sql = "call customer_order_item(?,?,?);"
                for (var i = 0; i < req.body.items.length; i++) 
                    connection.query(sql, [
                        orderNo, req.body.items[i].itemNo,
                        req.body.items[i].quantity
                    ], function (error, results, fields) {
                        if (error) 
                            console.log(error);
                        


                        console.log('Item inserted ', results.affectedRows);

                    });
                


            });

            res.json({success: "Success"});
        } catch (e) {
            console.log(e);
            res.json({error: "Error accoured"});

        }
    }


};

module.exports.getInvoice = (req, res) => {
    if (!req.session.userId || req.session.userType != 'Customer') 
        res.redirect("/Login")
     else {
        var order = null,
            items = []
        try {
            var params = []
            var sql = 'call order_details(?);'
            params = [req.query.orderNo]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                order = results[0]
                if (order.length > 0) {
                    order = order[0]
                    items = results[1]
                    if (order.customerId != req.session.userId) 
                        res.redirect('/customer')
                     else 
                        res.render('customer/invoice', {order, items});
                    

                } else {
                    res.redirect('/customer')
                }


            });
        } catch (e) {
            console.log(e);
            res.render('customer');
        }
    }
};
