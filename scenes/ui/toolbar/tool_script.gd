class_name ToolScript
extends Button

@export var _tool: DataTypes.Tools = DataTypes.Tools.AxeWood
@export var _start_disabled: bool = true

func _ready() -> void:
	ToolManager.enable_tool_signal.connect(on_enable_tool)
	if _start_disabled:
		disabled = true
		focus_mode = Control.FOCUS_NONE
		
	button_down.connect(_on_button_down)
	
func on_enable_tool(tool: DataTypes.Tools) -> void:
	if tool == _tool:
		disabled = false
		focus_mode = Control.FOCUS_CLICK

func _on_button_down() -> void:
	ToolManager.select_tool(_tool)
