extends Area3D

var active = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if(active) and body.name.begins_with("@RigidBody3D"):
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
		self.show()
		active = false
