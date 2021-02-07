extends TileMap

var sizex = 25
var sizey = 25
var tolerance = .5
var perlinarray = [
	[0,1,1,0,0],
	[0,0,1,1,1],
	[0,0,1,1,1],
	[1,0,1,1,1],
	[1,1,1,0,0]
]

var _tileset

func _ready():
	_tileset = get_tileset()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
