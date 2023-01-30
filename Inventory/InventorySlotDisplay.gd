extends CenterContainer

var inventory = preload("res://Inventory/Inventory.tres")

onready var itemTextureRect = $ItemTextureRect


func displayItem(item):
	if item is ITEM:
		itemTextureRect.texture = item.ITEM_TEXTURE
	else:
		itemTextureRect.texture = load("res://art/box-highres.png")


func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is ITEM:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		dragPreview.texture = item.ITEM_TEXTURE
		set_drag_preview(dragPreview)
		return data
		
func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
	
func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	inventory.swap_items(my_item_index, data.item_index)
	inventory.set_item(my_item_index, data.item)
