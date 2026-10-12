extends Node

@export var obstacle_scene: PackedScene
@export var bonus_scene: PackedScene
@export var score_node: Node
@export var player: CharacterBody2D

var spawntimer: float = 0.0
var last_bonus_x: float = -100000.0
var bonuses: Array = []

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
	_process_bonuses()
		
		
func _on_obstacle_hit(body: Node2D) -> void:
	if body == player:
		get_tree().call_deferred("reload_current_scene")

func _process_bonuses() -> void: 
	if not bonus_scene or not player:
		return
		
	if last_bonus_x < player.global_position.x + 2000:
		var x: float = max(player.global_position.x + 1200, last_bonus_x + 2400) + randf_range(0, 1200)
		var bonus: Area2D = bonus_scene.instantiate()
		bonus.global_position = Vector2(x, randf_range(-283, 283))
		bonus.collected.connect(_on_bonus_collected)
		add_child(bonus)
		bonuses.append(bonus)
		last_bonus_x = x
	
	for b in bonuses.duplicate():
		if not is_instance_valid(b):
			bonuses.erase(b)
		elif b.global_position.x < player.global_position.x - 1500:
			b.queue_free()
			bonuses.erase(b)
			
func _on_bonus_collected() -> void:
	if score_node:
		score_node.add_points(1000)
