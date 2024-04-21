return {
    {
        "vhyrro/luarocks.nvim",
        lazy = false,
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        lazy = false,
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup()
        end,
    }
}
