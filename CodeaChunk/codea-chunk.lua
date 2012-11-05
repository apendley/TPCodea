-- {{texture.trimmedName}}
-- created with TexturePacker (http://www.texturepacker.com)
--
-- download or read from project data as a string, and use loadstring().
-- e.g. if you've downloaded this file using http.request,
-- create the table like this:
--
-- {{texture.trimmedName}} = assert(loadString(data))()

return {
	smartUpdateKey="{{smartUpdateKey}}",
	texture={name="{{texture.trimmedName}}", size={w={{texture.size.width}},h={{texture.size.height}}}},
	frames={{% for sprite in allSprites %}
		["{{sprite.trimmedName}}"]={ trimmed={{sprite.trimmed}}, rotated={{sprite.rotated}},
			sourceSize={w={{sprite.untrimmedSize.width}},h={{sprite.untrimmedSize.height}}}, frameSize={w={{sprite.frameRect.width}},h={{sprite.frameRect.height}}},
			uvRect={s={{sprite.frameRect.x}}/{{texture.size.width}},t=1-(({{sprite.frameRect.y}}+{{sprite.frameRect.height}})/{{texture.size.height}}),tw={{sprite.frameRect.width}}/{{texture.size.width}},th={{sprite.frameRect.height}}/{{texture.size.height}}} },{% endfor %}
	}
}