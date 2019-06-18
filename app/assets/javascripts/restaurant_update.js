// $(function() {

//   var menmber_list = $("#chat-group-users");

//   function includememberHTML(id){
//     var html = `<input name='group[user_ids][]' type='hidden' value='${id}'>`
//     menmber_list.append(html);
//   }
    
//     $(document).on('click', ".user-search-add", function(){
//       $(this).parent().remove();
//       var name = $(this).data('user-name')
//       var id   = $(this).data('user-id')
//       includememberHTML(name, id);
//     })
//     $(document).on('click', ".user-search-remove", function(){
//       $(this).parent().remove();
//     })
//   });