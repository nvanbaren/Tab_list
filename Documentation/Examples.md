To demonstrate the possibilities of the plugin on page 11 the plugin is used several times with different settings.
The most important settings is _Template_. This settings controls the HTML that is rendered for the region.
Together with CSS it determines how the menu will look like. The template is the name of a list template of the current menu.
The name is case sensitive. When the list template can't be found then there will be nothing rendered.
The other 2 settings influence how the menu behaves.  
In the case that the parent tab has only one corresponding standard tab it might be unnecessary to display the standard tab. The parent tab should than link to the destination of the standard tab. This behaviour is accomplished by the setting _Include single tab_ . Setting this attribute to Yes will override the _Parent link_ setting for those parent tabs with only a single standard tab. Meaning that these parent tabs get the link of the standard tab even when the _Parent link_ is set to *No*.  
Depending on the use of the menu it might be undesirable for the main menu items to navigate. The attribute _Parent link_ determines if the main menu items cq. parent tabs should have a link. If _Parent link_ is set to *No* the #LINK# substitution string is replaced with #. If the _Include single tab_ is set to NO the parent link will be rendered even when the  _Parent link_ is set to *No*.
###Template
The list template consists of multiple sub templates which together render the complete region.
The sub templates render in the following way

    before rows
	  first current with children
		before sub list
		  current sublist
		  between sublist	
		  non current sublist
		after sublist
	  between item
      non current item with children
        before sub list
		  non current sublist
		  between sublist	
		  non current sublist
		after sublist
    after rows

The placement of the child's template with in the parent template isn't determinate with a substitution string. Instead the sub template is placed before the last closing tag of the parent template. If the last closing tag is the same as the opening tag otherwise the sub template will be placed at the end of the item template.

Consider the following parent template:

    <li class="ui-state-default no-border-rl">
	  <a href="#LINK#"> 
	    #TEXT#
	  </a>
	</li>

And the following sub list template:

    <li class="ui-state-active " >
	  <a href="#LINK#">
	    <span>#TEXT#</span>
	  </a>
	</li>

With the before and after `<ul>` and `</ul>`. Putting them together would give you:

    <ul>
	  <li class="ui-state-default no-border-rl">
	    <a href="#LINK#"> 
	      #TEXT#
	    </a>
        <ul>
          <li class="ui-state-active" >
            <a href="#LINK#">
			  <span>#TEXT#</span>
            </a>
          </li>        
          <li class="ui-state-default" >
            <a href="#LINK#">
              <span>#TEXT#</span>
            </a>
          </li>
        </ul>
      </li>
	</ul>  
The following substitution strings can be used in the templates.  
\#LINK# Either the url to the page of the tab or for the standard tabs of the current parent are doSubmit(tab\_name). This is inline with the standard behaviour of tabs.  
\#IMAGE\#, #IMAGE_ATTR\#  The normal image settings of both the parent and standard tabs are used to define the image for that particular tab.  
\#LIST\_ITEM\_ID# The id of the tab.  
\#PARENT\_LIST\_ITEM\_ID# The id of the parent tab of the current tab.  
\#A1# Name of the tab.  
\#A2# Name of the parent of the current tab.  
\#TEXT# The unescaped label.  
\#TEXT\_ESC\_SC# The escaped label.  
\#LEVEL#  Either 1 for the parent tabs or 2 for the standard tabs.
###Files
If specific javaScript or CSS files are needed for the correct function of your menu you can add the files to you're plugin. The files that are added will be rendered for the region. If you're menu is not necessary for all pages but multiple page templates it might be more constructive to add those files to the plugin instead of the page or template settings.