#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

const float amplitude = 0.5; // Amplitud de la oscilación
const float frequency = 4.0; // Frecuencia de la oscilación
const float PI = 3.14159;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time; // Tiempo para animaciones
uniform bool enableOscillation; // Controla si la oscilación está activa

void main()
{
    // Calcula la distancia desde el origen para la oscilación
    float distance = length(aPos);

    // Aplica la oscilación solo si 'enableOscillation' está activado
    float effect = enableOscillation ? amplitude * sin(-PI * distance * frequency + time) : 0.0;

    // Ajusta la posición vertical según el efecto de oscilación
    vec3 animatedPos = vec3(aPos.x, aPos.y + effect, aPos.z);

    // Calcula la posición final del vértice
    gl_Position = projection * view * model * vec4(animatedPos, 1.0);

    // Transfiere las coordenadas de textura al fragment shader
    TexCoords = aTexCoords;
}
