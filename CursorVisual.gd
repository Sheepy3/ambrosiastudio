extends Sprite2D

var shape_material:Material = material
var previous_mouse_position:= Vector2()
var mouse_velocity:= Vector2()
var current_drag:float = 0.0
var current_radius:float
@export var target_radius: float = 0.2
func _ready() -> void:
	previous_mouse_position = get_global_mouse_position()

func _process(delta:float) -> void:
	var current_mouse_position:Vector2 = get_global_mouse_position()
	var new_velocity: = (current_mouse_position - previous_mouse_position) / delta
	mouse_velocity = lerp(mouse_velocity, new_velocity, 0.1)  
	previous_mouse_position = current_mouse_position
	var velocity_magnitude_clamped:float = clamp(remap(mouse_velocity.length(), 1, 2000, 0, 1),0,0.8)
	
	current_radius = lerpf(current_radius,target_radius,0.1)
	shape_material.set_shader_parameter("circle_radius",(current_radius))
	
	if Input.get_last_mouse_velocity():
		current_drag = velocity_magnitude_clamped / 2.0
		shape_material.set_shader_parameter("drag",current_drag)
		if (mouse_velocity.length() != 0):
			shape_material.set_shader_parameter("rot_angle",(mouse_velocity.angle()))
	else:
		current_drag = lerp(current_drag, 0.0, 0.05)  
		shape_material.set_shader_parameter("drag",current_drag)
