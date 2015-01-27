/**
 * Created by magma2011 on 2015-01-27.
 */

var sys = require('sys')
var exec = require('child_process').exec;

function puts(error, stdout, stderr){
    console.log(stdout);
    sys.puts(stdout);
}
exec("ls -la", puts);

//execScript('ls -al');