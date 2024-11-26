shader_type spatial;
render_mode unshaded;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;
uniform sampler2D depth_texture : source_color, hint_depth_texture, filter_nearest;
uniform sampler2D normal_texture : source_color, hint_normal_roughness_texture, filter_nearest;
uniform vec2 blur_center = vec2( 0.5, 0.5 );
uniform float blur_power : hint_range( 0.0, 1.0 ) = 0;
uniform int sampling_count : hint_range( 1, 64 ) = 6;

void fragment( )
{
	vec2 direction = SCREEN_UV - blur_center;
	vec3 c = vec3( 0.0, 0.0, 0.0 );
	float f = 1.0 / float( sampling_count );
	for( int i=0; i < sampling_count; i++ ) {
		c += texture( screen_texture, SCREEN_UV - blur_power * direction * float(i) ).rgb * f;
	}
	ALBEDO = c;
}