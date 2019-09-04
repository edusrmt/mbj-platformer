extends Area2D

func _on_Coin_body_entered(body):
	$"/root/GameManager".coin_collected()
	queue_free()
