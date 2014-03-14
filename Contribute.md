#Contribute  
Grunt is used to help with the repetive tasks such as installing or exporting the application.
For these task are several settings depend on your enviroment, below you will find a complete list with explanation.
Most of these settings will be same for every run so I have created the task create-personal that will store these settings in a file.
The passwords will not be stored.

* Workspace Workspace in which the application should be imported.
* Application schema The parsing schema of the application
* Application schema password. The pasword for the parsing schema of the application.
* Database url. The url to connect to the database. With XE istalled locally that would be localhost:1521:XE 
* Database host. The SID / host of the database. With XE that is XE.
* Code schema. Schema where the code will be installed. Can be the same as the application schema
* Code password. Password for the schema where the code is installed. Will not be used when the code schema is the same as the application schema.
* Oracle home. The path of Oracle Home (server) Directory (is an enviroment variable)
* Class path Directory path to ojdbc14.jar (is an environment variable)

During the development of the plugin the code is stored in a file out side the apex application.
This is done to make working with the code easier. You can find the code under source\sql. Javascript and css file are respectively found in source\javascript source\css and images in source\images.
