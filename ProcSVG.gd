extends Resource
class_name ProcSVG

@export var color:String
@export var height:float
@export var width:float
@export var opacity:float
@export var properties:Array[String]
@export var type:String

func buildproperties() -> String:
	var bodyproperties:String
	for property in properties:
		var formatted_property:String = """%property""".format({"property":property})
		bodyproperties+=" "
		bodyproperties+= formatted_property
	return bodyproperties

func buildimage() -> ImageTexture:
	var svg_header:String ="""
	<svg width="%width"
	height="%height" 
	opacity="%opacity">""".format({"width": width, "height":height, "opacity":opacity}) 
	
	var svg_body:String = buildproperties()
	
	var svg_footer:String = '</svg>'
	
	var svg_data:String = svg_header+svg_body+svg_footer
	
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
