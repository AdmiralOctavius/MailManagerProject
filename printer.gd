extends Node2D

var document = load("res://page_template.tscn")
@export var spawn_scene: PackedScene
@export var scene_root: Node2D
@export var printerEnd: Node2D
@export var printerStart: Node2D
@export var printerSound: AudioStreamPlayer
@export var printerSoundEnd: AudioStreamPlayer
var pagePrinting: bool
@export var SPEED = 250
var destination: Vector2
var lastPage: Node2D
#func _ready():
	#printerEnd = get_child(0)
	
func get_input():
	if Input.is_action_pressed("Print"):
		if(pagePrinting != true):
			print_debug("Mouse click recieved")
			printDocument(spawn_scene)
			printerSound.play()


func printDocument(_spawn_scene := spawn_scene) -> void:
	var page := _spawn_scene.instantiate() as Node2D
	page.call("setShred",true)
	scene_root.add_child(page)
	
	page.global_position = printerStart.global_position
	page.z_index = 1
	lastPage = page
	set_destination(printerEnd)
	pagePrinting = true
	
func _process(delta: float) -> void:
	get_input()   

	if(pagePrinting):
		var distance_to_destination
		var distance_to_move
		if lastPage.position != destination:
			distance_to_destination = lastPage.position.distance_to(destination)
			distance_to_move = SPEED * delta
			if abs(distance_to_destination) < abs(distance_to_move):
				distance_to_move = distance_to_destination
			lastPage.position += lastPage.position.direction_to(destination) * distance_to_move
		if(lastPage.position == destination):
			pagePrinting = false
			printerSound.stop()
			printerSoundEnd.play()

func set_destination(new_destination):
	destination = new_destination.global_position
	print("new_destination:", new_destination)


			  
