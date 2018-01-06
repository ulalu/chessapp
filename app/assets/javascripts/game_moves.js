$(function () {
	$('.draggable').draggable();

	var fromRow = -1;
	var fromCol = -1;

	// $('.draggable').click(function () {
	// 	td = $(this).parent().get(0);
	// 	sourceMove = td.id;
	// 	console.log(sourceMove);
	//
	// })
	$('.draggable').on('mousedown', function (data) {
		td = $(this).parent().get(0);
		sourceMove = td.id;

		fromRow = sourceMove.split("_")[1];
		fromCol = sourceMove.split("_")[3];

	});
	$('.draggable').on('mouseup', function (data) {
		//console.log(data);
		console.log("Moved piece from row: " + fromRow + " col: " + fromCol);
	})
});
