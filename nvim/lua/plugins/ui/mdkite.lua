return {
  {
    "selimacerbas/mdkite.nvim",
    dependencies = {
      "selimacerbas/kitehost.nvim",
    },
    cmd = { "MdKite" },
    ft = { "markdown" },

    opts = {
      open_browser = true,
      auto_refresh = true,
    },

    keys = {
      {
        "<leader>mv",
        "<cmd>MdKite toggle<cr>",
        ft = "markdown",
        desc = "Markdown preview",
      },
    },
  },
}
