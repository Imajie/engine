attribute vec3 vertex;
attribute vec3 normal;
attribute vec2 texture;

uniform mat4 modelview;
uniform mat4 projection;
uniform vec4 lightPosition;

varying vec3 L;
varying vec3 E;
varying vec3 H;
varying vec3 N;

varying vec2 texCoord;

void main()
{
    vec3 pos = (modelview * vec4(vertex, 1.0)).xyz;

    // for phong shading
    L = normalize(lightPosition.xyz - pos);
    E = normalize(-pos);
    H = normalize(L+E);

    N = normalize(modelview * vec4(normal, 0.0)).xyz;

    texCoord = texture;
    gl_Position = projection * modelview * vec4(vertex, 1.0);
}
