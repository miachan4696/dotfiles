return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        enabled = false,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    notify = true,
                    mini = true,
                    -- add integrations for plugins you use
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa", 
        priority = 1000,
        enabled = true, 
        config = function()
            require("kanagawa").setup({
                transparent = true,
                theme = "wave", -- "wave" / "dragon" / "lotus"
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    notify = true,
                    -- 使っているプラグインに応じて追加
                },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
        lazy = false,
    },
}
