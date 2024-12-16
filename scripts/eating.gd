extends Area3D
@onready var area_3d: Area3D = $"."
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var mesh_instance_3d: MeshInstance3D = $"../MeshInstance3D"
@onready var fade: XRToolsFade = $"../Fade"
@onready var xr_camera_3d: XRCamera3D = $".."
@onready var rabbit_stick: XRToolsPickable = $"../../../../SharpStick"
@onready var rabbit_area: Area3D = $"../../../../SharpStick/Area3D"
@onready var rabbit_mesh: MeshInstance3D = $"../../../../SharpStick/Area3D/Mesh_Rabbit"
@onready var hungry_sound: AudioStreamPlayer3D = $hungry_sound
@onready var poison_sound: AudioStreamPlayer3D = $poison_sound

var timer = 0
var sound_timer = 0
var hunger = 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hunger>100:
		hunger=100
	if hunger<=100 or hunger>0:
		hunger-=(delta*0.1)
	if hunger<=0:
		hunger=0
		if sound_timer<=0:
			hungry_sound.play()
			sound_timer=10
		else:
			sound_timer-=delta
	if timer>0:
		timer-=delta
		fade.set_fade(xr_camera_3d, Color(0.7, 0.4, 0, timer*0.025))
	else:
		fade.set_fade(xr_camera_3d, Color(0, 0, 0, 0))

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name.begins_with("PoisonousBerry"):
		timer = 7
		fade.set_fade(xr_camera_3d, Color(0.7, 0.4, 0, timer*0.025))
		hunger-=7
		poison_sound.play()
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
	else: if body.name.contains("Berry"):
		hunger+=5
		audio_stream_player_3d.play()
		body.process_mode = Node.PROCESS_MODE_DISABLED
		body.hide()
	else: if body==rabbit_stick:
		if !rabbit_area.active:
			rabbit_area.hide()
			rabbit_area.active=true
			if rabbit_mesh.valgomas:
				hunger+=30
				audio_stream_player_3d.play()
			else:
				timer = 10
				fade.set_fade(xr_camera_3d, Color(0.7, 0.4, 0, timer*0.025))
				hunger-=15
				poison_sound.play()
