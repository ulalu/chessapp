// Retreive all TD elements and return as an array
function getAlltableDataElements() {
	tdArray = $("td");
	return tdArray;
}
function tdDataStruct(name, top, left) {
	this.name = name;
	this.top = top;
	this.left = left;
}
// Build a TD element array by search each items in tdElements. This is to store positions of these items
function tdLocations(tdEleArray) {
	positionArray = [];
	heightWidthSelector = 'td#row_0_col_0';
	// Store height and width of bpx
	console.log($('td#row_0_col_0').height());
	positionArray.push($(heightWidthSelector).height());
	positionArray.push($(heightWidthSelector).width());

	for(i = 0; i < tdEleArray.length; i++) {
		console.log($(tdEleArray[i]).position().top);
		t = $(tdEleArray[i]).position().top;
		left = $(tdEleArray[i]).position().left;
		name = $(tdEleArray[i]).attr('id');

		console.log("Top: " + t + " Left: " + left + " Name: " + name );
		datastruct = new tdDataStruct(name, t, left);
		positionArray.push(datastruct);


	}

	console.log(positionArray);
	return positionArray;

}

// All TD elements store here
var tdElements = null;
$(function () {
	tdElements = getAlltableDataElements();
	console.log(tdElements);

	var blah = tdLocations(tdElements);

	$('.draggable').draggable();

	// Variables to keep track of source row and col from piece selected
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
