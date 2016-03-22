$(document).ready(function() {
  $('.business-thumbnail').hover(function(){
    var address = $(this).next().find('.business-address');
    address.hide(function(){
      address.parent().css('margin-top','-80px');
    });
  }, function () {
    var address = $(this).next().find('.business-address');
    address.parent().css('margin-top', '-110px');
    address.show();
  });
});
