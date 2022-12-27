extends KinematicBody2D

enum STATES {IDLE, RUN, ATTACK}

var anim_cur
var anim_nxt = "Idle"

var state_cur : int
var state_nxt = STATES.IDLE

var vel = Vector2.ZERO

var moving = false
var is_attacking = false

func _ready():
	
	pass



func _physics_process(delta):
	
	
	if state_nxt != state_cur:
		state_cur = state_nxt
	
	if anim_cur != anim_nxt:
		anim_cur = anim_nxt
		$AnimationPlayer.play(anim_nxt)
	
	
	match state_cur:
		
		STATES.IDLE:
			state_idle(delta)
		STATES.RUN:
			pass
		STATES.ATTACK:
			pass
	
	if Input.is_action_pressed("Left"):
		
		vel.x = -200
		moving = true
		
	elif Input.is_action_pressed("Right"):
		vel.x = 200
		moving = true
		
		
	elif Input.is_action_pressed("Down"):
		
		vel.y = 200
		moving = true
		
	elif Input.is_action_pressed("Up"):
		
		vel.y = -200
		moving = true
		
	else:
		
		vel.y *= 0
		vel.x *= 0
		moving = false
		
	
	
	if moving:
		
		
		if vel.x < 0:
			$Warrior.flip_h = true
		elif vel.x >0: 
			$Warrior.flip_h = false
		
		anim_nxt = "Run"
		
	else: 
		
		initialize_idle()
	
	move_and_slide(vel)




func attack():
	
	anim_nxt = "Attack"
	is_attacking = true


func initialize_idle():
	
	
	is_attacking = false
	anim_nxt = "Idle"
	state_cur = STATES.IDLE
	


func state_idle(delta):
	
	pass




func go_To(delta):
	
	anim_nxt = "Run"
	
	
	
	




# VFX

func mark_circle():
	
	var p = preload("res://MarkCircle.tscn").instance()
	p.position = get_viewport().get_mouse_position()
	get_parent().add_child(p)
	print(p)




