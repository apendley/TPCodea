-- {{texture.trimmedName}}
-- created with TexturePacker (http://www.texturepacker.com)
tp = tp or {}

tp.{{texture.trimmedName}} = {
	smartUpdateKey="{{smartUpdateKey}}",
	texture={name="{{texture.trimmedName }}", size={w={{texture.size.width}},h={{texture.size.height}}}},
	frames={{% for sprite in allSprites %}
		{{sprite.trimmedName}}={
			trimmed={{sprite.trimmed}}, rotated={{sprite.rotated}}, sourceSize={w={{sprite.untrimmedSize.width}},h={{sprite.untrimmedSize.height}}}, frameSize={w={{sprite.frameRect.width}},h={{sprite.frameRect.height}}},
			uvRect={s={{sprite.frameRect.x}}/{{texture.size.width}},t=1-(({{sprite.frameRect.y}}+{{sprite.frameRect.height}})/{{texture.size.height}}),tw={{sprite.frameRect.width}}/{{texture.size.width}},th={{sprite.frameRect.height}}/{{texture.size.height}}} },{% endfor %} }
}