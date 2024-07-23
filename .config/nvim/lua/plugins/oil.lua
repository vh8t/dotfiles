return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"size",
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			contain_cursor = "name",
		})

		vim.api.nvim_create_user_command("OilToggle", function()
			local current_buf = vim.api.nvim_get_current_buf()
			local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

			if current_filetype == "oil" then
				require("oil").close()
			else
				vim.cmd("Oil")
			end
		end, { nargs = 0 })

		vim.keymap.set("n", "<C-n>", ":OilToggle<CR>", { noremap = true, silent = true })
	end,
}
