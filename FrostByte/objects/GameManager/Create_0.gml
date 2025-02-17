global.turn = 0;  // 0 = White's turn, 1 = Black's turn
global.followingPiece = -1; // Currently selected piece
global.whiteCounters = 5; 
global.blackCounters = 5; 
global.turn_change = false; // Tracks turn end
global.fallenTiles = array_create(64, false); // 8x8 board, default = false

