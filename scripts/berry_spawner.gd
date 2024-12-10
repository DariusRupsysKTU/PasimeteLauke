extends Node3D

var Berry = preload("res://Nodes/berry.tscn")
var PoisonousBerry = preload("res://Nodes/poisonous_berry.tscn")
var rng = RandomNumberGenerator.new()
var cooldown = 0
var toSpawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var my_random_number = rng.randf_range(-4.0, 6.0)
	if my_random_number<0:
		toSpawn = PoisonousBerry
	else:
		toSpawn = Berry


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if self.get_children(false)
	if cooldown<=0:
		var inst = toSpawn.instantiate()
		add_child(inst)
