extends CharacterBody2D


const SPEED = 700.0
var start_position = Vector2.ZERO

func _ready() -> void:
	start_position = global_position


func _physics_process(delta: float) -> void:
	
	velocity.x = 500
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("up", "down")
	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	if get_slide_collision_count() > 0:
		global_position = start_position
		get_tree().reload_current_scene()
	
	global_position.y = clamp(global_position.y, -283, 283)
	
