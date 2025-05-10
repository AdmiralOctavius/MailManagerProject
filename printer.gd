extends Node2D

var document = load("res://page_template.tscn")
@export var spawn_scene: PackedScene
@export var scene_root: Node2D
var printerEnd: Node2D

func _ready():
	printerEnd = get_child(0)
	
func get_input():
	if Input.is_action_pressed("Print"):
		print_debug("Mouse click recieved")
		printDocument(spawn_scene)


func printDocument(_spawn_scene := spawn_scene) -> void:
	var page := _spawn_scene.instantiate() as Node2D

	scene_root.add_child(page)

	page.global_position = printerEnd.global_position
	
func _process(delta: float) -> void:
	get_input()   
