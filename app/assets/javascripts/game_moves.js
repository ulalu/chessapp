$(function() {
  $( ".piece_image" ).draggable();
  $( "td" ).droppable({
    
    drop: function( event, ui ) {
     var game_id = $('#board').data('game_id');

      $.ajax( {  type: 'PUT',
        url: '/games/' + game_id + '/move',
        dataType: 'json',

        data: {
          position_x: $(event.target).data('row'),
          position_y: $(event.target).data('col'),
          piece_id: $(ui.draggable).data("piece_id")
        }
      })
      .success(function(data){
       $(ui.draggable).detach().css({top: 0,left: 0}).appendTo(this);
         if (data.valid_move? === false) {
         alert("Invalid move. Try again.");
         window.location.reload();
       }
      });
    }
  });
});