extends Area3D

@onready var area_3d_3: Area3D = $"../Area3D3"

var active = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if self.name=="Area3D":
		active = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if(active):
		print(body.name)
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
		self.show()
		area_3d_3.build_trap(self.name)
	active = false
