extends Node3D
@onready var rabbit = preload("res://Nodes/rabbit.tscn")
@onready var trap: Node3D = $"../Trap2"
@onready var trap_area: Area3D = $"../Trap2/Area3D3"

var timer = 15
var rabbit_ready = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if trap_area.active:
		if timer > 0:
			timer -= delta
			rabbit_ready = true
		else:
			rabbit_ready = false
			var rabbit_instance = rabbit.instantiate()
			rabbit_instance.position = position
			get_parent().add_child(rabbit_instance)
			rabbit_instance.update_target_location(trap.position)
			timer = 30
