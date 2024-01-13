extends Node

signal score_change

var score: int = 0:
	set(value):
		score = value
		
		if score != 0:
			score_change.emit()
		
var paused: bool = false

var player: String = "Player1" 
