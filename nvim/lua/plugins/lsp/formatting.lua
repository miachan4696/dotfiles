return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,
                mode = { "n", "x" },
                desc = "Format buffer or selection",
            },
        },
        opts = {
formatters_by_ft = {
    -- Web系
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    vue = { "prettier" },
    svelte = { "prettier" },

    -- スクリプト系
    python = { "ruff_format" },
    lua = { "stylua" },
    sh = { "shfmt" },

    -- コンパイル系
    go = { "gofmt" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- その他
    toml = { "taplo" },
    nix = { "nixfmt" },
    sql = { "sqlfluff" },

    -- どの言語にも最低限これをやる
    ["_"] = { "trim_whitespace" },
},            --[[
            Format on save settings
            format_after_save = {
                timeout_ms = 2000,
                lsp_format = "fallback",
            },

            ]]
        },
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("tsx-safe-equal", { clear = true }),
                pattern = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
                callback = function(event)
                    -- In Visual mode, `=` means formatting rather than indentexpr.
                    -- Thus `ggVG=` cannot destroy JSX/TSX indentation.
                    vim.keymap.set("x", "=", function()
                        local start_pos = vim.api.nvim_buf_get_mark(event.buf, "<")
                        local end_pos = vim.api.nvim_buf_get_mark(event.buf, ">")

                        conform.format({
                            bufnr = event.buf,
                            async = true,
                            lsp_format = "fallback",
                            range = {
                                start = { start_pos[1] - 1, start_pos[2] },
                                ["end"] = { end_pos[1] - 1, end_pos[2] + 1 },
                            },
                        })
                    end, {
                        buffer = event.buf,
                        silent = true,
                        desc = "Format selection with Conform",
                    })
                end,
            })
        end,
    },
}
