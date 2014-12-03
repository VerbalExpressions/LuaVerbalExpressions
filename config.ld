project = 'vex'
file = 'vex.lua'
format = 'markdown'
not_luadoc = true
output = 'readme'
backtick_references = true

local upat = "http://rrthomas.github.io/lrexlib/manual.html#%s"
custom_see_handler('^rex%.(%w+)$',function(name)
	local url = upat:format(name)
	local name = "rex." .. name
	return name, url
end)
