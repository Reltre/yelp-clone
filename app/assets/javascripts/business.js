$(document).ready(function() {
  $('.business-list-content').hover(function(){
    var address = $(this).last().find('.business-address');
    address.parent().css('margin-top','-110px');
    address.removeClass('hidden');
  }, function () {
    var address = $(this).last().find('.business-address');
    address.addClass('hidden');
    address.parent().css('margin-top', '-80px');
  });
});
