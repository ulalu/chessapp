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


// first state: board takes blue hover from css
// second state: td toggles from blue hover to red highlight on click
// third state: red highlight switches to a new cell when cell is clicked and the previous cell returns to hover
// fourth state: second cell returns to hover on click

// Scoreboard: shows name and role of each player for each game, and whether they won or lost
// Also shows overall wins and losses


// Notes on showing the board to players:

// when the player clicks join on the main page, are they the first player to join?
  // if they created the game, they are the first
  // if they join the game, they are the second

// when the creator creates the new game, there should be fields for his or her user ID and player ID
// a user "has" roles, a user can be "black_player_1" or "white_player_1"

//a pop-up should ask them "You have chosen to attack. Choose your army."
// it should give them a choice between a black knight and a white knight
// once they choose the board should load the pieces according to their choice

// when the joiner enters, a pop-up should tell them "You are being attacked! Defend yourself!"
// and the board will be set so that their pieces are on their side


      // In games.controller.rb create
      // # redirect to a new path that has the modal and THEN
      // # redirect to game path, showing whichever board is appropriate to their choice of army




