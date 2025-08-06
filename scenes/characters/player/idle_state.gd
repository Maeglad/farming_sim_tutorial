extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

var unhandled_hit: bool = false

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")


func _on_next_transitions() -> void:
	GameInputEvent.movement_input()
	
	if GameInputEvent.is_movement_input():
		transition.emit("Walk")
	
	if unhandled_hit:
		if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvent.use_tool():
			transition.emit("Chopping")
		if player.current_tool == DataTypes.Tools.TillGroud && GameInputEvent.use_tool():
			transition.emit("Tilling")
		if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvent.use_tool():
			transition.emit("Watering")
		unhandled_hit = false


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("hit")):
		print("handled hit")
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit"):
		print("unhandled hit")
		unhandled_hit = true
