extends AudioStreamPlayer3D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	if rng.randi_range(0,5000) == 1:
		self.play()

