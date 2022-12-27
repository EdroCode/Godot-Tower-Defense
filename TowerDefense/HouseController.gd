extends KinematicBody2D


onready var lifeBar = $LifeBar/Fill
var hp = 100

func _ready():
	
	lifeBar.value = hp



func set_value(value):
	
	lifeBar.value = value


func _physics_process(delta):
	
	
	pass

# Repair Button
func _on_Button_button_down():
	
	lifeBar.value = 100


func _on_Button_mouse_entered():
	$LifeBar.visible = false
	$ToolMenu.visible = true


func _on_Button_mouse_exited():
	$LifeBar.visible = true
	$ToolMenu.visible = false
