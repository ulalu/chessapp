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
      $(this).toggleClass('cell-highlight');
      console.log(data);
  });
});


// first state: board takes blue hover from css
// second state: td toggles from blue hover to red highlight on click
// third state: red highlight switches to a new cell when cell is clicked and the previous cell returns to hover
// fourth state: second cell returns to hover on click