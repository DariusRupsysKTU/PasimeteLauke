@tool
extends Area3D

## Signal when pointer event occurs on area
signal pointer_event(event)


# Add support for is_xr_class on XRTools classes
func is_xr_class(name : String) -> bool:
	return name == "XRToolsInteractableArea"


var active = true
func _on_body_entered(body: Node3D) -> void:
	if(active):
		print(body.name)
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
		get_parent_node_3d().show()
	active = false
