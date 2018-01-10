precision highp float;
uniform sampler2D map;
uniform sampler2D gradMap;
varying vec3 vPosition;
varying vec2 vUv;
varying vec3 vNormal;
uniform bool isWire;
uniform float width;
uniform float height;
void main() {

    vec3 texColor = texture2D( map, vUv ).xyz;
    vec3 gradColor = texture2D( gradMap, vUv ).xyz;

    vec3 result = texColor;
    if(isWire)
    {
        result = gradColor;

        if(abs(vPosition.x) < width * 0.487)
        {
            if(abs(vPosition.y) < height * 0.473)
            {

                discard;
            }
        }
    }
    gl_FragColor =vec4(result , 1.);

}