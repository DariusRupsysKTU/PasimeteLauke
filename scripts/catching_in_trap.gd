extends Area3D

@onready var box: XRToolsPickable = $"../PickableObject"
@onready var dead_rabbit: XRToolsPickable = $"../PickableObject2"

@onready var trap_stick: Area3D = $"../Area3D2"
@onready var trap_box: Area3D = $"../Area3D"

var boxpart = false
var stickpart = false
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	box.process_mode = Node.PROCESS_MODE_DISABLED
	box.hide()
	dead_rabbit.process_mode = Node.PROCESS_MODE_DISABLED
	dead_rabbit.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if boxpart and stickpart and !active:
		active = true
		print("active")
		print(active)

func _on_body_entered(body: Node3D) -> void:
	if active:
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
		box.process_mode = Node.PROCESS_MODE_ALWAYS
		box.show()
		dead_rabbit.process_mode = Node.PROCESS_MODE_ALWAYS
		dead_rabbit.show()
		trap_box.process_mode = Node.PROCESS_MODE_DISABLED
		trap_box.hide()
		trap_stick.process_mode = Node.PROCESS_MODE_DISABLED
		trap_stick.hide()
		active=false

func build_trap(part: String) -> void:
	print(part)
	if part=="Area3D2":
		stickpart=true
	else:
		boxpart=true
