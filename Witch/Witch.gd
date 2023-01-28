extends StaticBody2D

#func check_interactable():
#	var cast_distance = 64
#	$RayCast2D.set_cast_to(facingDir * cast_distance)
#
#	if $RayCast2D.get_collider():
#		return $RayCast2D.get_collider()
#
func _interact():
#if Input.is_action_just_pressed("interact"): # interact with objects
#	var collidor = check_interactable()
	
#if collidor and collidor.has_method("_interact"):
#		collidor._interact()
	print("Interacted")
	use_dialog()
	$debug_label.show()
	$InteractTimer.start()
	yield($InteractTimer, "timeout")
	$debug_label.hide()

func use_dialog():
	var dialog = get_parent().get_node("Dialog")
	
	if dialog:
		dialog.start()
		
