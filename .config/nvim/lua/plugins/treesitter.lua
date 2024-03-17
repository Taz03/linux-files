return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "nvim-treesitter.configs".setup {
                ensure_installed = {
                    "lua",
                    "vim",
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require "ibl".setup {}
        end
    }
}
