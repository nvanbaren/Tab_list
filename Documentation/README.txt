Tab menu list
A apex region plugin to display tabs using a list template.

The way two level tabs are displayed in Apex is limited. For instance only the standard tabs belonging to the current parent tab are rendered. This plug-in does not only render the standard tabs for the current parent tab but for the other parent tabs as well. So it becomes possible to display the tabs as a drop down menu. For the HTML rendering a list template is used. Giving you as developer complete control over how the tabs are rendered.  

Installation
With this installation package there is a plug-in installation file named:
  region_type_plugin_net_vanbaren_apex_tab_menu_list_v1.01.sql.   
Navigate to Shared Components => Plug-ins and click Import. From there you can follow the wizard to upload and install the plug-in using the file above. After the plug-in has been installed successfully you will be redirected to the plug-in edit screen.

Settings
- Template: Name of list template. Template is used to render the html of the region. The template needs to belong to the current theme. And the name is case sensitive.
- Include single tab: Should the tab be include if it is the only one? If the parent tab has only a single tab:
  - No The parent tab gets the url of the tab. And the tab is not rendered.
  - Yes The parent tab and the tab are both rendered.
- Parent link: Should the parent have a link?
  - No The link attribute is replaced by "#"
  - Yes The link of the parent tab.
  - If include single tab is no the parent tab will have the link of the tab when there is only one tab. Even when Parent link is set to No.  
