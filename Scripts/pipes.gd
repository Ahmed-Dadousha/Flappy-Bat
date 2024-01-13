extends StaticBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !Global.paused:
		position.x -= 1


func _on_score_area_body_entered(_body):
	Global.score += 1
