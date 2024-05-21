return {
    {
        "williamboman/mason.nvim",
        config = function()
            require "mason".setup {}
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_zero = require "lsp-zero"
            local lsp_config = require "lspconfig"

            require "mason-lspconfig".setup {
                ensure_installed = { "lua_ls", "jdtls" },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        lsp_config.lua_ls.setup { lua_opts }
                    end,
                }
            }
        end
    },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local lsp_zero = require("lsp-zero")

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            -- this is the function that loads the extra snippets to luasnip
            -- from rafamadriz/friendly-snippets
            require "luasnip.loaders.from_vscode".lazy_load()

            cmp.setup {
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer",  keyword_length = 3 },
                },
                formatting = lsp_zero.cmp_format({ details = false }),
                mapping = cmp.mapping.preset.insert {
                    ["<Enter>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                },
            }
        end
    },
    { "L3MON4D3/LuaSnip" },
    {
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            local lsp_zero = require "lsp-zero"
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>er", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>as", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
        end
    },
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require "autoclose".setup {}
        end
    }
}
