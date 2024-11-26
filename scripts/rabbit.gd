extends CharacterBody3D
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D


var SPEED = 3.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var current_location = global_transform.origin
	var next_location = navigation_agent_3d.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	velocity = new_velocity
	look_at(next_location)
	move_and_slide()

func update_target_location(target_location):
	navigation_agent_3d.target_position = target_location
