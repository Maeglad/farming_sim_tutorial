class_name DayNightCycleComponent
extends CanvasModulate

@export var initial_day: int = 1:
	set(value):
		initial_day = value
		TimeManager.initial_day = value
		TimeManager.set_initial_time()
		
@export var initial_hour: int = 12:
	set(value):
		initial_hour = value
		TimeManager.initial_hour = value
		TimeManager.set_initial_time()
		
@export var initial_minute: int = 30:
	set(value):
		initial_minute = value
		TimeManager.initial_minute = value
		TimeManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready() -> void:
	TimeManager.initial_day = initial_day
	TimeManager.initial_hour = initial_hour
	TimeManager.initial_minute = initial_minute
	TimeManager.set_initial_time()
	
	TimeManager.game_time.connect(on_game_time)
	
func on_game_time(time: float) -> void:
	var sample_value = 0.5 * (sin(time - PI * 0.5) + 1.0)
	color = day_night_gradient_texture.gradient.sample(sample_value)
