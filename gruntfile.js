module.exports = function(grunt) {
	// Project configuration.
	grunt.initConfig({
		// Import package.json file, we get some info from here
		pkg: grunt.file.readJSON('package.json'),
	 
		// Minify JS into one file
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			},
			dist: {
				files: [
					{src: ['out/scripts/libs/jquery-min.js', 'out/scripts/libs/bootstrap-min.js', 'out/scripts/libs/lazyload-min.js', 'out/scripts/libs/cookietool.js', 'out/scripts/app.js'], dest: 'out/scripts/app-min.js'},
				]
			}
		},
		// Minify CSS into one file
		cssmin: {
			options: {
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */'
			},
			dist: {
				files: [
					{src: ['out/styles/bootstrap.css'], dest: 'out/styles/bootstrap-min.css'}
				]
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.registerTask('default', ['uglify', 'cssmin']);
};