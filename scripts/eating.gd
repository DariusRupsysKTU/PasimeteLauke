extends Area3D
@onready var area_3d: Area3D = $"."
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var mesh_instance_3d: MeshInstance3D = $"../MeshInstance3D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	body.process_mode = Node.PROCESS_MODE_DISABLED
	body.hide()
	audio_stream_player_3d.play()
	if body.name.begins_with("PoisonousBerry"):
		mesh_instance_3d.set_instance_shader_parameter("blur_power", 0.005)
