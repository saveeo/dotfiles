-- double dash is comment

--vim.opt.nocompatiable = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

-- set encoding

-- change default search to be staroid

vim.opt.inccommand = "split" -- show search preview window in split
vim.opt.ignorecase = true
vim.opt.smartcase = true -- case insensitive search

vim.opt.termguicolors = true

-- set encoding
vim.opt.encoding = "utf-8"

vim.opt.showmode = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- nvim-completion options
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- keybindings
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	return vim.snippet.active({ direction = 1 }) and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	return vim.snippet.active({ direction = -1 }) and vim.snippet.jump(-1)
end, { silent = true })

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end, { silent = true, expr = true })

-- oil nvim keymap
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- enable tree-sitter yaml parser for ansible files
vim.treesitter.language.register("yaml", "yaml")

-- nvim-tree keymaps
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
