vim.g.mapleader = " "
vim.o.updatetime = 10

-- Gruvbox material setup, for some reason it doesn't work in grubox config block
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_ui_contrast = "high"

-- Disable mouse
vim.o.mouse = ""

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Disable error sounds
vim.o.noerrorbells = true
vim.o.novisualbell = true

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

-- Current line highlight
vim.o.cursorline = true
