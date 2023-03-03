local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('neoclide/coc.nvim', { branch = 'master', ['do'] = 'yarn install --frozen-lockfile' })
Plug('nvim-treesitter/nvim-treesitter')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('ryanoasis/vim-devicons')
Plug('joshdick/onedark.vim')
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })
vim.call('plug#end')

vim.g.mapleader = ' '
vim.g['airline#extensions#tabline#enabled'] = 1

vim.g.coc_global_extensions = {
    'coc-java',
    'coc-groovy',
    'coc-clangd',
    'coc-go',
    'coc-golines',
    'coc-snippets',
    'coc-json',
    'coc-yaml',
    'coc-xml'
}

vim.opt.termguicolors = true
vim.opt.updatetime = 0
vim.opt.mouse = nil
vim.opt.clipboard = 'unnamedplus'
vim.cmd("colorscheme onedark")

-- transparent background
vim.cmd [[
    hi Normal guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi NonText guibg=none ctermbg=none
    hi SpecialKey guibg=none ctermbg=none
    hi VertSplit guibg=none ctermbg=none
    hi SignColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
]]

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.backup = false
vim.opt.writebackup = false

-- When searching try to be smart about cases
vim.opt.smartcase = true

-- Don't redraw while executing macros (good performance config)
vim.opt.lazyredraw = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- 1 tab == 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Smart indent
vim.opt.si = true

vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>d', vim.cmd.bd)
vim.keymap.set('n', '<leader>p', vim.cmd.bp)
vim.keymap.set('n', '<leader>n', vim.cmd.bn)

vim.keymap.set('n', '<leader>x', vim.cmd.Ex)

-- Move group of text in visual mode
vim.keymap.set('v', 'J', ':m ">+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m "<-2<CR>gv=gv')

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
    command = 'normal! g\'"'
})

-- Keymp for fuzzy finder
vim.keymap.set('n', '<leader>ff', ':Files<CR>')
vim.keymap.set('n', '<leader>gf', ':GFiles<CR>')

function _G.check_backspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
local opts = {
    silent = true,
    expr = true,
    replace_keycodes = false
}
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_backspace() ? "<TAB>" : coc#refresh()', opts);
vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})

vim.keymap.set('n', 'K', function ()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.opt.keywordprg .. ' ' .. cw)
    end
end, {silent = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
    group = 'CocGroup',
    command = 'silent call CocActionAsync(\'highlight\')',
    desc = 'Highlight symbol under cursor on CursorHold'
})

vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {silent = true})

-- Formatting selected code
vim.keymap.set('x', '<leader>=', '<Plug>(coc-format-selected)', {silent = true})
vim.keymap.set('n', '<leader>=', '<Plug>(coc-format-selected)', {silent = true})

local opts = {
    silent = true,
    nowait = true
}
vim.keymap.set('x', '<leader>as', '<Plug>(coc-codeaction-selected)', opts)
vim.keymap.set('n', '<leader>as', '<Plug>(coc-codeaction-selected)', opts)

vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)

-- Run the Code Lens actions on the current line
vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)', opts)

-- Remap <C-f> and <C-b> to scroll float windows/popups
local opts = {
    silent = true,
    nowait = true,
    expr = true
}
vim.keymap.set('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
vim.keymap.set('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
vim.keymap.set('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
vim.keymap.set('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command('Format', 'call CocAction("format")', {})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command('OR', 'call CocActionAsync("runCommand", "editor.action.organizeImport")', {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

-- Gradle file syntax highlights as groovy
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*.gradle',
    command = 'setf groovy'
})

require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        'c',
        'java',
        'json',
        'go',
        'yaml',
        'lua',
        'gitignore'
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true
    }
}
