grid_size = 8; // 8x8 grid
tile_size = 32;

// Create a grid to track fallen tiles
fallen_tiles = ds_grid_create(grid_size, grid_size);
ds_grid_clear(fallen_tiles, 0); // 0 means the tile is still intact