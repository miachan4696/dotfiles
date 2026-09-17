# Neovim configuration

この設定は LazyVim ではなく、`lazy.nvim` を使った自作構成です。

## 構成

- `init.lua`: 起動処理
- `lua/config/`: オプション、キーマップ、外部変更検知、lazy.nvim の初期化
- `lua/plugins/base/`: 基盤プラグイン
- `lua/plugins/editor/`: 編集補助
- `lua/plugins/lsp/`: LSP、補完、Treesitter、フォーマット、lint
- `lua/plugins/ui/`: テーマ、UI、ダッシュボード

`lua/config/lazy.lua` は各カテゴリを lazy.nvim の `import` で読み込みます。
各プラグインファイルは lazy.nvim の plugin spec (`return { ... }`) として定義しています。

## 主な機能

- Mason / LSP / Blink.cmp / Treesitter
- Snacks、NvimTree、Bufferline、Lualine
- Gitsigns、Conform、nvim-lint、none-ls
- Yazi、Avante（Copilot）、skkeleton、日本語ヘルプ
- Markdown、Obsidian、画像プレビュー
- DAP、Overseer、ToggleTerm、SnipRun

## プラグイン一覧

### 基盤・Git・ファイル操作

| プラグイン | 用途 |
| --- | --- |
| `folke/snacks.nvim` | Picker、ダッシュボード、画像プレビュー |
| `folke/which-key.nvim` | キーマップのヘルプ |
| `mikavilpas/yazi.nvim` | Yazi連携 |
| `simeji/winresizer` | ウィンドウサイズ変更 |
| `vim-jp/vimdoc-ja` | Vimヘルプ日本語化 |
| `vim-skk/skkeleton` | 日本語入力 |
| `vim-denops/denops.vim` | skkeletonの実行基盤 |
| `delphinus/skkeleton_indicator.nvim` | SKK状態表示 |
| `wakatime/vim-wakatime` | WakaTime連携 |
| `lewis6991/gitsigns.nvim` | Git差分表示 |
| `f-person/git-blame.nvim` | Git blame表示 |
| `kdheepak/lazygit.nvim` | LazyGit連携 |

### LSP・補完・コード品質

| プラグイン | 用途 |
| --- | --- |
| `mason-org/mason.nvim` | 外部ツール管理 |
| `mason-org/mason-lspconfig.nvim` | MasonとLSPの連携 |
| `neovim/nvim-lspconfig` | LSP設定 |
| `saghen/blink.cmp` | 補完 |
| `rafamadriz/friendly-snippets` | スニペット集 |
| `L3MON4D3/LuaSnip` | スニペットエンジン |
| `xzbdmw/colorful-menu.nvim` | 補完メニューの装飾 |
| `folke/lazydev.nvim` | Lua開発補助 |
| `davidmh/cspell.nvim` | CSpell連携 |
| `nvim-treesitter/nvim-treesitter` | 構文解析・ハイライト |
| `windwp/nvim-ts-autotag` | HTML/JSXタグ補完 |
| `windwp/nvim-autopairs` | 括弧の自動挿入 |
| `stevearc/conform.nvim` | フォーマット |
| `mfussenegger/nvim-lint` | Linter連携 |
| `nvimtools/none-ls.nvim` | LSP経由の外部ツール連携 |

### UI・表示

| プラグイン | 用途 |
| --- | --- |
| `rebelot/kanagawa.nvim` | カラースキーム |
| `folke/noice.nvim` | メッセージ・コマンドUI |
| `rcarriga/nvim-notify` | 通知UI |
| `j-hui/fidget.nvim` | LSP進捗表示 |
| `nvimdev/dashboard-nvim` | 起動画面 |
| `nvim-tree/nvim-tree.lua` | ファイルツリー |
| `nvim-tree/nvim-web-devicons` | ファイルアイコン |
| `akinsho/bufferline.nvim` | バッファタブ |
| `nvim-lualine/lualine.nvim` | ステータスライン |
| `Bekaboo/dropbar.nvim` | コンテキストバー |
| `shellRaining/hlchunk.nvim` | インデント表示 |
| `hiphish/rainbow-delimiters.nvim` | 括弧の色分け |
| `folke/trouble.nvim` | 診断・参照一覧 |
| `MeanderingProgrammer/render-markdown.nvim` | Markdown表示 |
| `vyfor/cord.nvim` | Discord Rich Presence |
| `nvim-telescope/telescope-fzf-native.nvim` | PickerのFZF高速化 |

### 編集・開発ツール

| プラグイン | 用途 |
| --- | --- |
| `yetone/avante.nvim` | AI支援 |
| `zbirenbaum/copilot.lua` | Copilot連携 |
| `HakonHarnes/img-clip.nvim` | 画像貼り付け |
| `stevearc/dressing.nvim` | 入力UI |
| `nvzone/minty` | カラーピッカー |
| `nat-418/boole.nvim` | 数値・日付操作 |
| `nvzone/minty` | カラーピッカー |
| `nvzone/volt` | MintyのUI基盤 |
| `koron/codic-vim` | Codic翻訳 |
| `mattn/emmet-vim` | Emmet展開 |
| `kylechui/nvim-surround` | Surround編集 |
| `norcalli/nvim-colorizer.lua` | カラーコード表示 |
| `ysmb-wtsg/in-and-out.nvim` | 括弧内外移動 |
| `akinsho/toggleterm.nvim` | ターミナル |
| `stevearc/overseer.nvim` | タスク実行 |
| `michaelb/sniprun` | コード実行 |
| `pwntester/octo.nvim` | GitHub Issue / PR操作 |
| `nvim-lua/plenary.nvim` | 共通Luaライブラリ |
| `MunifTanjim/nui.nvim` | UIコンポーネント |
| `obsidian-nvim/obsidian.nvim` | Obsidian連携 |
| `obsidian-progress.nvim` | Obsidian進捗表示（ローカルプラグイン） |

### デバッグ

| プラグイン | 用途 |
| --- | --- |
| `mfussenegger/nvim-dap` | Debug Adapter Protocol |
| `rcarriga/nvim-dap-ui` | DAP UI |
| `nvim-neotest/nvim-nio` | 非同期処理基盤 |
| `theHamsta/nvim-dap-virtual-text` | DAP値のインライン表示 |

### 無効化中

| プラグイン | 状態 |
| --- | --- |
| `catppuccin/nvim` | 設定は残っているが `enabled = false` |

既存設定の退避先:
`C:\Users\mia\.config\nvim-backup-20260917-115002`
