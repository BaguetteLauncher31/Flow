extends Camera2D

@export var player: CharacterBody2D = null

func _process(delta: float) -> void:
	global_position.y = 197
