var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

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

    module.exports.getHomePage =  (req, res)=> {
        res.render('pages/index');
    };

    module.exports.getLogin =  (req, res)=> {
        res.render('auth/login');
    };

    module.exports.getSignUp =  (req, res)=> {
        res.render('auth/signup');
    };

    module.exports.postSignUp =  (req, res)=> {
        try {
            console.log(req.body)
            var params = []
            var sql = 'call customer_signup(?,?,?,?)'
            params = [req.body.email, req.body.password, req.body.name, req.body.phone,]

            connection.query(sql, params, function (error, results, fields) {
                if (error) 
                    console.log(error);
                

                    res.redirect('/login');
                
            });
        } catch (e) {
            console.log(e);

        }


    };


    module.exports.postLogin =  (req, res)=> {
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


    };