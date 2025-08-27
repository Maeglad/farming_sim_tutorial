class_name TestSceneSaveDataManagerComponent
extends Node

func _ready() -> void:
	load_test_scene.call_deferred()
	
func load_test_scene():
	SaveGameManager.load_game()
