class_name ITEM extends TextureRect

export(String) var item_name
export(String) var item_description
export(String) var item_ID

func pick_item():
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func put_item():
	mouse_filter = Control.MOUSE_FILTER_PASS
