-- Ambient Lighting
customFragment = [[
    uniform vec4 ambience;
    vec4 color(vec4 graphicsColor, sampler2D image, vec2 uv) 
    {
        //object color
        vec4 baseColor = graphicsColor * texture(image, uv);
        return baseColor * ambience;
    }
]]
shader:send('ambience', { 0.2, 0.2, 0.2, 1.0 })