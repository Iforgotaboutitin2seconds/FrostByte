if (global.followingPiece == id) {
    
    // Start dragging – store original location the first time
    if (!dragging) {
        dragging = true;
        origX = x;
        origY = y;
    }
    
    // Make the piece follow the mouse.
    x = mouse_x - 16;
    y = mouse_y - 16;
    
    // (Re)calculate legal moves for a king (8 adjacent cells) based on the original board position.
    var origBoardX = origX div 32; 
    var origBoardY = origY div 32;
    
    // Clear the list of legal moves before recalculating.
    ds_list_clear(legalMovesList);
    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue; // skip the current cell
            var newX = origBoardX + dx;
            var newY = origBoardY + dy;
            if (newX >= 0 && newX < 8 && newY >= 0 && newY < 8) {
                var cellIndex = newX + newY * 8;
                ds_list_add(legalMovesList, cellIndex);
            }
        }
	}
    
    // When the player clicks to drop the piece:
	if (mouse_check_button_pressed(mb_left)) {
    // Snap the drop position to the grid.
    var dropX = mouse_x - (mouse_x mod 32);
    var dropY = mouse_y - (mouse_y mod 32);
    var dropBoardX = dropX div 32;
    var dropBoardY = dropY div 32;
    var dropIndex = dropBoardX + dropBoardY * 8;
    
    // Check if dropIndex is among the legal moves.
    var validMove = false;
    for (var i = 0; i < ds_list_size(legalMovesList); i++) {
        if (ds_list_find_value(legalMovesList, i) == dropIndex) {
            validMove = true;
            break;
        }
    }
    
    if (validMove) {
        var enemyKing = collision_point(dropX + 16, dropY + 16, KingPieceBlack, false, true);
        if (enemyKing != noone && enemyKing.team != team) {
            instance_destroy(enemyKing);

			room_goto(p1win);

        }
        
        x = dropX;
        y = dropY;
    } else {
        // Invalid drop move – reset position.
        x = origX;
        y = origY;
    }
    
    // End the drag and clear selection.
    global.followingPiece = -1;
    dragging = false;
    ds_list_clear(legalMovesList);
    
    // Switch turn after a move (if no capture ended the game)
    global.turn = (global.turn + 1) mod 2;
}
    
} else {
    // Only allow selection if this piece is on the current turn.
    if (team == global.turn) {
        if (mouse_x >= x + 4 && mouse_x <= x + 28 &&
            mouse_y >= y + 4 && mouse_y <= y + 28)
        {
            hovered = true;
            if (mouse_check_button_pressed(mb_left) && global.followingPiece == -1) {
                global.followingPiece = id;
            }
        }
        else {
            hovered = false;
        }
    }
    else {
        hovered = false;
    }
    
    // Clear legal moves if not dragging.
    ds_list_clear(legalMovesList);
}
