extends Node

@export var obstacle_scene: PackedScene
@export var player: CharacterBody2D

var spawntimer: float = 0.0

func _process(delta: float) -> void:
	spawntimer += delta
	if spawntimer >= 1.5:
		spawntimer = 0.0
		
		if obstacle_scene and player:
			var obstacle = obstacle_scene.instantiate()
			obstacle.global_position = Vector2(player.global_position.x + 800, randf_range(100, 500))
			add_child(obstacle)
