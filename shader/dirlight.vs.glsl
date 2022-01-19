#version 330

layout (location = 0) in vec3 in_position;
layout (location = 2) in vec3 in_normal;

uniform mat4 mvp;

out vec3 vertex_normal;

void main() {
    gl_Position = mvp * vec4(in_position, 1.0);
    vertex_normal = in_normal;
}
