extends PanelContainer

@export var imageTexture: Texture
@export var collectable_name: String
@onready var texture_rect: TextureRect = $TextureRect
@onready var count_label: Label = $CountLabel

func _ready() -> void:
	texture_rect.texture = imageTexture
	count_label.text = "0"
	
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	
func on_inventory_changed() -> void:
	count_label.text = InventoryManager.get_amount(collectable_name)
