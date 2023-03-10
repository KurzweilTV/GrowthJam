extends NinePatchRect

export(NodePath) onready var InventoryContainer = get_node(InventoryContainer) as Control

var current_inventories : Array = []

func _ready():
	SignalManager.connect("inventory_opened", self, "_on_inventory_opened")

func close():
	for i in current_inventories:
		InventoryContainer.remove_child(i)
	current_inventories = []
	hide()


func _on_inventory_opened(inventory : Inventory):
	if current_inventories.size() == 0:
		rect_size.y = 20
	
	if current_inventories.has(inventory):
		return
	InventoryContainer.add_child(inventory)
	current_inventories.append(inventory)
	rect_size.y += inventory.rect_size.y + InventoryContainer.get_constant("separation")
	show()



func _on_Close_pressed():
	close()
