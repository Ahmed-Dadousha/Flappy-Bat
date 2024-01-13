extends CanvasLayer
@onready var animated_sprite = $Control/charcterSelectioon/Control/AnimatedSprite2D
var current_player_index: int = 1

func _on_visibility_changed():
	if visible:
		$Control/Label.text = "Score:   " + str(Global.score)
		animated_sprite.animation = Global.player
		animated_sprite.play()
		
func _on_texture_button_pressed():
	get_tree().reload_current_scene()
	Global.score = 0
	Global.paused = false
	Global.player = animated_sprite.animation
	
func _on_left_arrow_pressed():
	
	current_player_index = 4 if current_player_index == 1 else current_player_index
	animated_sprite.animation = "Player" + str(current_player_index - 1)
	current_player_index -= 1

func _on_right_arrow_pressed():

	current_player_index = 0 if current_player_index == 3 else current_player_index
	animated_sprite.animation = "Player" + str(current_player_index + 1)
	current_player_index += 1



