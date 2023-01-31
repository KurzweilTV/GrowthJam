extends StaticBody2D

export(String) var tool_name

func _ready():
	$item_label.text = tool_name

func _interact():
	if tool_name: TempInventory.playerinv[tool_name] = true
	else:
		print("Nothing to pickup")
		return
	print(TempInventory.playerinv)
	$debug_label.show()
	$InteractTimer.start()
	yield($InteractTimer, "timeout")
	$debug_label.hide()
	queue_free()
