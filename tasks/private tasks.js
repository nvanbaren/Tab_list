module.exports = function(grunt) {

	grunt.registerTask('create-personal','Create the .personal.json file',function(){
		filename= '.personalsettings.json';
		grunt.file.write(filename,JSON.stringify(grunt.config('personal')));
	});

	grunt.registerMultiTask('setEnvironment','Set a enviroment variable',function(){
		/*Set an environment variable*/
		console.log(this.target+'  '+this.data);
		process.env[this.target] = this.data;
	});

	grunt.registerMultiTask('cleanFile','Delete a file',function(){
		var fs = require('fs');
		this.filesSrc.forEach(function(filename) {
			fs.unlinkSync(filename)
		});
	});
};