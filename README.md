# Tab list menu 

> Apex region plugin. Tab menu using a list template.

## Jump to Section

* [Usage](#usage)
* [Contribute](#contribute)
* [License MIT](#license-mit)

## Usage
[[Back To Top]](#jump-to-section)

####A apex region plugin to display tabs using a list template.####
The way two level tabs are displayed in Apex is limited. For instance only the standard tabs belonging to the current parent tab are rendered. This plug-in does not only render the standard tabs for the current parent tab but for the other parent tabs as well. So it becomes possible to display the tabs as a drop down menu. For the HTML rendering a list template is used. Giving you as developer complete control over how the tabs are rendered.  
###Installation###
With this installation package there is a plug-in installation file named:
**region_type\_plugin\_net\_vanbaren\_apex\_tab\_menu\_list\_v1.01.sql**.   
Navigate to **Shared Components** => **Plug-ins** and click **Import**. From there you can follow the wizard to upload and install the plug-in using the file above. After the plug-in has been installed successfully you will be redirected to the plug-in edit screen.  
To be able to use the setting **Use conditions** the package _apex$checks_ needs to be installed. The code can be found in the folder **source/sql**. When you install the package into a different schema then the parsing schema don't forget the grant execute rights and use a synonym.
###Settings###
- **Template**: Name of list template. Template is used to render the html of the region. The template needs to belong to the current theme. And the name is case sensitive.
- **Include single tab**: Should the tab be include if it is the only one?  
  If the parent tab has only a single tab:
  - **No** The parent tab gets the url of the tab. And the tab is not rendered.
  - **Yes** The parent tab and the tab are both rendered.
- **Parent link**: Should the parent have a link?
  - **No** The link attribute is replaced by "#"
  - **Yes** The link of the parent tab.
  - If **include single tab** is _no_ the parent tab will have the link of the tab when there is only one tab. Even when **Parent link** is set to _no_.  
- **Observe tabs conditions.**: Should the conditions and authorization scheme be taken into while generating the tabs?  
  - **Yes** The conditions are taken into account meaning that when the condition is false the (parent) tab will not be generated.
    Can only be used when the package _apex$checks_ is available for the parsing scheme.
  - **No** No matter the conditions or authorization all (parent) tabs are generated.

## Contribute
[[Back To Top]](#jump-to-section)

Want to contribute to the plugin. Fork the repository, make the changes you feel are needed. And make pull request to see the changes merged back into the master. To make contribution easier there is chosen to not have a plugin import file in the repository but a whole apex application. The application not only holds the plugin but also holds examples of uses of the plugin. Also great for testing all the different settings.  
Also is [grunt](http://gruntjs.com/ "grunt") used to make installation of the plugin ready for development easier. For installing the plugin on your development area run the grunt task **install**. Because all development areas are different there are several environment settings asked when running a grunt task. A lot of these are necessary for every task. Run the task **personal** to store your environment specific settings to prevent being asked every time you run a task. 
###Grunt###
Grunt is used to help with the repetitive tasks such as installing or exporting the application.
For these task are several settings depend on your environment, below you will find a complete list with explanation.
Most of these settings will be the same for every run so I have created the task **personal** that will store these settings in a file.
The passwords will not be stored.

* **Workspace** Workspace in which the application should be imported.
* **Application schema** The parsing schema of the application
* **Application schema** password. The password for the parsing schema of the application.
* **Application offset** of the id's of the different elements. Only needs to change if your not the only developer working on this plugin in the same database at the same time. 
* **Database URL** The URL to connect to the database. With XE installed locally that would be localhost:1521:XE 
* **Database host** The SID / host of the database. With eXpress Edition that is XE.
* **Code schema** Schema where the code will be installed. Can be the same as the application schema
* **Code password** Password for the schema where the code is installed. Will not be used when the code schema is the same as the application schema.
* **Oracle home** The path of Oracle Home (server) Directory (is an environment variable)
* **Class path** Directory path to ojdbc14.jar (is an environment variable)
###Grunt tasks
* **Default** Installs the application and source code. Uploads the necessary files to the server.
* **Install** Installs the application and source code. Uploads the necessary files to the server.
* **Build** Exports the application, splits the application export file. Still to do creating the plugin import file, create the documentation form the templates and readme files. And bundle everyting in a zipfile ready to be released.
* **Personal** Create the personal.json file with the settings specific for your environment.
* **Load** Loads the files to the server.
###Directories###
* **Application** Holds the splitted exported of the application that is used to build the application.
* **Documentation** All files used for user documentation that isn't the readme of the repository.
* **Demo** Everything necessary to demo the plugin.
* **Source** The source files. Files necessary to run the plugin.
  * Javascript
  * CSS
  * Images
  * SQL

## License MIT
[[Back To Top]](#jump-to-section)

Copyright (c) 2014 N. van Baren

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:  

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.  
  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.




--------
<small>_This readme has been automatically generated by [readme generator](https://github.com/aponxi/grunt-readme-generator) on Sun Nov 02 2014 15:49:13 GMT+0100 (West-Europa (standaardtijd))._</small>
