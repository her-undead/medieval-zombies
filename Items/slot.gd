extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
#@export var item_code = -1;

func update(item: Item):
	if !item:
		item_visual.visible = false
		#item_code = -1
	else:
		item_visual.visible = true
		item_visual.texture = item.texture
		#item_code = item.code
		
