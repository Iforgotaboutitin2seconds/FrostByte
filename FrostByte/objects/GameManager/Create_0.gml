/// @description Insert description here
// You can write your code in this editor

global.followingPiece = -1;

boardArray[64] = 0
location = -1;


function CoordtoArray(p1, p2){
	xCoord = p1;
	yCoord = p2;
	
	
	location = p1/32 + (p2/32)*8;
	boardArray[location] = 2
	
	
	
}
