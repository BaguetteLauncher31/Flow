extends Node

@export var obstacle_scene: PackedScene
@export var player: CharacterBody2D

var spawntimer: float = 0.0

func _process(delta: float) -> void:
	spawntimer += delta
	if spawntimer >= 0.4:
		spawntimer = 0.0
		
		if obstacle_scene and player:
			var obstacle: Node2D = obstacle_scene.instantiate()
			obstacle.global_position = Vector2(player.global_position.x + 1200, randf_range(-420, 100))
			add_child(obstacle)
			print("spawned: ", obstacle.global_position)
		
