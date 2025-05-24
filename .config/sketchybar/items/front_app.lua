local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	position = "center",
	icon = {
		font = "sketchybar-app-font:Regular:16.0",
	},
	label = {
		font = {
			style = settings.font.style_map["Bold"],
			size = 14.0,
		},
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	local icon_line = ""
	local lookup = app_icons[env.INFO]
	local icon = ((lookup == nil) and app_icons["default"] or lookup)
	icon_line = env.INFO

	sbar.animate("tanh", 10, function()
		front_app:set({ label = icon_line })
		front_app:set({ icon = { string = icon } })
	end)
end)

front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
