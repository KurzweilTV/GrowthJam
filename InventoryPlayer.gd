extends NinePatchRect

export( NodePath ) onready var inventory = get_node( inventory ) as Inventory



func _ready():
	rect_size.y = 30 + inventory.rect_size.y


func _on_Close_pressed():
	hide()

#func _open_inventory():
#	if Input.is_action_pressed("OpenInventory"):
#		SignalManager.emit_signal("inventory_opened", inventory)
#		show()
#this isn't working :(
