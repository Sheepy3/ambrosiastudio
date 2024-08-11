extends Sprite2D

var shape_material:Material
var previous_mouse_position:= Vector2()
var mouse_velocity:= Vector2()
var current_velocity:= Vector2()
#var sample_interval: = 0.01  # Sample every 0.05 seconds
var time_since_last_sample: = 0.0
var current_drag: float = 0.0
#var iterator:float = 0.001 
func _ready() -> void:
	shape_material = material
	previous_mouse_position = get_global_mouse_position()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	position = get_global_mouse_position()
	
	#time_since_last_sample += delta
	#if time_since_last_sample >= sample_interval:
	var current_mouse_position:Vector2 = get_global_mouse_position()
	var new_velocity: = (current_mouse_position - previous_mouse_position) / delta
	mouse_velocity = lerp(mouse_velocity, new_velocity, 0.1)  
	previous_mouse_position = current_mouse_position
		#time_since_last_sample = 0
	
	var velocity_magnitude_clamped:float = clamp(remap(mouse_velocity.length(), 1, 2000, 0.0, 1.0),0.000,0.800)
	if Input.get_last_mouse_velocity():
		#print(velocity)
		current_drag = velocity_magnitude_clamped / 2.0
		shape_material.set_shader_parameter("drag",current_drag)
		if (mouse_velocity.length() != 0):
			shape_material.set_shader_parameter("rot_angle",(mouse_velocity.angle()))
		#print(mouse_velocity.length())
	else:
		current_drag = lerp(current_drag, 0.0, 0.05)  
		shape_material.set_shader_parameter("drag",current_drag)
		
	#queue_redraw()
	pass
