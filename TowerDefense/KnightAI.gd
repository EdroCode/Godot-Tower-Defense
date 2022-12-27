extends KinematicBody2D

export (int) var speed = 200

onready var target = position
var velocity = Vector2()
var circle

var can_attack = true


var is_attacking = false
var moving = false

var area_area = ""

var area_body


func _ready():
	
	circle = get_parent().get_node("MarkCircle")
	pass

func _input(event):
	
	if event.is_action_pressed("click"):
		
		if get_parent().get_node("MouseDetect").selection != "interectable":
			circle.global_position = get_global_mouse_position()
			target = get_global_mouse_position()
			$AnimationPlayer.play("Run")
			moving = true
		
		
		 
	
	
	if event.is_action_pressed("Attack") and can_attack == true:
		
		if moving == false:
			
			is_attacking = true
			$AnimationPlayer.play("Attack")
			can_attack = false
			
			if area_area == "tree":
				
				
				area_body.get_parent().take_damage()


func _physics_process(delta):
	
	
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		moving = true
		$AnimationPlayer.play("Run")
		
	
	
	if velocity.x > 0:
		
		
		$Warrior.flip_h = false
		
	elif velocity.x < 0:
		
		$Warrior.flip_h = true
		
	
	
	if position.distance_to(target) < 5 and is_attacking == false:
		
		$AnimationPlayer.play("Idle")
		moving = false
		
	
	
	


func start_idle():
	
	
	$AnimationPlayer.play("Idle")
	velocity.x = 0
	velocity.y = 0


func set_attacking():
	
	can_attack = true

func set_is_attacking():
	
	is_attacking = false




func _on_Area2D_area_entered(area):
	
	var areas = $Area2D.get_overlapping_areas()
	
	for area in areas:
		
		if area.is_in_group("Tree"):
			
			print("tree entered")
			area_body = area
			area_area = "tree"


func _on_Area2D_area_exited(area):
	pass # Replace with function body.
