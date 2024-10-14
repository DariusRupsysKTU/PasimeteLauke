extends Node3D
@onready var pickable_object: XRToolsPickable = $PickableObject
@onready var pickable_object_2: XRToolsPickable = $PickableObject2

var arrow_instances := []
var arrow_counter := 0
var amount = 4

func _ready():
	pickable_object_2.visible = false;

func _process(delta):
	pass

func _on_area_3d_area_exited(area: Area3D) -> void:
	pass

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == pickable_object:
		if body.freeze:
			body.freeze = false
			print(body.name)
			pickable_object_2.visible = true;
	if body == pickable_object_2:
		if body.freeze:
			body.freeze = false
			print(body.name)
