extends Control

func _process(delta):
	get_child(0).text = "SCORE: " + str($"/root/GameManager".score)	
	get_child(1).text = "LIVES: " + str($"/root/GameManager".lives)	
	 
