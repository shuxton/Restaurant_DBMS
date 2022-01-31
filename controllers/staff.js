var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin',
    database: 'restaurant',
    multipleStatements: true
});


connection.connect();

module.exports.getStaff =  (req, res)=> {
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
};

module.exports.postAttendance =  (req, res)=> {
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
};


module.exports.postLeave =  (req, res)=> {
    if (! req.session.userId || req.session.userType == 'Customer')  //to be fixed
    res.json({error:"Unauthorised"})
 else {
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
};


