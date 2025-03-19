shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform int filter_type : hint_range(0, 4) = 0;
uniform float severity : hint_range(0.0, 1.0) = 1.0; 
uniform float brightness : hint_range(0.0, 1.0) = 0.0;
uniform float gamma : hint_range(0.0, 1.0) = 1.0;
uniform float hue_shift : hint_range(0, 1.0) = 0.0;

// Función para convertir RGB a HSV
vec3 rgb_to_hsv(vec3 c) {
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv_to_rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
    vec4 screen_tex = texture(screen_texture, SCREEN_UV);
    vec3 original = screen_tex.rgb;
    vec3 filtered = original;
    
    if (filter_type == 1) { // Protanopia
        mat3 m;
        m[0] = vec3(0.56667, 0.43333, 0.0);
        m[1] = vec3(0.55833, 0.44167, 0.0);
        m[2] = vec3(0.0,     0.24167, 0.75833);
        filtered = m * original;
    } else if (filter_type == 2) { // Deuteranopia
        mat3 m;
        m[0] = vec3(0.625, 0.375, 0.0);
        m[1] = vec3(0.700, 0.300, 0.0);
        m[2] = vec3(0.0,   0.300, 0.700);
        filtered = m * original;
    } else if (filter_type == 3) { // Tritanopia
        mat3 m;
        m[0] = vec3(0.950, 0.050, 0.0);
        m[1] = vec3(0.0,   0.433, 0.0);
        m[2] = vec3(0.0,   0.567, 0.525);
        filtered = m * original;
    } else if (filter_type == 4) { // Acromatopsia (Grayscale)
        float gray = dot(original, vec3(0.299, 0.587, 0.114));
        filtered = vec3(gray);
    }
    
    filtered = mix(original, filtered, severity);
    
    filtered = filtered + brightness; 
    filtered = pow(filtered, vec3(1.0 / gamma)); 
    
    vec3 hsv = rgb_to_hsv(filtered);
    hsv.x = fract(hsv.x + hue_shift); 
    filtered = hsv_to_rgb(hsv);
    
    COLOR = vec4(filtered, screen_tex.a);
}