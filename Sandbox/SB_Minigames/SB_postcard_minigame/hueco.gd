extends Panel

var center: Vector2

func _ready():
	center = get_center_position()
	print("PanelContainer center (global): ", center)

func get_center_position() -> Vector2:
	# Ensure the container has a valid size
	if size == Vector2.ZERO:
		return position  # Fallback: just return top-left position
	
	# Local center (relative to the container's own coordinates)
	var local_center = size / 2
	
	# Global center (relative to the world/screen)
	# var global_center = global_position + local_center
	
	return local_center/2

func _can_drop_data(_at_position, data):
	return data is Control

func _drop_data(_at_position, data):
	# Si el hueco no tiene pegatina
	if get_child_count() == 0:
		# Esto solo si queremos usar 1 sola vez cada pegatina
		# data.get_parent().remove_child(data)
		
		# Añadimos la pegatina directamente
		add_sticker(data)

	else:
		# Eliminamos todos los hijos (que debería ser solo 1 pegatina)
		for n in get_children():
			remove_child(n)
			n.queue_free()
		
		add_sticker(data)

func add_sticker(data):
	# Añadimos la pegatina como hijo
		add_child(data)
		
		# Seleccionamos la posición dentro del hueco
		# data.position = Vector2.ZERO  # Posición del margen izquierdo superior del hueco
		data.position = center # Vector2.ZERO
