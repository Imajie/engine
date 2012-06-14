// from vertex shader
varying vec3 L;
varying vec3 E;
varying vec3 H;
varying vec3 N;

varying vec2 texCoord;

uniform vec3 ambientProd, diffProd, specProd;
uniform float shininess;
//uniform sampler2D sampler;

void main()
{
    // ambient
    vec4 ambient = vec4(ambientProd, 1.0);

    // diffuse
    float Kd = max( dot(L,N), 0.0 );
    vec4 diffuse = Kd * vec4(diffProd, 1.0);

    // specular
    float Ks = pow( max( dot(N, H), 0.0 ), shininess );
    vec4 specular = Ks * vec4(specProd, 1.0);
    if( dot(L,N) < 0.0 )
    {
        specular = vec4(0.0, 0.0, 0.0, 1.0);
        diffuse  = vec4(0.0, 0.0, 0.0, 1.0);
    }


    // combine the effects
    vec4 color = ambient + diffuse + specular;
    color.a = 1.0;

    //gl_FragColor = color;//*texture2D(sampler, texCoord);

	gl_FragColor = vec4(ambientProd, 1.0);
}
