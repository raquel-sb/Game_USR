extends TextureRect

@export var sticker_id: int
@export var scale_value: Vector2 = Vector2(1.1, 1.1)
 
func _ready():
	mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Generamos los nodos señales (para todos los stickers que tengan este script)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	# Queremos que escale desde el centro así que:
	pivot_offset = size / 2

func _on_mouse_entered():
	scale = scale_value

func _on_mouse_exited():
	scale = Vector2.ONE

func _get_drag_data(_at_position):
	var preview = duplicate()
	preview.modulate.a = 0.7
	set_drag_preview(preview)
	print("HOLA PEGATINA ", sticker_id)
	
	# Si queremos borrar pegatina de la lista de pegatinas
	# return self 
	
	# Devolvemos una copia
	return duplicate() 
