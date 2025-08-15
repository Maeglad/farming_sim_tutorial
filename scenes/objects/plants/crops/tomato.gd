extends Node2D

var tomato_harvest_scene = preload("res://scenes/objects/plants/tomato_harvest.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var flowering_particles: GPUParticles2D = $FloweringParticles
@onready var watering_particles: GPUParticles2D = $"Watering particles"
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var growth_state: DataTypes.GrowthState = DataTypes.GrowthState.Seed
var frame_offset: int = 6

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_hurt)
	growth_cycle_component.crop_maturity.connect(on_crop_maturity)
	growth_cycle_component.crop_harvesting.connect(on_crop_harvesting)

func _process(delta: float) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state + frame_offset
	
	#if growth_state == DataTypes.GrowthState.Maturity:
		#flowering_particles.emitting = true

func on_hurt(hit_damage: int) -> void:
	if !growth_cycle_component.is_watered:
		growth_cycle_component.is_watered = true
		watering_particles.emitting = true
		await get_tree().create_timer(2.0).timeout
		watering_particles.emitting = false

func on_crop_maturity() -> void:
	flowering_particles.emitting = true


func on_crop_harvesting() -> void:
	var corn_harvest_instance = tomato_harvest_scene.instantiate() as Node2D
	corn_harvest_instance.global_position = global_position
	get_parent().add_child(corn_harvest_instance)
	queue_free()
