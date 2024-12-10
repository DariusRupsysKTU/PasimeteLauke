extends Node3D

var Berry = preload("res://Nodes/berry.tscn")
var PoisonousBerry = preload("res://Nodes/poisonous_berry.tscn")
var rng = RandomNumberGenerator.new()
var cooldown = 0
var toSpawn
var counter = self.get_child_count(false)
var need_new = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var my_random_number = rng.randf_range(-4.0, 6.0)
	if my_random_number<0:
		toSpawn = PoisonousBerry
	else:
		toSpawn = Berry


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooldown<=0 and need_new:
		var inst = toSpawn.instantiate()
		inst.name = inst.name + str(counter)
		add_child(inst)
		counter+=1
		cooldown = 5
		need_new = false
	else: if !need_new and !counter==self.get_child_count(false) and cooldown>0:
		need_new = true
	else: if need_new:
		cooldown-=delta
