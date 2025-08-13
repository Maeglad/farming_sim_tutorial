extends Node

var _inventory: Dictionary = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	_inventory.get_or_add(collectable_name, 0)
	_inventory[collectable_name] += 1
	
	inventory_changed.emit()

func get_amount(collectable_name: String) -> String:
	return str(_inventory.get_or_add(collectable_name, 0))
