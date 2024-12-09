extends Node3D
@onready var rabbit = preload("res://Nodes/rabbit.tscn")
@onready var trap: Node3D = $"../Trap2"

var timer := 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
	else:
		var rabbit_instance = rabbit.instantiate()
		rabbit_instance.position = position
		get_parent().add_child(rabbit_instance)
		rabbit_instance.update_target_location(trap.position)
		timer = 60
		
