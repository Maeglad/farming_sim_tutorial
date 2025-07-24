class_name NonPlayableCharacter
extends CharacterBody2D

@export var min_walk_cycle: int = 2
@export var max_walk_cycle: int = 6

var walk_cycles: int
var current_walk_cycle: int

func _ready() -> void:
	reset_walk_cycles()

func reset_walk_cycles() -> void:
	walk_cycles = randi_range(min_walk_cycle, max_walk_cycle)
	current_walk_cycle = 0
