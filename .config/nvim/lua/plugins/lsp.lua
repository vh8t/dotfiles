return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		local servers = {
			"lua_ls",
			"gopls",
			"clangd",
			"rust_analyzer",
			"hls",
			"jdtls",
			"ts_ls",
			"pyright",
			"julials",
		}

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.cssls.setup({
			cmd = { "css-languageserver", "--stdio" },
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			cmd = { "html-languageserver", "--stdio" },
			capabilities = capabilities,
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
	end,
}
