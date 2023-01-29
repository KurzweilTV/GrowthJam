extends CanvasLayer

export(String, FILE, "*.json") var d_file

var dialog = []
var current_dialog_id = 0
var d_active = false
var interactCount = 0

var textures = {}

var initial_dialog = []
var ingredients = []

var witch1 = load("res://art/witch/lul.png")
var witch2 = load("res://art/witch/knife.png")
var witch3 = load("res://art/witch/cash.png")
var witch4 = load("res://art/witch/muah.png")




# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect.visible = false
	textures["witch1"] = witch1
	textures["witch2"] = witch2
	textures["witch3"] = witch3
	textures["witch4"] = witch4

	
func start():
	if d_active:
		return
	d_active = true
	dialog = load_dialog()
	initial_dialog = dialog['initial_dialog']
	ingredients = dialog['ingredients']
	$NinePatchRect.visible = true
	if current_dialog_id == 0:
		$NinePatchRect/Name.text = initial_dialog[0]['name']
		$NinePatchRect/Text.text = initial_dialog[0]['text']
		$NinePatchRect/Sprite.texture = textures[initial_dialog[0]['emotion']]


func load_dialog():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, file.READ)
		return parse_json(file.get_as_text())
		
func _input(event):
	if not d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
		
func next_script():
	if interactCount < 1:
		if (current_dialog_id) >= len(initial_dialog)-1:
			$Timer.start()
			$NinePatchRect.visible = false
			interactCount += 1
		else:
			current_dialog_id += 1
			$NinePatchRect.visible = true
			$NinePatchRect/Name.text = initial_dialog[current_dialog_id]['name']
			$NinePatchRect/Text.text = initial_dialog[current_dialog_id]['text']
			$NinePatchRect/Sprite.texture = textures[initial_dialog[current_dialog_id]['emotion']]
			print(current_dialog_id)


	if interactCount >= 1:
		$NinePatchRect.visible = true
		current_dialog_id = 0
		var randoRequest = randi() % ingredients.size()
		$NinePatchRect/Name.text = ingredients[randoRequest]['name']
		$NinePatchRect/Text.text = ingredients[randoRequest]['text']
		$NinePatchRect/Sprite.texture = textures[ingredients[randoRequest]['emotion']]
		current_dialog_id += 1
		print(current_dialog_id)
		if current_dialog_id >= 1:
			$Timer.start()
			$NinePatchRect.visible = false
		
#	$NinePatchRect.visible = true

	
#	$NinePatchRect/Name.text = dialog[current_dialog_id]['name']
#	$NinePatchRect/Text.text = dialog[current_dialog_id]['text']
#	$NinePatchRect/Sprite.texture = textures[dialog[current_dialog_id]['emotion']]
	
	


func _on_Timer_timeout():
	d_active = false
