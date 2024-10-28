extends Node3D
@onready var pickable_object: XRToolsPickable = $PickableObject
@onready var pickable_object_2: XRToolsPickable = $PickableObject2
@onready var prakuros: XRToolsPickable = $Prakuros
@onready var fire_wood_1: XRToolsPickable = $FireWood1
@onready var fire_wood_2: XRToolsPickable = $FireWood2
@onready var fire_wood_3: XRToolsPickable = $FireWood3
@onready var fire_wood_4: XRToolsPickable = $FireWood4
@onready var fire_wood_5: XRToolsPickable = $FireWood5
@onready var fire_wood_6: XRToolsPickable = $FireWood6
@onready var fire_wood_7: XRToolsPickable = $FireWood7
@onready var fire_wood_8: XRToolsPickable = $FireWood8



var arrow_instances := []
var arrow_counter := 0
var amount = 4

func _ready():
	pickable_object_2.visible = false
	pickable_object_2.process_mode = Node.PROCESS_MODE_DISABLED
	prakuros.visible = false
	prakuros.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_1.visible = false
	fire_wood_1.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_2.visible = false
	fire_wood_2.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_3.visible = false
	fire_wood_3.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_4.visible = false
	fire_wood_4.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_5.visible = false
	fire_wood_5.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_6.visible = false
	fire_wood_6.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_7.visible = false
	fire_wood_7.process_mode = Node.PROCESS_MODE_DISABLED
	fire_wood_8.visible = false
	fire_wood_8.process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta):
	pass

func _on_area_3d_area_exited(area: Area3D) -> void:
	pass

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == pickable_object:
		if body.freeze:
			body.freeze = false
			pickable_object_2.visible = true
			pickable_object_2.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == pickable_object_2:
		if body.freeze:
			body.freeze = false
			fire_wood_1.visible = true
			fire_wood_1.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_1:
		if body.freeze:
			body.freeze = false
			fire_wood_2.visible = true
			fire_wood_2.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_2:
		if body.freeze:
			body.freeze = false
			fire_wood_3.visible = true
			fire_wood_3.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_3:
		if body.freeze:
			body.freeze = false
			fire_wood_4.visible = true
			fire_wood_4.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_4:
		if body.freeze:
			body.freeze = false
			fire_wood_5.visible = true
			fire_wood_5.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_5:
		if body.freeze:
			body.freeze = false
			fire_wood_6.visible = true
			fire_wood_6.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_6:
		if body.freeze:
			body.freeze = false
			fire_wood_7.visible = true
			fire_wood_7.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_7:
		if body.freeze:
			body.freeze = false
			fire_wood_8.visible = true
			fire_wood_8.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == fire_wood_8:
		if body.freeze:
			body.freeze = false
			prakuros.visible = true
			prakuros.process_mode = Node.PROCESS_MODE_ALWAYS
	if body == prakuros:
		if body.freeze:
			body.freeze = false
			print("paimtos prakuros")
