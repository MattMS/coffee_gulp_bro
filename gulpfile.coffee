gulp = require 'gulp'

browserify = require 'browserify'
buffer = require 'vinyl-buffer'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
source = require 'vinyl-source-stream'


gulp.task 'default', ['common_script',]


gulp.task 'common_coffeescript', ->
	gulp.src './edit/common.coffee.md'
	.pipe coffee bare: true
	.pipe uglify()
	.pipe gulp.dest './edit/'


gulp.task 'common_script', ['common_coffeescript',], ->
	browserify
		basedir: './edit/'
		debug: true
		entries: ['./common.js']
	.bundle()
	.pipe source './common.js'
	.pipe buffer()
	#.pipe uglify()
	.pipe gulp.dest './edit/'
