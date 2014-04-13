#Contribute 
##Grunt 
Grunt is used to help with the repetitive tasks such as installing or exporting the application.
For these task are several settings depend on your environment, below you will find a complete list with explanation.
Most of these settings will be same for every run so I have created the task create-personal that will store these settings in a file.
The passwords will not be stored.

* Workspace Workspace in which the application should be imported.
* Application schema The parsing schema of the application
* Application schema password. The password for the parsing schema of the application.
* Application offset of the id's of the different elements. Only needs to change if your not the only developer working on this plugin in the same database at the same time. 
* Database URL. The URL to connect to the database. With XE installed locally that would be localhost:1521:XE 
* Database host. The SID / host of the database. With eXpress Edition that is XE.
* Code schema. Schema where the code will be installed. Can be the same as the application schema
* Code password. Password for the schema where the code is installed. Will not be used when the code schema is the same as the application schema.
* Oracle home. The path of Oracle Home (server) Directory (is an environment variable)
* Class path Directory path to ojdbc14.jar (is an environment variable)
###Grunt tasks
* Default Installs the application and source code. Uploads the necessary files to the server.
* Install Installs the application and source code. Uploads the necessary files to the server.
* Build Exports the application, splits the application export file. Still to do creating the plugin import file, create the documentation form the templates and readme files. And bundle everyting in a zipfile ready to be released.
* Personal Create the personal.json file with the settings specific for your environment.
* Load Loads the files to the server.  
##Directories
* Application Holds the splitted exported of the application that is used to build the application.
* Documentation All files used for user documentation that isn't the readme of the repository.
* Demo Everything necessary to demo the plugin.
* Source The source files. Files necessary to run the plugin.
  * Javascript
  * CSS
  * Images
  * SQL 