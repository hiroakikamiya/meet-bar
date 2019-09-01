$(function(){
  $('#calendar').fullCalendar({
      contentHeight: 'auto',
      selectable: true,
      selectHelper: true,
      select: function(data) {
        var str = moment(data).format( 'YYYY-MM-DD' );
        var url = `/restaurants/${str}`
      window.location.href = url;
      }
  });
});