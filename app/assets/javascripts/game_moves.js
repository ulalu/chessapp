
// Retreive all TD elements and return as an array
function getAlltableDataElements() {
	tdArray = $("td");
	return tdArray;
}

// Find square info and return that item to move chess piece to it
function targetForMove(positionTop, positionLeft, dataStructureArray) {
	squareHights = dataStructureArray[0];
	squareWidths = dataStructureArray[1];

	function findSquare() {
		
	}

	console.log(dataStructureArray.find(findSquare))
}

// Data structure stores div id selector, position.top and left plus row number and column number.
// This is used to create an array with a whole bunch of data structures in it.
function tdDataStruct(name, top, left, row, col) {
	this.name = name;
	this.top = top;
	this.left = left;
	this.row = row;
	this.col = col;
 }
// Build a TD element array by search each items in tdElements. This is to store positions of these items
function tdLocations(tdEleArray) {
	positionArray = [];
	heightWidthSelector = 'td#row_0_col_0';
	// Store height and width of bpx
	console.info($('td#row_0_col_0').height());
	positionArray.push($(heightWidthSelector).height());
	positionArray.push($(heightWidthSelector).width());

	// Take elements fed from array of td's and create datastructure with information in it
	tdEleArray.each(function () {
		topPosition = $(this).position().top;
		leftPosition = $(this).position().left;
		rowNumber = parseInt($(this).attr('id').split("_")[1]);
		colNumber = parseInt($(this).attr('id').split("_")[3]);
		nameOfTD = $(this).attr('id');
		console.info("Top: " + topPosition + " Left: " + leftPosition + " Name: " + nameOfTD );
		dataStructure = new tdDataStruct(name, topPosition, leftPosition, rowNumber, colNumber);

		// Push each new dataStructure into array.
		positionArray.push(dataStructure);
	});


	console.log(positionArray);
	return positionArray;

}
if($('.draggable')) {
// All TD elements store here
	var tdElements = null;
	$(function () {
		tdElements = getAlltableDataElements();
		console.log(tdElements);
		$('.draggable').draggable();


		var blah = tdLocations(tdElements);


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
}
