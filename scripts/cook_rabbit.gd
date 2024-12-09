extends MeshInstance3D
@onready var area_3d: Area3D = $".."
@onready var prakuros: XRToolsPickable = $"../../../Prakuros"
@onready var gpu_particles_3d: GPUParticles3D = $"../../../Campfire/GPUParticles3D"

var framer = 20
var valgomas = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var material = get_surface_override_material(0)
	material.albedo_color = Color(1, 1, 1)
	set_surface_override_material(0, material)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_active_material(0))
	if abs(prakuros.global_position.x - global_position.x) < 1 and abs(prakuros.global_position.z - global_position.z) < 1:
		if area_3d.active == false and prakuros.global_position.y < global_position.y:
			if gpu_particles_3d.is_emitting():
				if(framer > 0):
					framer = framer - 1
				else:
					var rabbitMaterial = get_surface_override_material(0)
					var rabbitColor = rabbitMaterial.albedo_color
					if(0.35 < rabbitColor.r and rabbitColor.r < 0.65):
						valgomas = true
					else:
						valgomas = false
					print(rabbitColor)
					print(valgomas)
					rabbitColor.r = rabbitColor.r-0.01
					rabbitColor.g = rabbitColor.g-0.0135
					rabbitColor.b = rabbitColor.b-0.03
					framer = 20
					rabbitMaterial.albedo_color = rabbitColor
					set_surface_override_material(0, rabbitMaterial)
	pass
