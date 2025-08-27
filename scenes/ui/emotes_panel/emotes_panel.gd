class_name EmotesPanel
extends Panel

@onready var animated_sprite_2d: AnimatedSprite2D = $Emote/AnimatedSprite2D
@onready var emotes_idle_timer: Timer = $EmotesIdleTimer

var idle_emotes: Array = ["emote_1_idle", "emote_2_smile", "emote_3_earwave", "emote_4_blink"]

func _ready() -> void:
	animated_sprite_2d.play("emote_1_idle")

func play_emote(animation: String) -> void:
	animated_sprite_2d.stop()
	animated_sprite_2d.play(animation)


func _on_emotes_idle_timer_timeout() -> void:
	var index = randi_range(0, 3)
	var emote = idle_emotes[index]
	play_emote(emote)
