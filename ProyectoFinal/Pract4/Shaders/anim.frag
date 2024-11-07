#version 330 core
out vec4 FragColor;
in vec2 TexCoords;
uniform sampler2D texture1;
uniform float alpha; // Nuevo parámetro para controlar la transparencia

void main()
{
    // Obtiene el color de la textura
    vec4 texColor = texture(texture1, TexCoords);

    // Descarta fragmentos con baja opacidad, útil para efectos como humo
    if(texColor.a < 0.1)
        discard;

    // Ajusta el canal alfa de la textura usando la variable 'alpha'
    FragColor = vec4(texColor.rgb, texColor.a * alpha);
}
