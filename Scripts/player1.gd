extends CharacterBody2D

signal player_death
var GRAVITY: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var JUMP_VELOCITY: int = -200
var FALL_SPEED: float = 0.8

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta * FALL_SPEED	
	
	if Global.paused:
		$AnimatedSprite2D.stop()
		
	if !Global.paused:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			
	move_and_slide()

func _on_resetter_body_entered(body):
	if body.is_in_group("Pipes"):
		player_death.emit()

func _on_animated_sprite_2d_animation_looped():
		$AudioStreamPlayer2D.play()
