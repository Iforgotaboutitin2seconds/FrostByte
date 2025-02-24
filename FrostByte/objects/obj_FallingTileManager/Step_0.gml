if (global.turn_change) {
    global.turn_change = false; // Reset flag

    var randX, randY;
    var attempts = 0;
    var max_attempts = 20;

    repeat (max_attempts) {
        randX = irandom(7); // 8x8 grid (0-7)
        randY = irandom(7);
        var index = randX + randY * 8;

        if (!global.fallenTiles[index]) { // Check if tile is already missing
            var occupied = instance_place(randX * 32 + 16, randY * 32 + 16, KingPieceBlack);
            if (occupied == noone) {
                occupied = instance_place(randX * 32 + 16, randY * 32 + 16, KingPieceWhite);
            }
            
            if (occupied == noone) {
                // Mark tile as fallen
                global.fallenTiles[index] = true;

                // Create a black tile at this position
                instance_create_layer(randX * 32, randY * 32, "Instances", obj_FallenTile);
                break;
            }
        }
    }
}