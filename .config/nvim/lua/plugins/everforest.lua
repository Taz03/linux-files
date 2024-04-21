return {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 6969,
    config = function ()
        local everforest = require "everforest"

        everforest.setup {
            background = "hard",
            transparent_background_level = 1,
            italics = true,
            disable_italic_comments = false,
        }
        everforest.load()

        vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    end
}
