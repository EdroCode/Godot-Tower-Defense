extends Area2D


var selection

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	
	global_position = get_viewport().get_mouse_position()
	
	


func _on_MouseDetect_body_entered(body):
	
	var bodies = self.get_overlapping_bodies()
	
	
	
	for body in bodies:
		
		if body.is_in_group("Interectable"):
			
			selection = "interectable"



func _on_MouseDetect_body_exited(body):
	
	if selection == "interectable":
		selection = null


func _on_MouseDetect_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	var areas = self.get_overlapping_bodies()
	
	
	
	for area in areas:
		
		if area.is_in_group("Interectable"):
			
			selection = "interectable"


func _on_MouseDetect_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if selection == "interectable":
		selection = null
