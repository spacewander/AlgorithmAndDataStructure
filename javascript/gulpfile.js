var gulp   = require('gulp');
var plugins = require('gulp-load-plugins')();

// if you just want to run test in specific file, use `mocha XXX_spec.js` instead
var paths = {
  tests: ['*_spec.js'],
  source: ['*.js', '!*_spec.js']
};

gulp.task('test', function (cb) {
  gulp.src(paths.source)
    .pipe(plugins.istanbul()) // Covering files
    .on('finish', function () {
      gulp.src(paths.tests)
        .pipe(plugins.mocha())
        // Creating the reports after tests runned
        .pipe(plugins.istanbul.writeReports()); 
    });
});

gulp.task('default', ['test']);
