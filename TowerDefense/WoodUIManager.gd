extends Control


var wood = 0

func _ready():
	
	wood = 0

func _physics_process(delta):
	
	
	$Label.text = str(wood)
