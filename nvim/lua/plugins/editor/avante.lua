return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,

  build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",

  opts = {
    provider = "copilot",
    mode = "agentic",

    behaviour = {
      use_cwd_as_project_root = true,
      allow_access_to_git_ignored_files = true,
    },
  },

  config = function(_, opts)
    require("avante").setup(opts)
  end,

  keys = {
    { "<leader>a", desc = "Avante" },
  },

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",

    "HakonHarnes/img-clip.nvim",

    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },

    {
      "ColinKennedy/mega.cmdparse",
      dependencies = {
        "ColinKennedy/mega.logging",
      },
    },
  },
}