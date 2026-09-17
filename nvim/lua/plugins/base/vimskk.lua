return {
    {
        "vim-skk/skkeleton",
        dependencies = { "vim-denops/denops.vim" },
        event = "InsertEnter",
        config = function()
            vim.fn["skkeleton#config"]({
                globalDictionaries = { "~/.skk/SKK-JISYO" },
                eggLikeNewline = true,
            })
            vim.keymap.set({ "i", "c" }, "<C-]>", "<Plug>(skkeleton-toggle)", {
                silent = true,
                desc = "Toggle SKK input",
            })
        end,
    },
    {
        "delphinus/skkeleton_indicator.nvim",
        dependencies = { "vim-skk/skkeleton" },
        event = "InsertEnter",
        config = true,
    },
}
