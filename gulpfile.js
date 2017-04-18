// gulpfile.js

var gulp = require('gulp');
var elm = require('gulp-elm');
var gutil = require('gulp-util');
var plumber = require('gulp-plumber');
var connect = require('gulp-connect');
var nodemon = require('gulp-nodemon');
var clean = require('gulp-clean');

// File paths
var paths = {
  dest: 'dist',
  elm: 'src/*.elm',
  static: 'src/*.{html,css}'
};

// Init Elm
gulp.task('elm-init', elm.init);

gulp.task('clean', function() {
  return gulp.src(paths.dest + '/**', {read: false})
        .pipe(clean());
});

// Compile Elm to HTML
gulp.task('elm', ['elm-init'], function(){

    return gulp.src(paths.elm)
        .pipe(plumber())
        .pipe(elm.make({debug: true}))
        .pipe(gulp.dest(paths.dest));
});

// Move static assets to dist
gulp.task('static', function() {
    return gulp.src(paths.static)
        .pipe(plumber())
        .pipe(gulp.dest(paths.dest));
});

// Watch for changes and compile

// gulp.task('watch-elm', function() {
//   return gulp.watch(paths.elm, ['elm']);
// });

// gulp.task('watch-static', function() {
//   return gulp.watch(paths.static, ['static']);
// });

// Local server
gulp.task('start', ['clean', 'build'], function () {
  nodemon({
    script: 'server.js'
  , ext: 'elm js html'
  , env: { 'NODE_ENV': 'development' }
  , tasks: ['build']
  , ignore: ['dist']
  })
})

// Main gulp tasks
gulp.task('build', ['elm', 'static']);
gulp.task('default', ['start']);