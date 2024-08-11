extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	pass
	
func _notification(what:int) -> void:
	match what:
		NOTIFICATION_WM_WINDOW_FOCUS_IN,NOTIFICATION_READY:
			# Set mouse mode when window gains focus
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			print("HI")
		NOTIFICATION_WM_WINDOW_FOCUS_OUT:
			# Set mouse mode when window loses focus
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
