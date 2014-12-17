/*var http = require('http');
http.createServer(function(req, res){
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Welcome to Necron99\n');
}).listen(3000, '0.0.0.0');
console.log('Server running at http://0.0.0.0:3000');*/

var express = require('../workspace/node_modules/express');
var app = express();

app.get('/', function (req, res) {
  res.send('Welcome to Necron99')
  Log("INFO", "Recieved an http request");
});

app.listen(3000);

process.on('SIGINT', function(){
    Log("INFO","Received SIGINT. Stopping express server")
    process.exit(0)
});

Log("INFO","Express server listening on 0.0.0.0:3000");

function Log(type, msg){
    var d = new Date();
    var datetime = "\t["+(d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear()+"  "+
        (d.getHours()+1)+":"+(d.getMinutes()+1)+":"+(d.getSeconds()+1)+"]\t";
    console.log(type+datetime+msg);
}
