// Check if this piece is being dragged.
if (global.followingPiece == id) {

    // Start dragging by saving the original position once.
    if (!dragging) {
        dragging = true;
        origX = x;
        origY = y;
    }

    // Make the piece follow the mouse (centered on the cursor).
    x = mouse_x - 16;
    y = mouse_y - 16;

    // Calculate legal moves for a king (one cell in any direction)
    // based on the original board position.
    var origBoardX = origX div 32;
    var origBoardY = origY div 32;
    ds_list_clear(legalMovesList);
    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            // Skip the current cell (no move)
            if (dx == 0 && dy == 0) continue;
            
            var newX = origBoardX + dx;
            var newY = origBoardY + dy;
            // Ensure the move is within an 8x8 board.
            if (newX >= 0 && newX < 8 && newY >= 0 && newY < 8) {
                var cellIndex = newX + newY * 8;
                ds_list_add(legalMovesList, cellIndex);
            }
        }
    }

    // When the player clicks to drop the piece.
    if (mouse_check_button_pressed(mb_left)) {
        // Snap the drop position to the 32x32 grid.
        var dropX = mouse_x - (mouse_x mod 32);
        var dropY = mouse_y - (mouse_y mod 32);
        var dropBoardX = dropX div 32;
        var dropBoardY = dropY div 32;
        var dropIndex = dropBoardX + dropBoardY * 8;

        // Check if the drop position is a legal move.
        var validMove = false;
        for (var i = 0; i < ds_list_size(legalMovesList); i++) {
            if (ds_list_find_value(legalMovesList, i) == dropIndex) {
                validMove = true;
                break;
            }
        }

        if (validMove) {
            // Check for an enemy king at the drop position.
            var enemyKing = collision_point(dropX + 16, dropY + 16, KingPieceBlack, false, true);
            if (enemyKing != noone && enemyKing.team != team) {
                // Capture the enemy king and go to the win screen.
                instance_destroy(enemyKing);
                room_goto(p1win);
            }
            // Place the piece on the grid.
            x = dropX;
            y = dropY;
        } else {
            // If the move is invalid, reset the piece to its original position.
            x = origX;
            y = origY;
        }

        // End dragging and clear selection.
        global.followingPiece = -1;
        dragging = false;
        ds_list_clear(legalMovesList);

        // Switch turns (if the game hasn't ended).
        global.turn = (global.turn + 1) mod 2;
    }
}
else {
    // If this piece isn't being dragged, allow selection if it's the correct turn.
    if (team == global.turn &&
        mouse_x >= x + 4 && mouse_x <= x + 28 &&
        mouse_y >= y + 4 && mouse_y <= y + 28)
    {
        hovered = true;
        // Select the piece on mouse click if no other piece is being moved.
        if (mouse_check_button_pressed(mb_left) && global.followingPiece == -1) {
            global.followingPiece = id;
        }
    }
    else {
        hovered = false;
    }
    
    // Clear legal moves when not dragging.
    ds_list_clear(legalMovesList);
}
