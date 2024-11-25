@tool
extends Area3D

## Signal when pointer event occurs on area
signal pointer_event(event)

var bodies: Dictionary
var flag := false

func _process(delta: float) -> void:
	#super._process(delta)
	for body in bodies:
		if not body.freeze:
			if bodies[body] != null and body.transform.is_equal_approx(bodies[body]):
				#body.collision_layer = 0
				body.freeze = true
				body.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
				flag=true
				body.reparent(self)

			bodies[body] = Transform3D(body.transform)

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body != self and !flag:
		bodies[body] = Transform3D(body.transform)
	elif flag:
		flag = false

func _on_body_exited(body: Node3D) -> void:
	if(!flag):
			
		print(body.name)
		bodies[body] = null
		body.freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC
		body.freeze = false
		var wn = get_node("/root/world")
		print(wn.name)
		body.reparent(wn, true)
		#body.collision_layer = 3

func unfreeze(body: Node3D) -> void:
	pass
