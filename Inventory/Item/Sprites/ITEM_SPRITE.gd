tool
extends TextureRect

export(Resource) var MyItem setget _setItem


onready var MyLabel = $RichTextLabel


func addQuantity(addedQuant : int):
	MyItem.addQuantity(addedQuant)
	
func _setItem(newItem : Resource):
	MyItem = newItem
	self.texture = MyItem.getTexture()
	$RichTextLabel.bbcode_text = str(newItem.getQuantity())
