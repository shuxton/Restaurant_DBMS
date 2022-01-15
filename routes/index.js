var mysql = require('mysql');
var connection = mysql.createConnection({host: 'localhost', user: 'root', password: 'admin', database: 'restaurant'});
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

    app.get('/login', function (req, res) {
        res.render('auth/login');
    });

    app.get('/signup', function (req, res) {
        res.render('auth/signup');
    });

    app.get('/customer', function (req, res) {
        res.render('customer/customer');
    });

    app.get('/invoice', function (req, res) {
        res.render('customer/invoice');
    });

    app.get('/cookingStaff', function (req, res) {
        res.render('cookingStaff/cookingStaff');
    });

    app.get('/cashier', function (req, res) {
        res.render('cashier/cashier');
    });

    app.get('/payment', function (req, res) {
        res.render('cashier/invoice');
    });

    app.get('/attendance', function (req, res) {
        res.render('staff/attendance');
    });

    app.get('/manager', function (req, res) {
        var menu = [],staff=[]
        try {
            connection.query('SELECT * from menu', function (error, results, fields) {
                if (error) 
                    throw error;
                   
                console.log('The menu: ', results.length);
                menu = results
                connection.query('SELECT * from staff', function (error, results, fields) {
                    if (error) 
                        throw error;
                       
                    console.log('The staff: ', results.length);
                    staff = results
                    res.render('manager/manager', {menu,staff});
    
                })
            })
        } catch (e) {
            console.log(e)
        }
    });

    app.post('/manager/staff', function (req, res) {

try{
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
                req.body.address ,
                req.body.panNo ? req.body.panNo : null,
                req.body.aadharNo? req.body.aadharNo:null,
                req.body.roleId
            ]
         
        } else {
            var sql = 'call staff_signup(?,?,?,?,?,?,?,?)'
            params = [
                req.body.email,
                req.body.password,
                req.body.name,
                req.body.phone,
                req.body.address ,
                req.body.panNo ? req.body.panNo : null,
                req.body.aadharNo? req.body.aadharNo:null,
                req.body.roleId
            ]
          
        }
        connection.query(sql, params, function (error, results, fields) {
            if (error) 
                throw error;
            
            console.log('Rows affected ', results.affectedRows);

        });
    }catch(e){
        console.log(e);
    }

        res.redirect('/manager');
    });

    app.delete('/manager/menu/:id', function (req, res) {

try{
        var params = [req.params.id]
        
            var sql = 'delete from menu where itemNo=?'
           connection.query(sql, params, function (error, results, fields) {
            if (error) 
                throw error;
            
            console.log('Rows affected ', results.affectedRows);

        });
    }catch(e){
        console.log(e)
    }


        res.json({success:"Success"});
    });

};
