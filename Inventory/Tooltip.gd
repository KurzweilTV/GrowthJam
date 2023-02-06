extends NinePatchRect

export(NodePath) onready var TooltipName = get_node(TooltipName) as Label
export(NodePath) onready var TooltipText = get_node(TooltipText) as Label


func display( slot : Inventory_Slot ):
	rect_global_position = slot.rect_size + slot.rect_global_position
	TooltipName.text = slot.item.item_name
	TooltipText.text = slot.item.item_description
	show()
