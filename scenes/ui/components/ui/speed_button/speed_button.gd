extends Button

@export var speedMultiplier: int


func _on_pressed() -> void:
	TimeManager.game_speed = speedMultiplier
