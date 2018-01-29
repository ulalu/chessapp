$(function() {
  $( ".piece_image" ).draggable();
  $( "td" ).droppable({
  
    drop: function( event, ui ) {
     var game_id = $('#board').data('game_id');
     var piece_id = $('#td').data('piece_id');

      $.ajax( {  type: 'PUT',
        url: '/pieces' + piece_id,
        dataType: 'json',

        data: {
          position_x: $(event.target).data('row'),
          position_y: $(event.target).data('col'),
          piece_id: $(ui.draggable).data('piece_id')
        }
      })
      .success(function(data){
      $(ui.draggable).detach().css({top: 0,left: 0}).appendTo(this);
         alert(data);
         window.location.reload();
      });
    }
  });
});