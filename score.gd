extends Label

@export var player: CharacterBody2D

var bonus: int = 0

func _process(delta: float) -> void:
	if player:
		text = "Score: " + str(int(player.global_position.x / 10) + bonus)

func add_points(amount: int) -> void:
	bonus += amount
	print("bonus is now: ", bonus)
