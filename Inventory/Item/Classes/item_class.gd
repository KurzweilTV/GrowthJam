tool
extends Resource

class_name ITEM

signal item_depleted(itemResource)

export(String) var ITEM_NAME
export(Texture) var ITEM_TEXTURE
export(int) var QUANTITY
export(String, MULTILINE) var HOVER_TEXT 

func addQuantity(addedQuant : int):
		QUANTITY += addedQuant

func decrementQuantity():
	QUANTITY -= 1
	if QUANTITY == 0:
		emit_signal('item_depleted', self)
		
func getTexture() -> Texture:
	return ITEM_TEXTURE
	
func getQuantity() -> int:
	return QUANTITY
