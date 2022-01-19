#version 330

in vec3 vertex_normal;

out vec4 FragColor;

uniform vec4 draw_color;

uniform vec3 dirlight_dir;
uniform vec4 dirlight_color;
uniform float dirlight_ambient;

void main() {
    float brightness = 1.0-0.5*dot(normalize(vertex_normal),normalize(dirlight_dir));
    float a = dirlight_color.a*brightness;

    float light_portion = 1.0-dirlight_ambient;
    float r = 0.5+0.5*sin(a*30)*a;
    float g = 0.5+0.5*sin(a*20)*a;
    float b = 0.5+0.5*sin(a*10)*a;

    FragColor = vec4(r,g,b,draw_color.a);
}
