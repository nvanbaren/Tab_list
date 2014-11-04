* ######Where to go if I have questions?
  For questions about how to use the plugin in your application go to the [apex forum](https://community.oracle.com/community/database/developer-tools/application_express) here you will find help not just from the contributors of the plugin but from other users as well. If you want to report a bug or suggested a new feature create a issue at [the github repository](https://github.com/nvanbaren/Tab_menu_list/issues). Instead of just reporting a feature or bug you could make the change yourself and become a contributor. For more information about contributing see the corresponding [chapter Contribute](#contribute).
 
* ######The wrong tab is current! The tabs all correspond to the right page but  a tab that doesn't correspond to the page is set to current.
  Check if the page is set to the correct tab set. Just as with the normal use of tabs the settings of the page determine which tab set is current for a particular page.

* ######I am using the plugin and have multiple parent and standard tabs defined but noting is rendered!
  Make sure the name of the template defined is exactly the same as the name of a list template of the current theme. The name is case sensitive and look out for any trailing white-space etc. 

* ######The template name setting is correct but no tabs are rendered!
  If the template matches check if the Parent Tab Set of the parent tabs is set to main. If not change the following line in the code to use your Parent Tab Set.

      c\_tabset  apex\_application\_parent\_tabs.tab\_set%type := 'main';

