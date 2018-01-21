$(function () {
	$('.draggable').draggable();
	$('.draggable').on('mousedown', function (data) {
		console.log(data);
	});
	$('.draggable').on('mouseup', function (data) {
		console.log(data);
	})
});


$(function () {
  $('#board td').on( 'click', function (data) {
      $('.cell-highlight').removeClass('cell-highlight');
      $(this).toggleClass('cell-highlight');
      console.log(data);
  });
});

