return {
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,          -- <div> 入力時に </div> を補完
                    enable_rename = true,         -- 開始タグ修正時に閉じタグも同時修正
                    enable_close_on_slash = false -- / 入力時の自動閉じ
                }
            })
        end
    }
}