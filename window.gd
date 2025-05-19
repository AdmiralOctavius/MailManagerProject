extends Node2D

var mouseOver : bool
var mousePos : Vector2 = Vector2.ZERO
var difference :Vector2
@export var readyToShred : bool

func setShred(shredTime: bool) -> void:
	readyToShred = shredTime
	
func _on_window_mouse_entered() -> void:
	mouseOver = true

func _on_window_mouse_exited() -> void:
	mouseOver = false
	
func _process(delta: float) -> void:
	difference = mousePos - get_global_mouse_position()

	#if Input.is_action_pressed("Click"):
		#print_debug("Mouse click recieved")

	if Input.is_action_pressed("Click") and mouseOver and difference != Vector2.ZERO:
		global_position -= difference
	
	mousePos = get_global_mouse_position()
