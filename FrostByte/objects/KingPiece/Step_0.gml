/// @description Insert description here
// You can write your code in this editor

hovered = false
if (global.followingPiece == id){
		hovered = true;
		x = mouse_x - 16
		y = mouse_y - 16
		if (mouse_check_button_pressed(mb_left)){
			var _preX = mouse_x - mouse_x%32
			var _preY = mouse_y - mouse_y%32
			var _id = id
			var _valid = true
			var _team = team
			with(KingPiece){
				if (_id != id && _preX == x && _preY == y && _team == team){
					valid = false
				}
			}
		if (_valid){
		global.followingPiece = -1
		x = _preX
		y = _preY
		}
	}
}else{
		

if ( mouse_x >= x + 4 && mouse_x <= x +28) && ( mouse_y >= y + 4 && mouse_y <= y +28){
	
	hovered = true
	if (mouse_check_button_pressed(mb_left) && global.followingPiece == -1){
		
		global.followingPiece = id
		
		}
	}
}

GameManager.Detect(x,y)
