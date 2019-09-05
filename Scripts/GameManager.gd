extends Node

var lives = 3
var score = 0
var curScore = 0
var curLevel = 1
	
func coin_collected ():
	curScore += 1
	score += 1
	
func crown_collected ():
	curScore = 0
	
	if curLevel == 1:	
		get_tree().change_scene("Scenes/Stage 2.tscn")
	elif curLevel == 2:	
		get_tree().change_scene("Scenes/Stage 3.tscn")
	elif curLevel == 3:	
		lives = 3
		score = 0
		curScore = 0
		curLevel = 0
		get_tree().change_scene("Scenes/Congratulations.tscn")
		
	curLevel += 1
	
func player_died ():
	score -= curScore
	curScore = 0
	lives -= 1
		
	if lives > 0:	
		get_tree().reload_current_scene()
	else:
		curScore = 0
		curLevel = 1
		score = 0
		lives = 3
		
		get_tree().change_scene("Scenes/Game Over.tscn")