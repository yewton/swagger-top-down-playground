var execSync = require('child_process').execSync;
var exec = require('child_process').exec;
var foxy = require('foxy');
var gulp = require('gulp');
var gutil = require('gulp-util');
var multi = require('multiline');
var open = require('gulp-open');
var waitOn = require('wait-on');

var editorPort = {production: 3000, staging: 3001};
var editorContainerName = 'swagger-editor-playground';

gulp.task('build-swagger', function(cb) {
  var wait_max = 2;
  var wait_count = 0;
  function onExecEnd(error, stdout, stderr) {
    if (stdout) {
      console.log(gutil.colors.green(stdout));
    }
    if (stderr) {
      console.log(gutil.colors.yellow(stderr));
    }
    if (error !== null) {
      console.log(gutil.colors.red('exec error: ' + error));
    }
    if (wait_max === ++wait_count) {
      cb();
    }
  }
  ['staging', 'production'].forEach(function(env) {
    var cmd = 'docker run --rm -v "$PWD"/target/' + env + '/swagger:/gen' +
        ' -v "$PWD"/api_spec:/api_spec' +
        ' -e "RAILS_ENV=' + env + '" yewton/swagger-blocks_ext' +
        ' swagger:gen[/gen/swagger.yaml,/api_spec/root,/api_spec/descriptions]'
    console.log(gutil.colors.cyan(cmd));
    exec(cmd, onExecEnd);
  });
});

gulp.task('run-editor', function() {
  var env = gutil.env.env || 'production'
  var name = editorContainerName + '-' + env
  var cmd = '((docker ps --format "{{.Names}}" | grep ' + name + ') && echo "Already running.") || ' +
      ' docker run -d --name ' + name +
      ' -v "$PWD"/target/' + env +'/swagger:/runtime/dist/spec-files' +
      ' -p ' + editorPort[env] + ':3000 yewton/swagger-pseudo-live-preview';
  console.log(gutil.colors.cyan(cmd));
  console.log(execSync(cmd).toString());
});

gulp.task('stop-editor', function() {
  var envs = ['staging', 'production']
  if (gutil.env.env) {
    envs = [gutil.env.env]
  }
  envs.forEach(function(env) {
    console.log(execSync('docker rm -f ' + editorContainerName + '-' + env).toString());
  });
});

gulp.task('serve', ['run-editor', 'build-swagger'], function() {
  var env = gutil.env.env || 'production'
  var accessUri = 'http://' + gutil.env.editorHost + ':' + editorPort[env];
  console.log(accessUri);
  waitOn({
    resources: [accessUri], delay: 0, interval: 1000, timeout: 30000
  }, function (err) {
    if (err) { throw err; }
    gulp.src('').pipe(open({uri: accessUri}));
  });

  ['rb', 'md'].forEach(function(ext) {
    gulp.watch('./api_spec/**/*.' + ext, ['build-swagger']);
  });
});
