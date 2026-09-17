return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- 常に最新を追従
  opts = {
    provider = "copilot",
  },
  keys = { "<leader>a", desc = "Avante" },
  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- Windowsはこちらを使う
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- 以下はオプション
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- provider='copilot' に必要
    {
      "HakonHarnes/img-clip.nvim", -- 画像貼り付け対応
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
