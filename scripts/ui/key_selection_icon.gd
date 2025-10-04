extends MarginContainer

@onready var highlightable_icon: TextureRect = %highlightable_icon

func highlight():
	highlightable_icon.highlight()

func unhighlight():
	highlightable_icon.unhighlight()
