return {
  {
    "obsidian-progress.nvim",
    dir = vim.fs.normalize(vim.fn.expand("~/Documents/GoogleDrive/obsidian-progress/obsidian-progress.nvim")),
    enabled = vim.fn.isdirectory(
      vim.fs.normalize(vim.fn.expand("~/Documents/GoogleDrive/obsidian-progress/obsidian-progress.nvim"))
    ) == 1,
    dependencies = { "obsidian-nvim/obsidian.nvim" },
    cmd = "ObsidianProgress",
    opts = {},
  },
}