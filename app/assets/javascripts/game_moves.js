$(function () {
	$('.draggable').draggable();
	$('.draggable').on('mousedown', function (data) {
		console.log(data);
	});
	$('.draggable').on('mouseup', function (data) {
		console.log(data);
	})
});


// below is a functioning method for highlighting a cell
// next task is to unhighlight on click
// also to allow hovering to continue while a cell is highlighted (different colors would be useful)

$(function () {
  $('#board td').on( 'click', function (data) { 
    $('#board td').removeClass('hover-cell'); 
    $(this).addClass('cell-highlight'); 
      console.log(data); 
  });
  // $('#board td').on( 'click', function (data) {
  //   $(this).hasClass( 'cell-highlight');
  //   $(this).removeClass( 'cell-highlight');
  //     console.log(data);
  // });
});


 // table id is 'board'
    // first state is we haven't clicked on anything and we want to highlight on hover
    // second state is we've clicked on one cell once and we want that cell highlighted
    // third state is we've clicked a second time on the same hovered cell and we want that cell unhighlighted and we want to go back to the original state
    // fourth state is we've clicked on one cell one time and now we click on a different cell one time and that should remove highlighting from first cell and highlight the next cell
    // remove cell highlight from everything and add it to new clicked cell

// syntax notes below

//     $(function() {
//     $("#reg").click(function () {
//         if ($("#frm01").is(":visible"))
//             $("#frm01").slideUp(1000);
//         else
//             $("#frm01").slideDown(1000);
//     });
// });