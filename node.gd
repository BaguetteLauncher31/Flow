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
			var bumper: Area2D = obstacle.get_node("FrontBumper")
			bumper.body_entered.connect(_on_obstacle_hit)
			add_child(obstacle)
			print("spawned: ", obstacle.global_position)
		
		
func _on_obstacle_hit(body: Node2D) -> void:
	if body == player:
		get_tree().reload_current_scene()
