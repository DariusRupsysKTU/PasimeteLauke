extends CollisionShape3D
@onready var gpu_particles_3d: GPUParticles3D = $"../../GPUParticles3D"
@onready var prakuros: XRToolsPickable = $"../../../Prakuros"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.get_parent().name == "PickableObject":
		gpu_particles_3d.restart()
		var particles_pos = gpu_particles_3d.global_position
		var prakuros_pos = prakuros.global_position
		if prakuros_pos.y < particles_pos.y and prakuros_pos.y+2 > particles_pos.y :
			if particles_pos.x-1 < prakuros_pos.x and prakuros_pos.x < particles_pos.x+1:
				if particles_pos.z-1 < prakuros_pos.z and prakuros_pos.z < particles_pos.z+1:
					print("Ugnis!")
	pass # Replace with function body.
