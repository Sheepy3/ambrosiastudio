shader_type canvas_item;

uniform float rot_angle = 0.0;
const vec2 pivot = vec2(0.5, 0.5);
uniform float circle_radius = 0.2; // Radius of the circle
uniform float drag = 0.0;
uniform float outline_thickness = 0.01;
void fragment() {
    // Center the UV coordinates
    vec2 uv = UV - pivot;

    // Rotate the UV coordinates
    float sina = sin(rot_angle);
    float cosa = cos(rot_angle);
    mat2 rotation = mat2(
        vec2(cosa, -sina),
        vec2(sina, cosa)
    );
    uv = rotation * uv;

    vec2 ellipse_axes = vec2(drag + (circle_radius*2.0), circle_radius * 2.0); // Semi-major and semi-minor axes

    float alpha = 0.0;
    vec4 color = vec4(0.0, 0.0, 1.0, 0.0); // Default to blue with no alpha

      if (uv.x < 0.0) {
        // Left side: ellipse
        vec2 ellipse_uv = uv / ellipse_axes;
        float ellipse_distance = length(ellipse_uv);

        float adjusted_thickness = outline_thickness / max(ellipse_axes.x, ellipse_axes.y);

        if (abs(ellipse_distance - 0.5) < adjusted_thickness) {
            color = vec4(0.953, 0.533, 1, 0.82); // Red outline
        } else if (ellipse_distance < 0.5) {
            color = vec4(0.918, 0.184, 1, 0.361); // Blue fill
        } else {
            discard; // Outside the shape
        }
    } else {
        // Right side: circle
        float circle_distance = length(uv);

        if (abs(circle_distance - circle_radius) < outline_thickness) {
            color = vec4(0.953, 0.533, 1, 0.82); // Red outline
        } else if (circle_distance < circle_radius) {
            color = vec4(0.918, 0.184, 1, 0.361); // Blue fill
        } else {
            discard; // Outside the shape
        }
    }

    // Set the color
    COLOR = color;
}
