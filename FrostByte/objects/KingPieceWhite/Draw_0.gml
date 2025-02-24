draw_self();
if (global.followingPiece == id) {
    for (var i = 0; i < ds_list_size(legalMovesList); i++) {
        var cellIndex = ds_list_find_value(legalMovesList, i);
        var cellX = (cellIndex mod 8) * 32;
        var cellY = (cellIndex div 8) * 32;
        draw_sprite(spr_legalMove, 0, cellX, cellY);
    }
}
if (hovered) {
    draw_sprite(Hover_spr, image_index, x, y);
}
