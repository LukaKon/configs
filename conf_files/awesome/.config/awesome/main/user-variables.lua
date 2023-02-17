local home = os.getenv("HOME")

-- local _M = {
--
-- 	terminal = "kitty",
-- 	editor = os.getenv("EDITOR") or "hx",
-- 	editor_cmd = terminal .. " -e " .. editor,
--
-- 	-- Default modkey.
-- 	-- Usually, Mod4 is the key with a logo between Control and Alt.
-- 	-- If you do not like this or do not have such a key,
-- 	-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- 	-- However, you can use another modifier like Mod1, but it may interact with others.
-- 	modkey = "Mod4",
-- }

local _M = {}

function _M.get()
	local variable_name = {
		terminal = "kitty",
		editor = os.getenv("EDITOR") or "hx",
		editor_cmd = terminal .. " -e " .. editor,

		-- Default modkey.
		-- Usually, Mod4 is the key with a logo between Control and Alt.
		-- If you do not like this or do not have such a key,
		-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
		-- However, you can use another modifier like Mod1, but it may interact with others.
		modkey = "Mod4",
	}
	return variable_name
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
