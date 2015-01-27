/*
 http://nodejs.org/docs/latest/api/all.html#process.argv -> node api

 */

var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');


var sys = require('sys');
var exec = require('child_process').exec;
var spawn = require('child_process').spawn;
var $ = require('jquery');
var async = require('async')

//var routes = require('./routes/index');
//var users = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//app.use(express.static('../../'));
//app.use('/', routes);
//app.use('/users', users);

/* http://192.168.0.13:3000/api/hello/helloworld */
app.get('/api/hello/hello=:id', function (req, res) {
    res.send(req.params.id);
});

/* http://192.168.0.13:3000/api/hello/redirect=www.daum.net */
app.get('/api/hello/redirect=:id',function(req, res){
    res.redirect('http://' + req.params.id);
});

/* http://192.168.0.13:3000/api/async/async=hello */
app.get('/api/async/async=:id',function(req, res){
    async.waterfall([
        function(callback){callback(null, 'one', 'two');},
        function(arg1, arg2, callback){callback(null, arg1+' : '+arg2);},
        function(arg1, callback){callback(null, arg1+' : '+'end');}
    ], function (err, result) {
        res.send('result : ' + result + ' (' +req.params.id+')'  );
    });
});


/* http://192.168.0.13:3000/api/jasmine/jasmine=hello */
app.get('/api/jasmine/jasmine=:id',function(req, res){
    res.send('result :' + req.params.id);
    describe('jasmine-node', function(){
        var request = require('request');
        it("should respond with hello world", function(done) {
            //setTimeout(function(){
            request("http://192.168.0.13:3000/api/hello/helloworld", function(error, response, body){
                expect(body).toEqual("Hello World!");
                done();
            });
            //},1);
            //expect(body).toEqual("Hello World!");
        });
    });
});

/* http://192.168.0.13:3000/api/process/exec=ls -al */
app.get('/api/process/exec=:id',function(req, res){
    // res.send('result :' + req.params.id);
    var cmd = req.params.id;
    function puts(error, stdout, stderr){
        if(error == null && stderr == ''){
            res.send(stdout);
            sys.puts(stdout);
        }else{
            if(error != null){res.send('result :\n' + error.message);}
            else{res.send('result :\n' + stderr);}
        }
    }
    exec(cmd, puts);
    //execScript('ls -al');
});


/* http://192.168.0.13:3000/api/hello/jquery=hello */
/*
app.get('/api/hello/jquery=:id',function(req, res){
    var html;
    $('title').text(req.params.id + '\'s room');
    $('body').append('<h1>Hello world</h1>');
    $('<div></div>').html('who are you...?').appendTo('body');
    //res.writeHead(200,{'Context-Type': 'text/html'});
    //res.end($('<div></div>').html('<iframe src="http://daum.net"></iframe>').appendTo('body').html());
    res.send($('<div></div>').html('<iframe src="http://daum.net"></iframe>').appendTo('body').html());
});
*/

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers
// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

module.exports = app;
