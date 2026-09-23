return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup({})
      treesitter.install({ "c", "cpp", "cmake" })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("cpp-treesitter-highlighting", { clear = true }),
        pattern = { "c", "cpp", "cmake" },
        callback = function(event)
          if not pcall(vim.treesitter.start, event.buf) then
            vim.notify("Treesitter parser is not installed for " .. vim.bo[event.buf].filetype, vim.log.levels.WARN)
          end
        end,
      })
    end,
  },
}