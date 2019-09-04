extends Area2D

func _on_Crown_body_entered(body):
	$"/root/GameManager".crown_collected()
