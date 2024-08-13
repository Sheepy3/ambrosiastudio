extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	position = get_global_mouse_position()
	pass

func _input(input:InputEvent) -> void:
	if input is InputEventMouseButton:
		if input.button_index == MOUSE_BUTTON_LEFT:
			if input.pressed:
				%Click.text = "pressed"
				%Sprite2D.target_radius = 0.05
			else:
				%Click.text = ""
				%Sprite2D.target_radius = 0.2
