extends Control

@onready var time_label: Label = $TimePanel/MarginContainer/TimeLabel
@onready var day_label: Label = $DayPanel/MarginContainer/DayLabel

func _ready() -> void:
	TimeManager.time_tick.connect(on_time_tick)

func on_time_tick(day: int, hour: int, minutes: int) -> void:
	day_label.text = "Day " + str(day)
	time_label.text = "%02d:%02d" % [hour, minutes]
	
