local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd("highlight TabLineSel guifg=#fabd2f guibg=#3c3836")
vim.cmd("highlight TabLine guifg=#b8bb26 guibg=#1d2021")

vim.o.tabline = "%!v:lua.custom_tabline()"

function _G.custom_tabline()
	local tabs = {}
	local current_tab = vim.fn.tabpagenr()

	for i = 1, vim.fn.tabpagenr("$") do
		local tabname = vim.fn.tabpagebuflist(i)[1]
		local name = vim.fn.fnamemodify(vim.fn.bufname(tabname), ":t")
		local hl = (i == current_tab) and "%#TabLineSel#" or "%#TabLine#"
		local tab_label = (i == current_tab) and string.format("%s%d: %s ", hl, i, name)
			or string.format("%s%d: %s ", hl, i, name)
		table.insert(tabs, tab_label)
	end

	return table.concat(tabs, " ")
end

function VsplitTerm()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.cmd("terminal")
	vim.cmd("vertical resize 80")
end

function SplitTerm()
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.cmd("terminal")
	vim.cmd("resize 18")
end

function Vsplit()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
end

function Split()
	vim.cmd("split")
	vim.cmd("wincmd j")
end

vim.api.nvim_set_option("clipboard", "unnamed")

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal nonumber norelativenumber",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.c3",
	command = "set filetype=c3",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.xyl",
	command = "set filetype=xylia",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.ebnf",
	command = "set filetype=ebnf",
})

vim.keymap.set("n", "<C-y>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-y>", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<A-v>", ":lua VsplitTerm()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":lua SplitTerm()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-i>", ":tabnew | terminal<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>V", ":lua Vsplit()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>H", ":lua Split()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>.", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>,", ":tabprevious<CR>", { noremap = true, silent = true })

vim.cmd.colorscheme("gruvbox-flat")
