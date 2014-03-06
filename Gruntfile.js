module.exports = function(grunt) {
	
  var decodeJSON = function (fileName){
		var buffers,output,result;
		buffers = grunt.file.read(fileName);
		output = new Buffer(buffers,'base64');
		try {
		  result = JSON.parse(output.toString('ascii'));
		} catch(e) {
		  /*The file is not encoded just parse it*/
		  result = JSON.parse(buffers);
		}
		return result;	
	};
	
  grunt.initConfig({
	  personal: decodeJSON('.personalsettings.json'),
    pkg: grunt.file.readJSON('package.json'),
		prompt: {
			environment: {
			  options: {
					questions: [
						{
							config: 'personal.oraclehome',
							type: 'input',
							message: 'Oracle home'
						},
						{
							config: 'personal.classpath',
							type: 'input',
							message: 'Class path'
						}
					]
				}
			}
		},
		setEnvironment:{
			ORACLE_HOME:'<%= personal.oraclehome %>',
			CLASSPATH:'<% personal.classpath %>'
		},
    shell: {
        generate: {
            command: ['cd Application','java oracle.apex.APEXExport -db <%= personal.database.url %> -user <%= personal.application.user %> -password <%= personal.application.password %> -applicationid 2000'].join('&&')
        },
        split: {
            command: ['cd Application','java oracle.apex.APEXExportSplitter f2000.sql'].join('&&')
        },
				remove_app: {
				    command: 'sqlplus <%= personal.application.user %>/<%= personal.application.password %>@<%= personal.database.host %> @remove_app.sql <%= personal.application.workspace %> <%= personal.application.user %>'
				},
				install_app: {
				    command: 'sqlplus <%= personal.application.user %>/<%= personal.application.password %>@<%= personal.database.host %> @install_app.sql <%= personal.application.workspace %> <%= personal.application.user %>'
				},
				install_code: {
				    command: 'sqlplus <%= personal.code.user %>/<%= personal.code.password %>@<%= personal.database.host %> @install_code.sql'
				},
				load: {
				    command: 'sqlplus sys/<%= personal.system.password %>@<%= personal.database.host %> as sysdba @loadimg.sql'
				}
    },
		copy: {
			load: {
				files: [
					{src: ['imagelist.xml'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Application\\images/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Application\\css/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Application\\javascript/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Demo\\images/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Demo\\css/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Demo\\javascript/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Source\\images/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Source\\css/**'], dest: 'c:\\temp\\Tab_menu_list/'},
					{src: ['Source\\javascript/**'], dest: 'c:\\temp\\Tab_menu_list/'}
				]
			}
		},
		clean: {
			load: {
			  options: {force: true},
				src: ["c:\\temp\\Tab_menu_list"]
			}
		},
		replace:{
			generate:{
				src:["Application/f2000.sql"],
				overwrite:true,
				replacements:[{
					from:/([0-9]+)([ ]*\+[ ]*wwv_flow_api.g_id_offset)/g,
					to:function(matchedWord){
						//get the id and substract the offset
						var text = String(matchedWord);
						text = text.replace(/(\d+)/,function(match){
							var id = Number(match);
							id = id-10000000000;
							return id;
						});
						return text;
					}
				}]
			}
		}
  });
	
  grunt.loadNpmTasks('grunt-shell');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-text-replace');
	grunt.loadNpmTasks('grunt-prompt');
  
	grunt.registerTask('encode-personal', 'Encode the .personal.json file', function() {
		var buffers,output,filename='.personalsettings.json';
		buffers = grunt.file.read(filename, {encoding: null});
		output = new Buffer(buffers);
		grunt.file.write(filename, output.toString('base64'));
	});
	
	grunt.registerTask('decode-personal', 'Encode the .personal.json file', function() {
		var buffers,output,filename='.personalsettings.json';
		buffers = grunt.file.read(filename);
		output = new Buffer(buffers,'base64');
		grunt.file.write(filename, output.toString('ascii'));
	});
	
  grunt.registerMultiTask('setEnvironment','Set a enviroment variable',function(){
	  /*Set an environment variable*/
		process.env[this.target] = this.data;
	});
	
	grunt.registerTask('test',
  [
    'prompt:environment'
  ]);
	
	//grunt.registerTask('test',['replace:generate']);
  grunt.registerTask('load', ['copy:load','shell:load','clean:load']);
  grunt.registerTask('build',  ['prompt:environment','setEnvironment','shell:generate','replace:generate','shell:split']);
  grunt.registerTask('default', ['shell:remove_app','shell:install_app','shell:install_code','copy:load','shell:load','clean:load']);
	grunt.registerTask('install', ['shell:install_app','shell:install_code','copy:load','shell:load','clean:load']);
};