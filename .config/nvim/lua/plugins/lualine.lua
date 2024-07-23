return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function get_mode()
			local mode = vim.fn.mode()
			local mode_map = {
				n = "normal",
				i = "insert",
				v = "visual",
				V = "visual line",
				["\22"] = "visual block",
				s = "select",
				S = "select line",
				["\19"] = "select block",
				c = "command",
				R = "replace",
				Rv = "virtual replace",
				["r"] = "replace char",
				rm = "more",
				["r?"] = "confirm",
				["!"] = "shell",
				t = "terminal",
				["\19"] = "normal ex",
			}
			return mode_map[mode] or "unknown"
		end

		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "gruvbox",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "terminal" },
					winbar = { "terminal" },
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { get_mode },
				lualine_b = {},
				lualine_c = { "filename", "diagnostics" },
				lualine_x = { "filetype", "location" },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename", "diagnostics" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
