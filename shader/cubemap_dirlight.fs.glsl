#version 330

in vec3 vertex_normal;

out vec4 FragColor;

uniform vec3 dirlight_dir;
uniform vec4 dirlight_color;
uniform float dirlight_ambient;

uniform samplerCube cubemap;

void main() {
    vec4 draw_color = texture(cubemap, vertex_normal);

    float brightness = 1.0-0.5*dot(normalize(vertex_normal),normalize(dirlight_dir));
    float a = dirlight_color.a*brightness*brightness;

    float light_portion = 1.0-dirlight_ambient;
    float r = draw_color.r * dirlight_ambient + light_portion*draw_color.r*dirlight_color.r*a;
    float g = draw_color.g * dirlight_ambient + light_portion*draw_color.g*dirlight_color.g*a;
    float b = draw_color.b * dirlight_ambient + light_portion*draw_color.b*dirlight_color.b*a;

    FragColor = vec4(r,g,b,draw_color.a);
}
