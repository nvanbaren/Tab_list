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
- **Use conditions**: Should the conditions and authorization scheme be taken into while generating the tabs?  
  - **Yes** The conditions are taken into account meaning that when the condition is false the (parent) tab will not be generated.
    Can only be used when the package _apex$checks_ is available for the parsing scheme.
  - **No** No matter the conditions or authorization all (parent) tabs are generated.