extends Area3D

var box = preload("res://Nodes/box.tscn")
var dead_rabbit = preload("res://Nodes/dead_rabbit.tscn")

@onready var trap_stick: Area3D = $"../Area3D2"
@onready var trap_box: Area3D = $"../Area3D"
@onready var trap_berry: Area3D = $"../Area3D4"

var boxpart = false
var stickpart = false
var berrypart = false
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if boxpart and stickpart and berrypart and !active:
		active = true
		print("active")
		print(active)

func _on_body_entered(body: Node3D) -> void:
	if active:
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
		var instance_box = box.instantiate()
		add_child(instance_box)
		var instance_dead_rabbit = dead_rabbit.instantiate()
		add_child(instance_dead_rabbit)
		reset_trap()

func build_trap(part: String) -> void:
	print(part)
	if part=="Area3D2":
		stickpart=true
		trap_box.active=true
	else: if part=="Area3D4":
		berrypart=true
	else: if part=="Area3D":
		boxpart=true

func reset_trap() -> void:
	boxpart = false
	trap_box.hide()
	trap_box.active=false
	stickpart = false
	trap_stick.hide()
	trap_stick.active=true
	berrypart = false
	trap_berry.hide()
	trap_berry.active=true
	active=false
