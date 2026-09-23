return {
    {
        "mason-org/mason.nvim",
        config = true,
        build = ":MasonUpdate",
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            { "mason-org/mason.nvim" },
        },
        opts = {
            ensure_installed = { "ts_ls", "clangd" },
            -- Enable installed Mason LSPs for their supported filetypes.
            automatic_enable = true,
        },
        config = function(_, opts)
            vim.diagnostic.config({
                virtual_text = true,
            })

            vim.lsp.config("ts_ls", {
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
                root_markers = {
                    "tsconfig.json",
                    "jsconfig.json",
                    "package.json",
                    ".git",
                },
            })

            vim.lsp.config("clangd", {
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    "CMakeLists.txt",
                    ".clangd",
                    ".git",
                },
            })

            require("mason-lspconfig").setup(opts)

            local signature_method = "textDocument/signatureHelp"
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("safe-signature-help", { clear = true }),
                callback = function(event)
                    vim.keymap.set("i", "<C-k>", function()
                        for _, client in ipairs(vim.lsp.get_clients({ bufnr = event.buf })) do
                            if client:supports_method(signature_method, event.buf) then
                                vim.lsp.buf.signature_help()
                                return
                            end
                        end

                        vim.notify("Signature help is not supported in this buffer", vim.log.levels.INFO)
                    end, {
                        buffer = event.buf,
                        silent = true,
                        desc = "LSP signature help",
                    })
                end,
            })
        end,
        -- LSP must be enabled before the first FileType event.  VeryLazy is
        -- too late for a TSX file passed on the nvim command line.
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = { "clang-format" },
        },
        event = "VeryLazy",
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip",
            "xzbdmw/colorful-menu.nvim",
        },
        event = "VeryLazy",
        version = "1.*",
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "super-tab" },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                ghost_text = {
                    enabled = true,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                menu = {
                    draw = {
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        components = {
                            label = {
                                text = function (ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function (ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end
                            }
                        }
                    }
                }
            },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer"},
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    }
                },
            },
            snippets = { preset = "luasnip" },
        },
        opts_extend = { "sources.default" },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
