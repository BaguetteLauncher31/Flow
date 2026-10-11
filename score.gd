extends Label

@export var player: CharacterBody2D

func _process(delta: float) -> void:
	if player:
		text = "Score: " + str(int(player.global_position.x / 10))
