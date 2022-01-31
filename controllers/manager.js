var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

module.exports.getMenu =  (req, res)=> {
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
}


module.exports.postMenu =  (req, res)=> {
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
};


module.exports.deleteMenu =  (req, res)=> {
    if (! req.session.userId && req.session.userType != 'Manager') 
    res.json({error:"Unauthorised"})
 else {
    try {
        var params = [req.body.id]

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
};


// -------------------------------------------------------------------------------------


module.exports.getLeaves =  (req, res)=> {
    
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
};


module.exports.postLeaves =  (req, res)=> {
    if (! req.session.userId && req.session.userType != 'Manager') 
    res.json({error:"Unauthorised"})
 else {
    try {
        console.log(req.body, req.params)
        var params = []
        var sql = 'update leaves set status=? where leaveId=?'
        params = [req.body.status, req.body.id,]

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
};


// -------------------------------------------------------------------------------------


module.exports.getStaff =  (req, res)=> {
    
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
};

module.exports.postStaff =  (req, res)=> {
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
};


module.exports.deleteStaff =  (req, res)=> {
    if (! req.session.userId && req.session.userType != 'Manager') 
    res.json({error:"Unauthorised"})
 else {
    try {
        var params = [req.body.id]

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
};
