extends Panel

@onready var texto_postal = $TextoPostal

func _can_drop_data(at_position, data):
	return data is Color

func _drop_data(at_position, data):
	texto_postal.modulate = data
