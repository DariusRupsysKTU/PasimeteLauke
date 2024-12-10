extends Node3D

var xr_interface: XRInterface
@onready var nature_sound_1: AudioStreamPlayer3D = $NatureSound1
@onready var nature_sound_2: AudioStreamPlayer3D = $NatureSound2
@onready var nature_sound_3: AudioStreamPlayer3D = $NatureSound3

func _ready():
	nature_sound_1.play()
	nature_sound_2.play()
	nature_sound_3.play()
	nature_sound_1.stream.loop = true
	nature_sound_2.stream.loop = true
	nature_sound_3.stream.loop = true
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
