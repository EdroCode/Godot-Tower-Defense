extends KinematicBody2D

var playerIsInArea = false

var hp
var cutted = false

func _ready():
	
	hp = 50

func _on_Area2D_body_entered(body):
	
	var bodies = $Area2D.get_overlapping_bodies()
	
	for body in bodies:
		
		if body.is_in_group("Player"):
			
			playerIsInArea = true
	
	


func _on_Area2D_body_exited(body):
	
	
	var bodies = $Area2D.get_overlapping_bodies()
	
	for body in bodies:
		
		if body.is_in_group("Player"):
			
			playerIsInArea = false


func _physics_process(delta):
	
	
	if hp <= 0:
		
		hp = 0
	
	if cutted == true:
		print($GrowTimer.time_left)
	


func _on_Knight_attacking():
	
	if playerIsInArea == true:
		
		if cutted == false:
			
			$AnimationPlayer.play("Hit")
			hp -= 15
			print("hit")
		
		
	
	

func take_damage():
	
	if cutted == false:
		
		
		get_parent().get_node("WoodUI").wood += 5
		$AnimationPlayer.play("Hit")
		hp -= 15
		print("hit")



func idle_play():
	
	$AnimationPlayer.play("Wind")




func check_hp():
	
	if hp <= 0:
		cutted = true
		$AnimationPlayer.play("Cut")
		grow()
		


func grow():
	

	$GrowTimer.wait_time = rand_range(7,15)
	$GrowTimer.start()
	pass


func _on_GrowTimer_timeout():
	

	cutted = false
	idle_play()
	hp = 50




func _on_Area2D_area_entered(area):
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	pass # Replace with function body.
