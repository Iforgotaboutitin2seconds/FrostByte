draw_self();

// If this king is being dragged, draw the legal move markers.
if (global.followingPiece == id) {
    var cellIndex;
    for (var i = 0; i < ds_list_size(legalMovesList); i++) {
        cellIndex = ds_list_find_value(legalMovesList, i);
        // Compute x and y coordinates for this board cell.
        var cellX = (cellIndex mod 8) * 32;
        var cellY = (cellIndex div 8) * 32;
        draw_sprite(spr_legalMove, 0, cellX, cellY);
    }
}

// If the piece is hovered (but not dragged)
if (hovered) {
    draw_sprite(Hover_spr, image_index, x, y);
}
