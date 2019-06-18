$(document).on('click', function(){
  $('.fc-view-container *').removeAttr('style');
})

$(document).on('turbolinks:load', function() {
  $('#calendar').fullCalendar();
  $('.fc-view-container *').removeAttr('style');
});

$(document).on('turbolinks:before-cache', function() {
  $('#calendar').empty();  
  $('.fc-view-container *').removeAttr('style');
});
