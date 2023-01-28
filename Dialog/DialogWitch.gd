extends CanvasLayer

export(String, FILE, "*.json") var d_file

var dialog = []
var current_dialog_id = 0
var d_active = false

var textures = {}

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
	$NinePatchRect.visible = true
	
	dialog = load_dialog()
	$NinePatchRect/Name.text = dialog[0]['name']
	$NinePatchRect/Text.text = dialog[0]['text']
	$NinePatchRect/Sprite.texture = textures[dialog[0]['emotion']]

#func getTexture(emote):
#	var emo = emote
#	var texture = Texture.new()
#	texture.load(emo)
#	$NinePatchRect/Sprite.texture = texture

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
	current_dialog_id += 1
	
	if current_dialog_id >= len(dialog):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialog[current_dialog_id]['name']
	$NinePatchRect/Text.text = dialog[current_dialog_id]['text']
	$NinePatchRect/Sprite.texture = textures[dialog[current_dialog_id]['emotion']]
	
	


func _on_Timer_timeout():
	d_active = false
