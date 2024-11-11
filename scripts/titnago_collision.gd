extends CollisionShape3D
@onready var gpu_particles_3d: GPUParticles3D = $"../../GPUParticles3D"
@onready var prakuros: XRToolsPickable = $"../../../Prakuros"
@onready var prakuros_sound: AudioStreamPlayer3D = $"../../../Prakuros/AudioStreamPlayer3D"
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $"../../AudioStreamPlayer3D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.get_parent().name == "Flint1":
		gpu_particles_3d.restart()
		audio_stream_player_3d.play()
		var particles_pos = gpu_particles_3d.global_position
		var prakuros_pos = prakuros.global_position
		if prakuros_pos.y < particles_pos.y and prakuros_pos.y+2 > particles_pos.y :
			if particles_pos.x-1 < prakuros_pos.x and prakuros_pos.x < particles_pos.x+1:
				if particles_pos.z-1 < prakuros_pos.z and prakuros_pos.z < particles_pos.z+1:
					prakuros_sound.lighting()
					print("Ugnis")
	pass # Replace with function body.
