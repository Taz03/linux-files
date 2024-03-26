return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require "lualine".setup {
            options = {
                theme = "everforest",
                section_separators = "",
                component_separators = "|"
            },
            sections = {
                lualine_a = { "filename" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "buffers" },
                lualine_x = {
                    {
                        function()
                            return "L:" .. vim.fn.line("$")
                        end
                    }
                },
                lualine_y = { "location" },
                lualine_z = { "mode" },
            }
        }
    end
}
