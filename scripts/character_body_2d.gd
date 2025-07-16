extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	## Direction 
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		## Animation Placeholder will be changed into AnimationTree Implementation
		if Input.is_action_pressed("down"):
			$AnimationPlayer.play("walk_down")
		elif Input.is_action_pressed("up"):
			$AnimationPlayer.play("walk_up")
		elif Input.is_action_pressed("left"):
			$AnimationPlayer.play("walk_left")
		elif Input.is_action_pressed("right"):
			$AnimationPlayer.play("walk_right")
			
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
