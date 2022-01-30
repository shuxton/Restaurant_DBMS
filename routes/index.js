var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();


module.exports = function (app) {
    app.get('/', function (req, res) {
        res.render('pages/index');
    });

    app.get('/generic', function (req, res) {
        res.render('pages/generic');
    });

    app.get('/element', function (req, res) {
        res.render('pages/element');
    });

    function getStaffRole(roleId){
        switch(roleId){
           case 1: return "Cheff";
           case 2: return "Waiter";
           case 3: return "Cashier";
           case 4: return "Other";
           case 5: return "Manager";
           default: return "None";
        }
    }

    // ----------------------------------------------------------------------------------


    app.get('/login', function (req, res) {
        res.render('auth/login');
    });

    app.get('/signup', function (req, res) {
        res.render('auth/signup');
    });

    app.post('/signup', function (req, res) {
        try {
            console.log(req.body)
            var params = []
            var sql = 'call customer_signup(?,?,?,?)'
            params = [req.body.email, req.body.password, req.body.name, req.body.phone,]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                

                console.log('Rows affected ', results[0].affectedRows);

                if (results[0].affectedRows > 0) 
                    res.redirect('/login');
                 else 
                    res.redirect("/signup")
                
            });
        } catch (e) {
            console.log(e);

        }


    });


    app.post('/login', function (req, res) {
        try {
            var staff =false
            if(req.body.email.split('@')[1]=="staff.com") staff =true
            console.log(req.body)
            var params = []
            var sql = 'call customer_login(?,?)'
            if(staff) sql = 'call staff_login(?,?)'
            params = [req.body.email, req.body.password]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                

                console.log('Rows affected ', results);
                console.log(results)

                if (results[0].length > 0) {
                    if(!staff){
                    req.session.userId = results[0][0].customerId?results[0][0].customerId:null;
                    req.session.userType = 'Customer';
                    res.redirect('/customer');
                    } else{
                        req.session.userId = results[0][0].staffId?results[0][0].staffId:null;
                        req.session.userType = getStaffRole(results[0][0].roleId?results[0][0].roleId:null);
                        res.redirect('/staff');
                    }
                    

                } else 
                    res.redirect('/login');
                
            });
        } catch (e) {
            console.log(e);
            res.redirect('/login');

        }


    });
    // ----------------------------------------------------------------------------------

    app.get('/customer', function (req, res) {

        if (! req.session.userId && req.session.userType != 'Customer') 
            res.redirect('/login')
         else {
            var tableStatus = null,
                menu = []
            try {
                var params = []
                var sql = "select tableNo from tables where customerId=? and isOccupied='Y' limit 1;"
                params = [req.session.userId]
                console.log(req.session, "session")

                console.log(params)


                connection.query(sql, params, function (error, results, fields) {
                    if (error) 
                        console.log(error);
                    


                    console.log('Rows affected ', results.length);
                    if (results.length > 0) 
                        tableStatus = results[0]['tableNo']

                    

                    if (! tableStatus) 
                        tableStatus = null
                     else 
                        tableStatus = "Table no. " + tableStatus + " assigned"

                     connection.query("select * from menu where isAvailable='Y'", [], function (error, results, fields) {
                        if (error) 
                            console.log(error);
                        


                        console.log('Rows affected ', results.length);
                        menu = results

                        var orderNo = null
                        connection.query("select orderNo from orders where status<>'C' and customerId=? limit 1", [req.session.userId], function (error, results, fields) {
                            if (error) 
                                console.log(error);
                            


                            console.log('Rows affected ', results.length);
                            console.log(results,results[0]['orderNo'])
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

    });

    app.post('/customer/table', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Customer') 
            res.json({error: "Unauthorised"});
         else {
            try {
                console.log(req.body)
                var params = []
                var sql = 'call assign_table(?,?,@tableNo); select @tableNo;'
                params = [
                    req.session.customerId,
                    req.body.capacity == "" ? 0 : req.body.capacity
                ]

                console.log(params)


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

    });


    app.post('/customer/placeorder', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Customer') 
            res.json({error: "Unauthorised"});
         else {
            try { // var obj = JSON.parse(req.body)
                console.log(req.body)
                var orderNo = null
                var sgst = parseFloat(req.body.total) * 2.5
                var cgst = sgst;
                var total = sgst + cgst + parseFloat(req.body.total)
                var params = []
                var sql = 'call customer_order(@orderNo,?,?,?,?,?,?,?); select @orderNo;'
                params = [
                    req.body.customerId,
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


    });
    // ----------------------------------------------------------------------------------

    app.get('/customer/invoice', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Customer') 
            res.redirect("/Login")
         else {
            var order = null,
                items = []
            try {
                var params = []
                var sql = 'call order_details(?,?);'
                params = [req.query.orderNo, req.session.userId]


                connection.query(sql, params, function (error, results, fields) {
                    if (error) 
                        console.log(error);
                    


                    order = results[0]
                    if (order) 
                        order = order[0]


                    


                    items = results[1]
                    res.render('customer/invoice', {order, items});


                });
            } catch (e) {
                console.log(e);
                res.render('customer');
            }
        }
    });

    // ----------------------------------------------------------------------------------

    app.get('/cookingStaff', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Cheff') 
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
                


                orders = results[0]
                items = results[1]

                res.render('cookingStaff/cookingStaff', {orders, items});


            });
        } catch (e) {
            console.log(e);
            res.render('cookingStaff/cookingStaff', {orders, items});
        }
    }
    });

    app.post('/cookingStaff', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Cheff') 
        res.json({error:"Unauthorised"})
     else {
        try {
            var params = []
            var sql = 'update orders set status=? where orderNo=?;'
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
    });


    app.get('/cashier', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Cashier') 
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
    });

    app.get('/cashier/payment', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Cashier') 
        res.redirect('/login')
     else {
        var order = null,
            items = []
        try {
            var params = []
            var sql = 'call order_details(?,?);'
            params = [req.query.orderNo, req.query.customerId]  //to be fixed


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

    });


    app.post('/cashier/payment', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Cashier') 
        res.json({error:'Unauthorised'})
     else {
        try {
            var params = []
            var sql = "update orders set status='C' where orderNo=?"
            params = [req.body.orderNo]


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
    });

    // -------------------------------------------------------------------------------------

    app.get('/staff', function (req, res) {
        if (! req.session.userId || req.session.userType == 'Customer') 
        res.redirect('/login')
     else {
        var menu = [],
            params = []
        try {
            var date = new Date()
            params = [
                req.session.userId,
                date.toISOString().slice(0, 19).split('T')[0],
                new Date(date.getFullYear(), date.getMonth(), 1).toISOString().slice(0, 19).split('T')[0],
                new Date(date.getFullYear(), date.getMonth() + 1, 0).toISOString().slice(0, 19).split('T')[0],
                new Date(date.getFullYear(), date.getMonth(), 1).toISOString().slice(0, 19).split('T')[0],
                new Date(date.getFullYear(), date.getMonth() + 1, 0).toISOString().slice(0, 19).split('T')[0],
                req.session.userId
            ]

            // console.log(params)

            connection.query("select clockIn,clockOut from attendance where staffId=? and day=?;select count(*) as total from attendance where day>=? and day<=?; select count(*) as absent from attendance where day>=? and day<=? and isPresent='N' ; select * from leaves where staffId=? order by leaveId desc;", params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                

                console.log(results);

                res.render('staff/attendance', {
                    clockIn:results[0][0] && results[0][0].clockIn? results[0][0].clockIn.toISOString().slice(0, 19).replace('T', ' '):null,
                    clockOut:results[0][0] && results[0][0].clockOut? results[0][0].clockOut.toISOString().slice(0, 19).replace('T', ' '):null,
                    total: results[1][0] && results[1][0].total?results[1][0].total :null,
                    absent:results[2][0] && results[2][0].absent? results[2][0].absent :null,
                    leaves: results[3]
                });


            })
        } catch (e) {
            console.log(e)
            res.render('staff/attendance');

        }}
    });

    app.post('/attendance', function (req, res) {
        if (! req.session.userId || req.session.userType == 'Customer') 
        res.json({error:"Unauthorised"})
     else {
        var menu = [],
            params = []
        try {
            var date = new Date()
            if (req.body.clockIn) 
                params = [
                    req.session.userId,
                    date.toISOString().slice(0, 19).replace('T', ' '),
                    null,
                    date.toISOString().slice(0, 19).split('T')[0],
                    'Y'
                ]
             else 
                params = [
                    req.session.userId,
                    null,
                    date.toISOString().slice(0, 19).replace('T', ' '),
                    date.toISOString().slice(0, 19).split('T')[0],
                    'Y'
                ]

             connection.query('call attendance(?,?,?,?,?);', params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('The menu: ', results.affectedRows);
                menu = results

                res.json({success: "Success"});


            })
        } catch (e) {
            console.log(e)
            res.json({error: "Error"});

        }}
    });


    app.post('/attendance/leave/:staffId', function (req, res) {
        if (! req.session.userId || req.session.userType == 'Customer')  //to be fixed
        res.json({error:"Unauthorised"})
     else {
        var menu = [],
            params = []
        try {
            var date = new Date()

            params = [
                req.session.userId,
                req.body.fromDate,
                req.body.toDate,
                'P',
                req.body.reason,
            ]


            connection.query('insert into leaves (staffId,fromDate,toDate,status,reason) values (?,?,?,?,?);', params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Affected rows - : ', results.affectedRows);

                res.redirect("/attendance");


            })
        } catch (e) {
            console.log(e)
            res.redirect("/attendance");

        }}
    });

    // -------------------------------------------------------------------------------------

    app.get('/manager/menu', function (req, res) {

        if (! req.session.userId && req.session.userType != 'Manager') 
        res.redirect('/login')
     else {
        var menu = []

        try {
            connection.query('SELECT * from menu', function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('The menu: ', results.length);
                menu = results

                res.render('manager/menu', {menu});


            })
        } catch (e) {
            console.log(e)
        }}
    });


    app.post('/manager/menu', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.redirect('/login')
     else {
        try {
            console.log(req.body)
            var params = []
            if (req.body.itemno) {
                var sql = 'call menu_update(?,?,?,?,?,?,?,?)'
                params = [
                    req.body.itemno,
                    req.body.name,
                    req.body.price,
                    req.body.vegetarian ? "Y" : "N",
                    req.body.special ? "Y" : "N",
                    req.body.trending ? "Y" : "N",
                    req.body.available ? "Y" : "N",
                    req.body.description,
                ]

            } else {
                var sql = 'call menu_create(?,?,?,?,?,?,?)'
                params = [
                    req.body.name,
                    req.body.price,
                    req.body.vegetarian ? "Y" : "N",
                    req.body.special ? "Y" : "N",
                    req.body.trending ? "Y" : "N",
                    req.body.available ? "Y" : "N",
                    req.body.description,
                ]

            } connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results.affectedRows);

            });
        } catch (e) {
            console.log(e);
        }

        res.redirect('/manager/menu');
    }
    });


    app.delete('/manager/menu/:id', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.json({error:"Unauthorised"})
     else {
        try {
            var params = [req.params.id]

            var sql = 'delete from menu where itemNo=?'
            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results.affectedRows);

            });
        } catch (e) {
            console.log(e)
        }


        res.json({success: "Success"});
    }
    });


    // -------------------------------------------------------------------------------------


    app.get('/manager/leaves', function (req, res) {
        
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.redirect('/login')
     else {
        var leaves = [],
            staff = [],
            roles = []
        try {
            connection.query('SELECT * from leaves', function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                leaves = results

                console.log('Leaves: ', leaves.length);

                res.render('manager/leaves', {leaves});


            })
        } catch (e) {
            console.log(e)
        }
    }
    });


    app.post('/manager/leaves/:id', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.json({error:"Unauthorised"})
     else {
        try {
            console.log(req.body, req.params)
            var params = []
            var sql = 'update leaves set status=? where leaveId=?'
            params = [req.body.status, req.params.id,]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results.affectedRows);

            });
        } catch (e) {
            console.log(e);
        }

        res.redirect('/manager/leaves');
    }
    });


    // -------------------------------------------------------------------------------------


    app.get('/manager/staff', function (req, res) {
        
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.redirect('/login')
     else {
        var staff = [],
            roles = []
        try {

            connection.query('SELECT * from staff', function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('The staff: ', results.length);
                staff = results
                connection.query('SELECT * from roles', function (error, results, fields) {
                    if (error) 
                        console.log(error);
                    


                    console.log('The roles: ', results.length);
                    roles = results

                })

            })

        } catch (e) {
            console.log(e)
        }
        res.render('manager/staff', {staff, roles});

    }
    });

    app.post('/manager/staff', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.json({error:"Unauthorised"})
     else {
        try {
            console.log(req.body)
            var params = []
            if (req.body.itemno) {
                var sql = 'call staff_update(?,?,?,?,?,?,?,?,?)'
                params = [
                    req.body.staffId,
                    req.body.email,
                    req.body.password,
                    req.body.name,
                    req.body.phone,
                    req.body.address,
                    req.body.pan ? req.body.panNo : null,
                    req.body.aadhar ? req.body.aadharNo : null,
                    req.body.roleId
                ]

            } else {
                var sql = 'call staff_signup(?,?,?,?,?,?,?,?)'
                params = [
                    req.body.email,
                    req.body.password,
                    req.body.name,
                    req.body.phone,
                    req.body.address,
                    req.body.pan ? req.body.panNo : null,
                    req.body.aadhar ? req.body.aadharNo : null,
                    req.body.roleId
                ]

            } connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results.affectedRows);

            });
        } catch (e) {
            console.log(e);
        }

        res.redirect('/manager/staff');
    }
    });


    app.delete('/manager/staff/:id', function (req, res) {
        if (! req.session.userId && req.session.userType != 'Manager') 
        res.json({error:"Unauthorised"})
     else {
        try {
            var params = [req.params.id]

            var sql = 'delete from staff where staffId=?'
            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                


                console.log('Rows affected ', results.affectedRows);

            });
        } catch (e) {
            console.log(e)
        }
        res.json({success: "Success"});
    }
    });

    // -------------------------------------------------------------------------------------


};
