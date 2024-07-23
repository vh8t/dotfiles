return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofmt" },
				c = { "clang-format" },
				rust = { "rustfmt" },
			},
		})

		vim.keymap.set("n", "<leader>gf", require("conform").format, { noremap = true, silent = true })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
