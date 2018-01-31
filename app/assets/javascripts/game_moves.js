$(function () {
  $('#board td').on( 'click', function (data) {
      $('.cell-highlight').removeClass('cell-highlight');
      $(this).toggleClass('cell-highlight');
      console.log(data);
  });
});

$(function() {
  $( ".piece_image" ).draggable({revert: true});
  $( "td" ).droppable({
    drop: function( event, ui ) {
      var game_id = $('#board').data('game_id');
      var that = this;

      $.ajax( {
        type: 'PUT',
        url: '/games/' + game_id + '/move',
        dataType: 'json',
        data: {
          position_x: $(event.target).data('row'),
          position_y: $(event.target).data('col'),
          piece_id: $(ui.draggable).data("piece_id")
        }
      })

      .success(function(data){
        $(ui.draggable).detach().css({top: 0,left: 0}).appendTo(that);
      })
      .error(function(data) {
        var row = $(ui.draggable).data('row');
        var col = $(ui.draggable).data('col');
        debugger;
        $(ui.draggable).detach().css({top: 0,left: 0}).appendTo('td[data-row='+row+'][data-col='+col+']');
      //  alert("Invalid move. Try again.");
      });
    }
  });
});

