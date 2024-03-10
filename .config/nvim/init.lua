-- Setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("opts")
require("keymaps")

-- Plugins
require("lazy").setup("plugins")

local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
lsp_zero.setup()
require("mason").setup {}
require("mason-lspconfig").setup {
    handlers = {
        lsp_zero.default_setup,
    },
}
