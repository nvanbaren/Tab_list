function app_AppMenuMultiOpenBottom2(pThis,pThat,pSub){
      var lMenu = $x(pThat);
      if(pThis != gCurrentAppMenuImage){
        app_AppMenuMultiClose();
        var l_That = pThis.parentNode;
        //pThis.className = g_dhtmlMenuOn;
        dhtml_MenuOpen(l_That,pThat,false,'Bottom');
        gCurrentAppMenuImage = pThis;
      }else{
        dhtml_CloseAllSubMenus();
        app_AppMenuMultiClose();
      }
  return;
}
function app_AppMenuMultiClose(){
  if(gCurrentAppMenu){
    var lMenu = $x(gCurrentAppMenu);
   // gCurrentAppMenuImage.className = g_dhtmlMenu;
    $x_Hide(lMenu);
    gCurrentAppMenu = false;
    gCurrentAppMenuImage = false;
    $gCurrentAnchorList = false;
  }
  return;
}