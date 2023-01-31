extends StaticBody2D

var crop_states = ["Dirt", "Tilled", "Watered", "Growing", "Finished"]
var current_state = crop_states[0]
var watered = false

func _process(delta):
	set_crop_texture(current_state)
		
	
func set_crop_texture(state):
	var texture_path = "res://art/crop_states/%s.png" % state
	$Sprite.texture = load(texture_path)
	$debuglabel.text = str(current_state)

func _interact():
	if current_state == "Dirt" and TempInventory.playerinv.has("Plow"):
		advance_crop_state()
	if current_state == "Tilled" and TempInventory.playerinv.has("Bucket"):
		advance_crop_state()
		watered = true
	if current_state == "Watered" and TempInventory.playerinv.has("Seeds"):
		advance_crop_state()

		
func advance_crop_state():
	var current_state_index = crop_states.find(current_state)
	if current_state_index < len(crop_states) - 2:
		current_state = crop_states[current_state_index + 1]
		if crop_states[current_state_index + 1] == "Growing":
			$GrowTimer.start()

func _on_GrowTimer_timeout():
	var current_state_index = crop_states.find(current_state)
	current_state = crop_states[current_state_index + 1]

