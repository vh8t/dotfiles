return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	keys = {
		{
			"<leader>cc",
			function()
				require("nvim-silicon").clip()
			end,
			mode = "x",
			desc = "Save selected snapshot into clipboard",
		},
		{
			"<leader>cs",
			function()
				require("nvim-silicon").file()
			end,
			mode = "x",
			desc = "Save selected snapshot as file",
		},
	},
	opts = {
		font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
		line_offset = function(args)
			return args.line1
		end,
		theme = "gruvbox-dark",
		gobble = true,
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
	},
}
