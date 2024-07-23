local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 9.5

config.enable_tab_bar = false

config.window_decorations = "NONE"
config.window_padding = {
	left = "20px",
	right = "20px",
	top = "20px",
	bottom = "20px",
}

config.colors = {
	foreground = "#d4be98",
	background = "#32302f",

	cursor_bg = "#d4be98",
	cursor_fg = "#32302f",
	cursor_border = "#d4be98",

	selection_fg = "black",
	selection_bg = "#fffacd",

	scrollbar_thumb = "#222222",

	split = "#444444",

	ansi = {
		"#1d2021",
		"#ea6962",
		"#a9b665",
		"#d8a657",
		"#7daea3",
		"#d3869b",
		"#89b428",
		"#d4be98",
	},
	brights = {
		"#17191a",
		"#ea6962",
		"#a9b665",
		"#d8a657",
		"#7daea3",
		"#d3869b",
		"#89b482",
		"#d4be98",
	},
}

return config
