var gulp   = require('gulp')
var plugins = require('gulp-load-plugins')()
var tsProject = plugins.typescript.createProject("tsconfig.json");


gulp.task("tslint", function () {
  gulp.src("source.ts")
    .pipe(plugins.tslint({
        formatter: "verbose"
    }))
    .pipe(plugins.tslint.report())
});

gulp.task("compile", ["tslint"], function () {
  return tsProject.src()
    .pipe(tsProject())
    .js.pipe(gulp.dest('dist'));
});

// if you just want to run test in specific file, use `mocha XXX_spec.js` instead
gulp.task('test', ['compile'], function () {
  gulp.src('test/*_spec.js')
    .pipe(plugins.mocha())
});

gulp.task('default', ['test'])
