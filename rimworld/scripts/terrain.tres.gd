extends Node2D

var noise = OpenSimplexNoise.new()
export var  randSeed:=500
export var noiseImage:Image
export var width:=128
export var height:=128

# Called when the node enters the scene tree for the first time.
func _ready():
	noise.seed = randSeed
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8
	noiseImage = noise.get_image(width,height)
	
	noiseImage.lock()
	for x in range(0,width):
		for y in range(0,height):
			
			var data:=noiseImage.get_pixel(x,y)
			if data[0]>0.5:
				$TileMap.set_cell(x,y,1)
			if data[0]<0.5:
				$TileMap.set_cell(x,y,1)
			pass
	noiseImage.unlock()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
