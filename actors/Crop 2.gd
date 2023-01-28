extends StaticBody2D

var crop_states = ["Weeds", "Dirt", "Tilled", "Watered", "Growing", "Finished"]
var current_state = crop_states[0]

func _process(delta):
	set_crop_texture(current_state)
		
	
func set_crop_texture(state):
	var texture_path = "res://art/crop_states/%s.png" % state
	$Sprite.texture = load(texture_path)
	$debuglabel.text = str(current_state)

func _interact():
	advance_crop_state()

func advance_crop_state():
	var current_state_index = crop_states.find(current_state)
	if current_state_index < len(crop_states) - 1:
		current_state = crop_states[current_state_index + 1]
		if current_state_index == 3:
			$GrowTimer.start()

func _on_GrowTimer_timeout():
	var current_state_index = crop_states.find(current_state)
	current_state = crop_states[current_state_index + 1]

