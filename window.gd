extends Node2D

var mouseOver : bool
var mousePos : Vector2 = Vector2.ZERO
var difference :Vector2
@export var readyToShred : bool
@export var movablePage : bool

var dragging = false
signal dragsignal;

func setShred(shredTime: bool) -> void:
	readyToShred = shredTime
	
func isMovable(isMove: bool) -> void: 
	movablePage = isMove
	
func _on_window_mouse_entered() -> void:
	mouseOver = true

func _on_window_mouse_exited() -> void:
	mouseOver = false

#func _ready():
	#var dragsignal = Callable(self,"_set_ drag_pc")


func _process(delta: float) -> void:
	#difference = mousePos - get_global_mouse_position()

	#if Input.is_action_pressed("Click"):
		#print_debug("Mouse click recieved")

	#if Input.is_action_pressed("Click") and mouseOver and difference != Vector2.ZERO:
	#	if(movablePage):
	#		global_position -= difference
	#mousePos = get_global_mouse_position()
	if dragging:
		var mousepos = get_global_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Click"):
			emit_signal("dragsignal")
		elif Input.is_action_just_released("Click"):
			emit_signal("dragsignal")
	elif event is InputEventScreenTouch:
		if event.pressed and event.get_index() == 0:
			self.position = event.get_position()


func _on_dragsignal():
	dragging =! dragging
