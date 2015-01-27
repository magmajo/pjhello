/**
 * Created by magma2011 on 2015-01-19.
 *
 * http://nodejs.org/api/http.html
 *
 */

var express = require('express');
var http = require('http');
var async = require('async');

var APP_EXPRESS_SERVER_ADDRESS = '192.168.0.13';
var APP_EXPRESS_SERVER_PORT = 4000;

var APP_HTTP_SERVER_ADDRESS = '192.168.0.13';
var APP_HTTP_SERVER_PORT = 4001;

/* 01. express server */
var app = express();
app.get('/', function (req, res) {
    res.send('Hello World [from Express Server]');
});
var _exprServer = app.listen(APP_EXPRESS_SERVER_PORT, function () {
    console.log('Express Server running at http://%s:%d', APP_EXPRESS_SERVER_ADDRESS, APP_EXPRESS_SERVER_PORT);
});

/* 02. http server */
var _httpServer = http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World [from Http Server]\n');
}).listen(APP_HTTP_SERVER_PORT, APP_HTTP_SERVER_ADDRESS);
console.log('Http Server running at http://%s:%d', APP_HTTP_SERVER_ADDRESS, APP_HTTP_SERVER_PORT);
