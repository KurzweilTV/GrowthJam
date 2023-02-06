class_name Inventory_Slot extends TextureRect

export( NodePath ) onready var Item_Container = get_node( Item_Container ) as Control

var item : ITEM

func _ready():
	if item:
		Item_Container.add_child( item )

func set_item( new_item ):
	item = new_item

func pick_item():
	item.pick_item()
	Item_Container.remove_child( item )
	item = null

func put_item( new_item ):
	item = new_item
	item.put_item()
	Item_Container.add_child( item )
