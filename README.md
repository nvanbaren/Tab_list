# Tab list 

> Apex region plugin. Tab menu using a list template.

## Jump to Section

* [Usage](#usage)
* [FAQ](#faq)
* [Contribute](#contribute)
* [License MIT](#license-mit)

## Usage
[[Back To Top]](#jump-to-section)

The way two level tabs are displayed in Apex is limited. For instance only the standard tabs belonging to the current parent tab are rendered. This plug-in does not only render the standard tabs for the current parent tab but for the other parent tabs as well. So it becomes possible to display the tabs as a drop down menu. For the HTML rendering a list template is used. Giving you as developer complete control over how the tabs are rendered. This plugin is the next evolution step of the region plugin Tab submenu which uses the page templates. This template uses a list template for its rendering which is a more natural fit. 
##Installation##
With this installation package there is a plug-in installation file named:
**region_type\_plugin\_net\_vanbaren\_apex\_tab\_list\_v1.01.sql**.   
Navigate to **Shared Components** => **Plug-ins** and click **Import**. From there you can follow the wizard to upload and install the plug-in using the file above. After the plug-in has been installed successfully you will be redirected to the plug-in edit screen.  
To be able to use the setting **Observe tabs conditions** the package _apex$checks_ needs to be installed. The code can be found in the folder **source/sql**. When you install the package into a different schema then the parsing schema don't forget the grant execute rights and use a synonym.
##Settings##
- **Template**: Name of list template. Template is used to render the html of the region. The template needs to belong to the current theme. And the name is case sensitive.
- **Include single tab**: Should the tab be include if it is the only one?  
  If the parent tab has only a single tab:
  - **No** The parent tab gets the url of the tab. And the tab is not rendered.
  - **Yes** The parent tab and the tab are both rendered.
- **Parent link**: Should the parent have a link?
  - **No** The link attribute is replaced by "#"
  - **Yes** The link of the parent tab.
  - If **include single tab** is _no_ the parent tab will have the link of the tab when there is only one tab. Even when **Parent link** is set to _no_.  
- **Observe tabs conditions**: Should the conditions and authorization scheme be taken into while generating the tabs?  
  - **Yes** The conditions are taken into account meaning that when the condition is false the (parent) tab will not be generated.
    Can only be used when the package _apex$checks_ is available for the parsing scheme.
  - **No** No matter the conditions or authorization all (parent) tabs are generated.

## FAQ
[[Back To Top]](#jump-to-section)

* ######Where to go if I have questions?
  For questions about how to use the plugin in your application go to the [apex forum](https://community.oracle.com/community/database/developer-tools/application_express) here you will find help not just from the contributors of the plugin but from other users as well. If you want to report a bug or suggested a new feature create a issue at [the github repository](https://github.com/nvanbaren/Tab_menu_list/issues). Instead of just reporting a feature or bug you could make the change yourself and become a contributor. For more information about contributing see the corresponding [chapter Contribute](#contribute).
 
* ######The wrong tab is current! The tabs all correspond to the right page but  a tab that doesn't correspond to the page is set to current.
  Check if the page is set to the correct tab set. Just as with the normal use of tabs the settings of the page determine which tab set is current for a particular page.

* ######I am using the plugin and have multiple parent and standard tabs defined but noting is rendered!
  Make sure the name of the template defined is exactly the same as the name of a list template of the current theme. The name is case sensitive and look out for any trailing white-space etc. 

* ######The template name setting is correct but no tabs are rendered!
  If the template matches check if the Parent Tab Set of the parent tabs is set to main. If not change the following line in the code to use your Parent Tab Set.

      c\_tabset  apex\_application\_parent\_tabs.tab\_set%type := 'main';



## Contribute
[[Back To Top]](#jump-to-section)

Want to contribute to the plugin. Fork the repository, make the changes you feel are needed. And make pull request to see the changes merged back into the master. To make contribution easier there is chosen to not have a plugin import file in the repository but a whole apex application. The application not only holds the plugin but also holds examples of uses of the plugin. Also great for testing all the different settings.  
Also is [grunt](http://gruntjs.com/ "grunt") used to make installation of the plugin ready for development easier. For installing the plugin on your development area run the grunt task **install**. Because all development areas are different there are several environment settings asked when running a grunt task. A lot of these are necessary for every task. Run the task **personal** to store your environment specific settings to prevent being asked every time you run a task.
 
##Grunt##
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

##Grunt tasks
* **Default** Installs the application and source code. Uploads the necessary files to the server.
* **Install** Installs the application and source code. Uploads the necessary files to the server.
* **Build** Exports the application, splits the application export file. Still to do creating the plugin import file, create the documentation form the templates and readme files. And bundle everyting in a zipfile ready to be released.
* **Personal** Create the personal.json file with the settings specific for your environment.
* **Load** Loads the files to the server. 
 
##Directories##
* **Application** Holds the splitted exported of the application that is used to build the application.
* **Documentation** All files used for user documentation that isn't the readme of the repository.
* **Demo** Everything necessary to demo the plugin.
* **Source** The source files. Files necessary to run the plugin.
  * Javascript
  * CSS
  * Images
  * SQL
* **Release** Zip files connected to a release. Zip file contains the plugin file, documentation as pdf file and the source files.
* **Build** Files needed for grunt tasks.

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
<small>_This readme has been automatically generated by [readme generator](https://github.com/aponxi/grunt-readme-generator) on Sat Dec 06 2014 22:06:14 GMT+0100 (West-Europa (standaardtijd))._</small>