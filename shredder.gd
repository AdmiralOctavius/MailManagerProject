extends Node2D

var readyToShred : bool
@export var shredderSound: AudioStreamPlayer

func _on_Document_Entered(area: Area2D) -> void:
	#Testing 
	readyToShred = true
	print_debug("Object entered Shredder")
	print_debug(area.name)
	if(area.get_parent().readyToShred == true):
		print_debug("Page is ready to Shred")
		shredderSound.play()
		area.get_parent().queue_free()
