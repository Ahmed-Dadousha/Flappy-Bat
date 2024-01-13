extends CanvasLayer



func _on_visibility_changed():
	if visible:
		$Control/Label.text = "Score:   " + str(Global.score)
		


func _on_texture_button_pressed():
	get_tree().reload_current_scene()
	Global.score = 0
	Global.paused = false
