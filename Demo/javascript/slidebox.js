function slidebox_in(pThis,pWidth) {
  var $elem =$(pThis);
  $elem.find('img')
    .stop(true)
    .animate({
        'width':pWidth+'px',
        'height':pWidth+'px',
        'left':'0px'
      }
      ,400
      ,'easeOutBack'
      )
    .andSelf()
    .find('.sdt_wrap')
    .stop(true)
    .animate({'top':(0.75*pWidth)+'px'},500,'easeOutBack')
    .andSelf()
    .find('.sdt_active')
    .stop(true)
    .animate({'height':pWidth+'px'},300,function(){
   var $sub_menu = $elem.find('.sdt_box');
   if($sub_menu.length){
    var left = pWidth+'px';
    if($elem.parent().children().length == $elem.index()+1)
     left = (-pWidth)+'px';
    $sub_menu.show().animate({'left':left},200);
   }
  });
 }
function slidebox_out(pThis,pWidth){
  var $elem = $(pThis);
  var $sub_menu = $elem.find('.sdt_box');
  if($sub_menu.length)
   $sub_menu.hide().css('left','0px');

  $elem.find('.sdt_active')
    .stop(true)
    .animate({'height':'0px'},300)
    .andSelf().find('img')
    .stop(true)
    .animate({
    'width':'0px',
    'height':'0px',
    'left':(0.5*pWidth)+'px'},400)
    .andSelf()
    .find('.sdt_wrap')
    .stop(true)
    .animate({'top':'25px'},500);
 }