extends KinematicBody2D

const SPEED = 70
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var lives = 3
var score = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("Idle")
		
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_POWER
	
	velocity.y += GRAVITY
	
	if is_on_floor() == false:
		if velocity.y < 0:
			$AnimatedSprite.play("Fall")
		elif velocity.y > 0:
			$AnimatedSprite.play("Jump")
			
	if position.y > 190:
		$"/root/GameManager".player_died()
		
	velocity = move_and_slide(velocity, FLOOR)