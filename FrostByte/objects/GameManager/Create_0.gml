/// @description Insert description here
// You can write your code in this editor

global.followingPiece = -1;

boardArray[64] = 0
location = -1;


function Detect(p1, p2){
	xCoord = p1;
	yCoord = p2;
	
	for(i=0;i<64;i++){
		boardArray[i]=0
	}
	
	location = p1/32 + (p2/32)*8;
	boardArray[location] = 2
	
	
	
}
