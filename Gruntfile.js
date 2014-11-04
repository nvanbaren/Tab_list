module.exports = function(grunt) {
  grunt.initConfig({
	  personal: grunt.file.readJSON('Build\\.personalsettings.json'),
    pkg: grunt.file.readJSON('package.json'),
		prompt: {
			create:{
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
						  config:'personal.application.offset',
							type:'input',
							message:'Offset of the apex application:',
							default:function(){
							  var offset = grunt.config('personal.application.offset');
								if (offset == null){
  								return 10000000000
								} else {
								  return offset
								}
							}
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
							when:function(answers){
							  if (answers.code_in_application){grunt.config.set('personal.code.user', grunt.config('personal.application.user'))}
							  return !answers.code_in_application;
							}
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
								  return 'localhost:1521';
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
							default:'localhost:1521',
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
						  config:'personal.application.offset',
							type:'input',
							message:'Offset of the apex application:',
							when:function(){return (grunt.config('personal.application.offset')==null);}
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
							default:'localhost:1521',
							when:function(){return (grunt.config('personal.database.url') == null);}
						}
					]
        }					
			}
		},
		setEnvironment:{
			ORACLE_HOME:'<%= personal.oraclehome %>',
			CLASSPATH:'<%= personal.classpath %>'
		},
    shell: {
        build: {
            command: ['cd Application'
						         ,'java oracle.apex.APEXExport -db <%= personal.database.url %>:<%= personal.database.host %> -user <%= personal.application.user %> -password <%= personal.application.password %> -applicationid 2000'
										 ,'java oracle.apex.APEXExportSplitter f2000.sql'
										 ].join('&&'),
            options:{
						  stdout: true,
						  stderr: true,
						  stdin:  true,
						  failOnError: true
					  }
				},
				install: {
				    command: 'sqlplus <%= personal.application.user %>/<%= personal.application.password %>@//<%= personal.database.url %>/<%= personal.database.host %> @build\\install_app.sql <%= personal.application.workspace %> <%= personal.application.offset %> <%= personal.database.url %>/<%= personal.database.host %> <%= personal.application.user %> <%= personal.code.user %> <%= personal.code.password %> <%= personal.system.password %>',
						options:{
						  stdout: true,
						  stderr: true,
						  stdin: true,
						  failOnError: true
						}
				}
    },
		copy: {
			load: {
				files: [
					{src: ['Build\\imagelist.xml'], dest: 'imagelist.xml'},
					{src: ['imagelist.xml'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Application\\images/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Application\\css/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Application\\javascript/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Demo\\images/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Demo\\css/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Demo\\javascript/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Source\\images/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Source\\css/**'], dest: 'c:\\temp\\Tab_list/'},
					{src: ['Source\\javascript/**'], dest: 'c:\\temp\\Tab_list/'}
				]
			}
		},
		clean: {
			load: {
			  options: {force: true},
				src: ["c:\\temp\\Tab_menu_list"]
			}
		},
		cleanFile:{
		  split: ["Application/f2000.sql"],
			release:["guide.pdf","region_type_plugin_net_vanbaren_apex_tab_menu_list.sql"],
			load:["imagelist.xml"]
		},
		replace:{
			generate:{
				src:["Application/f2000/application/*.sql"
				    ,"Application/f2000/application/*/*.sql"
				    ,"Application/f2000/application/*/*/*.sql."
						,"Application/f2000/application/*/*/*/*.sql"
						,"Application/f2000/application/*/*/*/*/*.sql"
						,"Application/f2000/application/shared_components/navigation/*.sql"
						],
				overwrite:true,
				replacements:[{
					from:/([0-9]+)([ ]*\+[ ]*wwv_flow_api.g_id_offset)/g,
					to:function(matchedWord){
						//get the id and substract the offset
						var text = String(matchedWord);
						text = text.replace(/(\d+)/,function(match){
							var id = Number(match);
							id = id-grunt.config('personal.application.offset');
							return id;
						});
						return text;
					}
				}]
			},
			split:{
			  src:["Application/f2000/install.sql","Application/f2000/application/create_application.sql","Application/f2000/application/set_environment.sql"],
				overwrite:true,
				replacements:[
					{
						from:'@',
						to:'@Application/f2000/'
					},
					{
						from:"prompt  ...user interfaces",
						to:"prompt  ...user-interfaces"
					},
					{
					  from:/^--\s{1,}Date and Time:\s{1,}\d{2}:\d{2}[\s|\w|\d|,]{1,}$/im,
						to:"--"
					}
				]
			},
			release:{
				src:["Build/release_plugin_template.sql"],
				dest:["region_type_plugin_net_vanbaren_apex_tab_list.sql"],
				replacements:[
					{
						from:"/*CODE*/",
						to:function(){
						    dummyCharacter = String.fromCharCode(2580);
								regexpDummyCharacter = new RegExp(dummyCharacter,"g")
								sourceFile  = grunt.file.read("Source/sql/APR$TAB_LIST.sql");
								pluginFile  = grunt.file.read("Application/f2000/application/shared_components/plugins/region_type/net_vanbaren_apex_tab_list.sql");
								licenseFile = grunt.file.read("MIT-LICENSE.txt");
								grunt.verbose.write("Files read");
								sourceFile = sourceFile.replace(/^create or replace /im,"");
								sourceFile = sourceFile.replace(/^\/$/m,"");
						    sourceFile = sourceFile.replace(/'/g,"''");
								sourceFile = sourceFile.replace(/\n/g,"'||unistr('\\000a')||\n'");
								/*$ plays havoc replace with unused character after inserting in pluginFile change back*/
								sourceFile = sourceFile.replace(/\$/g,dummyCharacter);
						    grunt.verbose.write("sourceFile replacements done");
								pluginFile = pluginFile.replace("/*CODE*/",sourceFile);
								pluginFile = pluginFile.replace(regexpDummyCharacter,'$');
								pluginFile = pluginFile.replace("/*LICENSE*/",licenseFile);								
								grunt.verbose.write("pluginFile replacements done");
                return pluginFile;							
						}
					}
				]
			}
		},	
		readme_generator: {
			release : { 
				options: {
					// Task-specific options go here.
					readme_folder: "Documentation",
					output: "README.md",
					table_of_contents: true,
					toc_extra_links: [],
					generate_changelog: false,
					has_travis: false,
					generate_footer: true,
					generate_title: true,
					package_title: "Tab list"
				},
				order: {
					// Title of the piece and the File name goes here
					// "Filename" : "Title"
					"usage.md": "Usage",
					"FAQ.md":"FAQ",
					"contribute.md": "Contribute",
					"license.md": "License MIT"
				}
			}
		},
		zip:{
		  release:{
				dest:"release/<%= pkg.name %>_<%= pkg.version%>"+".zip",
				src:["Source/**","region_type_plugin_net_vanbaren_apex_tab_list.sql","guide.pdf"]
			}
		},
		pdfgenerator:{
		  release:{
				src:['Documentation/Usage.md','Documentation/Examples.md','Documentation/Contribute.md'],
				dest:'guide.pdf',
				options: {
				  styleFile: "Build/style.json",
					chapter: {
					  titles: {"Usage.md":"Description","Examples.md":"Examples","Contribute.md":"Contribute"},
						style: "h1"
					},
					table_of_contents:true,
					TOCstyle:"para",
					title:{style:"title",text:'Tab list'},
					subtitle:{style:"subtitle",text:"<%= pkg.description%>"}
				}
			}
		}
  });
	
  grunt.loadNpmTasks('grunt-shell');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-text-replace');
	grunt.loadNpmTasks('grunt-prompt');
	grunt.loadNpmTasks('grunt-readme-generator');
	grunt.loadNpmTasks('grunt-zip');
	grunt.loadTasks('tasks');
	
	
	grunt.registerTask('test',['pdfgenerator','zip']);
  grunt.registerTask('build',  ['prompt:build','setEnvironment','shell:build','replace:generate','replace:split','cleanFile:split']);
	grunt.registerTask('install', ['prompt:install','copy:load','shell:install','clean:load','cleanFile:load']);
  grunt.registerTask('default', ['install']);
	grunt.registerTask('personal',['prompt:create','create-personal']);
	grunt.registerTask('release',['build','replace:release','pdfgenerator','readme_generator','zip','cleanFile:release']);
};