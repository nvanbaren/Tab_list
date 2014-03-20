module.exports = function(grunt) {
	
  grunt.initConfig({
	  personal: grunt.file.readJSON('.personalsettings.json'),
    pkg: grunt.file.readJSON('package.json'),
		prompt: {
			create_personal:{
			  options:{
				  questions:[
					  {
						  config:'personal.application.user',
							type:'input',
							message:'Schema of the apex application:',
							default:function(){return grunt.config('personal.application.user');}
						},
						{
						  config:'personal.application.workspace',
							type:'input',
							message:'Workspace of the apex application:',
							default:function(){return grunt.config('personal.application.workspace');}
						},
						{
						  name:'code_in_application',
							type:'confirm',
              message:'Code in application schema:',
							default:true
						},
						{
						  config:'personal.code.user',
							type:'input',
							message:'Schema for code:',
							default:function(){return grunt.config('personal.code.user');},
							when:function(answers){!answers.code_in_application;}
						},
					  {
							config:'personal.database.host',
							type:'input',
							message:'Database host:',
							default:function(){
							  var l_host = grunt.config('personal.database.host');
							  if(l_host==null){
								  return 'xe';
								} else {
								  return l_host;
								}
							}
						},
						{
						  config:'personal.database.url',
							type:'input',
							message:'Database url:',
							default:function(){
							  var l_url = grunt.config('personal.database.url');
							  if(l_url==null){
								  return 'localhost:1521:XE';
								} else {
								  return l_url;
								}
						  }
						},
					  {
						  config:'personal.oraclehome',
							type:'input',
							message:'Oracle home:',
							default:function(){return grunt.config('personal.oraclehome');}
						},
						{
						  config:'personal.classpath',
							type:'input',
							message:'Class path:',
							default:function(){return grunt.config('personal.classpath');}
						}
					]
				}
			},
			build: {
			  options: {
					questions: [
					  {
						  config:'personal.application.user',
							type:'input',
							message:'Schema of the apex application:',
							when:function(){return (grunt.config('personal.application.user')==null);}
						},
						{
						  config:'personal.application.password',
							type:'password',
							message:'Password for application schema:'
						},
					  {
						  config:'personal.database.url',
							type:'input',
							message:'Database url:',
							default:'localhost:1521:XE',
							when:function(){return (grunt.config('personal.database.url') == null);}
						},
						{
							config: 'personal.oraclehome',
							type: 'input',
							message: 'Oracle home:',
							when:function(){return (grunt.config('personal.oraclehome') == null)}
						},
						{
							config: 'personal.classpath',
							type: 'input',
							message: 'Class path:',
							when:function(){return (grunt.config('personal.classpath') == null)}
						}
					]
				}
			},
			install: {
			  options: {
					questions: [
					  {
						  config:'personal.application.workspace',
							type:'input',
							message:'Workspace of the apex application:',
							when:function(){return (grunt.config('personal.application.workspace')==null);}
						},
					  {
						  config:'personal.application.user',
							type:'input',
							message:'Schema of the apex application:',
							when:function(){return (grunt.config('personal.application.user')==null);}
						},
						{
						  config:'personal.application.password',
							type:'password',
							message:'Password for application user:'
						},
											  {
						  config:'personal.code.user',
							type:'input',
							message:'Schema of the code:',
							when:function(){return (grunt.config('personal.code.user')==null);}
						},
						{
						  config:'personal.code.password',
							type:'password',
							message:'Password for code user:',
							when:function(){return (grunt.config('personal.code.user')!= grunt.config('personal.application.user')) }
						},
						{
						  config:'personal.system.password',
							type:'password',
							message:'Password for sys:'
						},
					  {
						  config:'personal.database.url',
							type:'input',
							message:'Database url:',
							default:'localhost:1521:XE',
							when:function(){return (grunt.config('personal.database.url') == null);}
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
            command: ['cd Application','java oracle.apex.APEXExport -db <%= personal.database.url %> -user <%= personal.application.user %> -password <%= personal.application.password %> -applicationid 2000'].join('&&'),
            stdout: true,
						stderr: true,
						stdin:  true,
						failOnError: true
				},
        split: {
            command: ['cd Application','java oracle.apex.APEXExportSplitter f2000.sql'].join('&&'),
						stdout: true,
						stderr: true,
						stdin: true,
						failOnError: true
        },
				remove_app: {
				    command: 'sqlplus <%= personal.application.user %>/<%= personal.application.password %>@<%= personal.database.host %> @remove_app.sql <%= personal.application.workspace %> <%= personal.application.user %>',
						stdout: true,
						stderr: true,
						stdin: true,
						failOnError: true
				},
				install_app: {
				    command: 'sqlplus <%= personal.application.user %>/<%= personal.application.password %>@<%= personal.database.host %> @install_app.sql <%= personal.application.workspace %> <%= personal.application.user %>',
						stdout: true,
						stderr: true,
						stdin: true,
						failOnError: true
				},
				install_code: {
				    command: 'sqlplus <%= personal.code.user %>/<%= personal.code.password %>@<%= personal.database.host %> @install_code.sql',
						stdout: true,
						stderr: true,
						stdin: true,
						failOnError: true
				},
				load: {
				    command: 'sqlplus sys/<%= personal.system.password %>@<%= personal.database.host %> as sysdba @loadimg.sql',
						stdout: true,
						stderr: true,
						stdin: true,
						failOnError: true
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
	
	grunt.registerTask('create-personal','Create the .personal.json file',function(){
	  filename= '.personalsettings1.json';
		grunt.file.write(filename,JSON.stringify(grunt.config('personal')));
	});
  
  grunt.registerMultiTask('setEnvironment','Set a enviroment variable',function(){
	  /*Set an environment variable*/
		process.env[this.target] = this.data;
	});

	grunt.registerTask('test',['replace:generate']);
  grunt.registerTask('load', ['copy:load','shell:load','clean:load']);
  grunt.registerTask('build',  ['prompt:build','setEnvironment','shell:generate','replace:generate','shell:split']);
  grunt.registerTask('default', ['prompt:install','shell:remove_app','shell:install_app','shell:install_code','copy:load','shell:load','clean:load']);
	grunt.registerTask('install', ['prompt:install','shell:install_app','shell:install_code','copy:load','shell:load','clean:load']);
	grunt.registerTask('personal',['prompt:create','create-perosnal']);
};