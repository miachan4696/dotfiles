-- Bootstrap lazy.nvim and load the plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -i --lf",
        ["*"] = "win32yank.exe -i --lf",
    },
    cache_enabled = true,
}

require("config.lazy")
require("config.option")
require("config.keymaps")
