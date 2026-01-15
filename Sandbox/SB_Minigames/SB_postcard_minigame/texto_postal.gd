extends Label

# Necesitamos que el label sí reciba señales -> tenemos que cambiar el Control padre
func _ready():
	mouse_filter = Control.MOUSE_FILTER_STOP

func _can_drop_data(at_position, data):
	return data is Color

func _drop_data(at_position, data):
	modulate = data
	print("Nuevo color de texto")
