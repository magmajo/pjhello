var app = require('../app');
var supertest = require('supertest')

describe('dhhello testting ...', function() {

  it('GET http://192.168.0.13/api/hello/hello=HelloWorld', function(done) {
      supertest(app)
        .get('/api/hello/hello=HelloWorld')
        .expect('Content-Type', /html/)
        //.expect('Content-Length', '20')
        //.set('Accept', 'application/html')
        .expect(200)
        .expect(/HelloWorld/)
        .end(function (err, res) {
            if (err) done(err);
            else done();
        });
  });

  it('GET http://192.168.0.13/api/async/async=hello', function(done) {
      supertest(app)
        .get('/api/hello/hello=HelloWorld')
        .expect('Content-Type', /html/)
        //.expect('Content-Length', '20')
        .expect(200)
        .expect(/HelloWorld/)
        .end(function (err, res) {
            if (err) done(err);
            else done();
        });
  });

});