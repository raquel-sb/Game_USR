extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@export var speed := 300.0

var movement_actions = ["ui_up", "ui_right", "ui_down", "ui_left"]
var correct_mov_combinations = ["up", "down", "right", "left", "up_right", "up_left", "down_right", "down_left"]
var last_direction = "down"
var last_sprite = "idle"
var move_dir = Vector2.ZERO



func update_movement():
	var input := Vector2.ZERO
	
	if last_sprite == "run":
		if last_direction.contains("right"):
			input.x += 1
		if last_direction.contains("left"):
			input.x -= 1
		if last_direction.contains("down"):
			input.y += 1
		if last_direction.contains("up"):
			input.y -= 1

	# Normalizar si se está moviendo
	if input != Vector2.ZERO:
		input = input.normalized()

	# Convertir entrada cartesiana → dirección isométrica
	move_dir = cartesian_to_iso(input)
	
	# Actualizamos velocidad
	velocity = move_dir.normalized() * speed


func cartesian_to_iso(v: Vector2) -> Vector2:
	# Conversión estándar 2:1
	# Dependiendo del estilo de tu mapa puedes invertir X o Y.
	# Esta es la clásica:
	return Vector2(v.x - v.y, (v.x + v.y) * 0.5)

func update_position():
	move_and_slide() # Godot uses automatically velocity to update


# Update functions
func update_last_sprite(sprite_name):
	last_sprite = sprite_name
	
func update_last_direction(direction_name):
	last_direction = direction_name

func play_animated_sprite(): # Function to update the sprite animation
	var sprite_name = last_sprite + "_" + last_direction
	_animated_sprite.play(sprite_name)

func update_animation():
	# Play the animtaion of the sprite (saved in the global variables of this script)
	play_animated_sprite()


# Function to get all currently pressed actions
func get_pressed_actions() -> Array:
	var pressed_actions: Array = []
	
	# Iterate over all actions defined in the InputMap
	for action_name in movement_actions: # InputMap.get_actions():
		if Input.is_action_pressed(action_name):
			pressed_actions.append(action_name)
	return pressed_actions


# Function to identify if both arrays contain the same values
func compare_arrays(arr1, arr2) -> bool:
	if arr1.size() == arr2.size():
		for val1 in arr1:
			if val1 not in arr2:
				return false
		return true
	else:
		return false


# Function to create the array for ui movement inputs given string of directions
func split_mov_array(arr) -> Array:
	var aux_arr = arr.split("_")
	var prefix = "ui_"
	var output_arr = []
	
	for value in aux_arr:
		output_arr.append(prefix + value)
	
	return output_arr


# Function that looks for the correct direction and sprite
func update_direction_and_sprite():
	var mov_actions_pressed = get_pressed_actions()
	var mov_match = false
	var i = 0
	var str_mov : String
	var ui_arr_mov : Array
	
	# If there exists a keyboard input, check if there is character movement involved
	if mov_actions_pressed.size() > 0:

		while i < correct_mov_combinations.size() and not mov_match:
			# Generate the correct array of movements
			str_mov = correct_mov_combinations[i]
			ui_arr_mov = split_mov_array(str_mov)
			
			# Check if pressed actions are valid
			mov_match = compare_arrays(mov_actions_pressed, ui_arr_mov)
			
			# Iterate index
			i += 1
	
	# Update movement in case is a valid one
	if mov_match:
		# Update movement and direction
		update_last_sprite("run")
		update_last_direction(str_mov)
		# last_sprite = "run"
		# last_direction = str_mov

	else:
		update_last_sprite("idle")
		# last_sprite = "idle"






func _process(_delta):
	update_direction_and_sprite()
	update_animation()


func _physics_process(delta):
	update_movement()
	update_position()
	# handle_animation()
