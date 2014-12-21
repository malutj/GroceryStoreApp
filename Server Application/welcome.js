/*var http = require('http');
http.createServer(function(req, res){
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Welcome to Necron99\n');
}).listen(3000, '0.0.0.0');
console.log('Server running at http://0.0.0.0:3000');*/

var express = require('../workspace/node_modules/express');
var mysql = require('../workspace/node_modules/mysql');
var app = express();

var connection = mysql.createConnection({
    host    :    'localhost',
    user    :    'dev1',
    password:    'dev1',
    database:    'GSDB'
});



app.get('/', function (req, res) {
  res.send('Welcome to Necron99');
  Log("INFO", "Received an http request for /");
});

app.get('/test', function (req, res){
    connection.query('SELECT firstname, lastname FROM USERS', function(err, rows, fields){
        if(err){
            Log("INFO","There was an error querying the database");
            throw err;
        }
        var users = "Users<br>";
        rows.forEach(function(element, index){
           users = users + element.firstname+" "+element.lastname+"<br>";
        });        
        Log("INFO", "Finished building query results:\n--------------------\n"+users+"\n--------------------");
        res.send(users);
        Log("INFO","Finished sending results");
    });
    //Log("\nINFO", "Received an http request for /test"); 
});

app.listen(3000);

process.on('SIGINT', function(){
    Log("INFO","Received SIGINT. Stopping express server");
    process.exit(0);
});

Log("\nINFO","Express server listening on 0.0.0.0:3000");

function Log(type, msg){
    var d = new Date();
    var datetime = "\t["+(d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear()+"  "+
        (d.getHours()+1)+":"+(d.getMinutes()+1)+":"+(d.getSeconds()+1)+"]\t";
    console.log(type+datetime+msg);
}