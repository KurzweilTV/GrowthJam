extends StaticBody2D

func _interact():
	print("Interacted")
	$debug_label.show()
	$InteractTimer.start()
	yield($InteractTimer, "timeout")
	$debug_label.hide()
