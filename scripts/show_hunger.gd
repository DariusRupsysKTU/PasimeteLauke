extends RichTextLabel

var mouth

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouth = get_node("/root/world/player/XROrigin3D/XRCamera3D/mouth")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = str(round(mouth.hunger)) + "/100"
