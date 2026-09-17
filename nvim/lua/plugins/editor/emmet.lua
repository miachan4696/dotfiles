return {
    {
        "mattn/emmet-vim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "html", "javascriptreact", "typescriptreact", "php", "ejs", "svelte", "astro" },
        init = function()
            vim.g.user_emmet_leader_key = "<C-y>"
            vim.g.user_emmet_settings = {
                variables = { lang = "ja" },
                html = { indentation = "  " },
            }
        end,
    },
}
