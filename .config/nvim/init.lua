-- Setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.o.updatetime = 50
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable mouse
vim.o.mouse = ""

-- Use system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Disable error sounds
vim.cmd("set noerrorbells novisualbell")

-- Relative line numbering
vim.o.nu = true
vim.o.rnu = true

-- Incremntal searching
vim.o.incsearch = true
vim.o.smartcase = true

-- For regex turn magic on
vim.o.magic = true

-- Set the default indent to 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- No line wrapping
vim.o.wrap = false

-- Map buffer actions
map("n", "<leader>d", ":bd<cr>", opts)
map("n", "<leader>p", ":bp<cr>", opts)
map("n", "<leader>n", ":bn<cr>", opts)

-- Map netrw
map("n", "<Leader>x", ":Ex<cr>", opts)

-- Disable scary q: history
map("n", "q:", "<nop>", opts);

-- Move blocks when selected
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- Cursor stay in one place when using J in normal mode
map("n", "J", "mzJ`z", opts)

-- Plugins
require("lazy").setup({
    { "nvim-tree/nvim-web-devicons" },
    { "sainnhe/gruvbox-material" },
    { "nvim-lualine/lualine.nvim" },
    { "machakann/vim-highlightedyank" },
    { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
})

-- Gruvbox theme config
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_ui_contrast = "high"
vim.cmd("colorscheme gruvbox-material")

require("lualine").setup {
    options = {
        theme = "gruvbox",
        section_separators = '|',
        component_separators = '|'
    },
    sections = {
        lualine_a = { "filename" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "buffers" },
        lualine_x = {
            {
                function()
                    return "L:" .. vim.fn.line('$')
                end
            }
        },
        lualine_y = { "location" },
        lualine_z = { "mode" },
    },
}

-- Highlighted yank
vim.g.highlightedyank_highlight_duration = 250

-- Telescope(Fuzzy finder) config
local telescope_builtin = require("telescope.builtin")
map("n", "<leader>ff", telescope_builtin.find_files, opts)
map("n", "<leader>gf", telescope_builtin.git_files, opts)
map("n", "<leader>fg", telescope_builtin.live_grep, opts)

require("lazy").setup({
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "java",
        "vimdoc",
        "javascript",
        "html"
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})

local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
lsp_zero.setup()
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
    },
})
