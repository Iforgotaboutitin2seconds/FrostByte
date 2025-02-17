if (global.followingPiece == id) {
    if (!dragging) {
        dragging = true;
        origX = x;
        origY = y;
    }

    x = mouse_x - 16;
    y = mouse_y - 16;

    var origBoardX = origX div 32;
    var origBoardY = origY div 32;
    ds_list_clear(legalMovesList);

    for (var dx = -1; dx <= 1; dx++) {
        for (var dy = -1; dy <= 1; dy++) {
            if (dx == 0 && dy == 0) continue;
            
            var newX = origBoardX + dx;
            var newY = origBoardY + dy;

            var index = newX + newY * 8;
if (newX >= 0 && newX < 8 && newY >= 0 && newY < 8 && !global.fallenTiles[index]) {
                if (obj_FallingTileManager.fallen_tiles[# newX, newY] == 0 && 
    instance_place(newX * 32 + 16, newY * 32 + 16, obj_FallenTile) == noone) {
                    var cellIndex = newX + newY * 8;
                    ds_list_add(legalMovesList, cellIndex);
                }
            }
        }
    }

    if (mouse_check_button_pressed(mb_left)) {
        var dropX = mouse_x - (mouse_x mod 32);
        var dropY = mouse_y - (mouse_y mod 32);
        var dropBoardX = dropX div 32;
        var dropBoardY = dropY div 32;
        var dropIndex = dropBoardX + dropBoardY * 8;

        var validMove = false;
        for (var i = 0; i < ds_list_size(legalMovesList); i++) {
            if (ds_list_find_value(legalMovesList, i) == dropIndex) {
                validMove = true;
                break;
            }
        }

        if (validMove) {
            var enemyKing = instance_place(dropX + 16, dropY + 16, KingPieceBlack);
            if (enemyKing != noone && enemyKing.team != team) {
                instance_destroy(enemyKing);
                room_goto(p1win);
            }
            x = dropX;
            y = dropY;

            global.turn_change = true;  
        } else {
            x = origX;
            y = origY;
        }

        global.followingPiece = -1;
        dragging = false;
        ds_list_clear(legalMovesList);
        global.turn = (global.turn + 1) mod 2;
    }
}
else {
    if (team == global.turn && global.followingPiece == -1 &&
        mouse_x >= x && mouse_x <= x + 32 &&
        mouse_y >= y && mouse_y <= y + 32)
    {
        hovered = true;
        if (mouse_check_button_pressed(mb_left)) {
            global.followingPiece = id;
        }
    }
    else {
        hovered = false;
    }
}
