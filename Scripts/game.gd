extends Node2D
@onready var audio_stream = $AudioStreamPlayer2D as AudioStreamPlayer2D


func _ready():
	
	Global.connect("score_change", change_score)
	
	
	# Set random heights for first thee pipes
	var pipes = get_tree().get_nodes_in_group("Pipes")
	for pipe in pipes:
		pipe.position.y = randi_range(0,130)

# Area 2D Can not detect if static body moves inside it unless the area moves
func _on_respawner_body_entered(body):
	if body.is_in_group("Pipes"):
		body.position = Vector2(450, randi_range(0,130))

# Change Score
func change_score():
	$Label.text = str(Global.score)
	
	# Play Point Sound
	audio_stream.stream = preload("res://Assets/flappy-bird-assets-master/audio/point.wav")
	audio_stream.play()

func _on_player_player_death():
	$EndScreen.visible = true
	$Label.visible = false
	Global.paused = true
	
	# Play Die sound
	audio_stream.stream = preload("res://Assets/flappy-bird-assets-master/audio/die.wav")
	audio_stream.play()
