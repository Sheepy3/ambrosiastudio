extends Resource
class_name ProcSVG

@export var color:String
@export var height:float
@export var width:float
@export var opacity:float
@export var properties:Dictionary
@export var type:String

func buildproperties() -> void:
	var bodyproperties:Array
	for property in properties:
		"""%f=%f"""
	pass

func buildimage() -> ImageTexture:
	var svg_header:String ="""<svg width="%f" height="%f" opacity="%f">""".format(width, height, opacity) 
	
	var svg_body:String = """%f """
	
	
	var svg_data:String
	
	
	
	var image = Image.new()
		# Load the SVG data into the Image
	var error = image.load_svg_from_string(svg_data)
	if error != OK:
		push_error("Failed to load SVG from string.")
		return
	# Create an ImageTexture from the Image
	var texture = ImageTexture.create_from_image(image)
	# Assign the texture to the Sprite2D
	return texture
