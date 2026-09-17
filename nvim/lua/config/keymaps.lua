local map = vim.keymap.set

local function load(plugin)
  require("lazy").load({ plugins = { plugin } })
end

local function project_root()
  return vim.fs.root(0, { ".git", "package.json", "tsconfig.json", "jsconfig.json" })
    or vim.fn.getcwd()
end

local function snacks_picker(name, opts)
  return function()
    load("snacks.nvim")

    local options = opts or {}
    if name == "files" or name == "grep" then
      options = vim.tbl_extend("force", options, {
        cwd = project_root(),
        hidden = project_root():match("dotfiles$") ~= nil,
      })
    end

    require("snacks").picker[name](options)
  end
end

map("n", "<leader>bd", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers" })

map("n", "<leader>p", snacks_picker("pickers"), { desc = "Snacks pickers" })
map("n", "<leader><leader>", snacks_picker("files"), { desc = "Find files" })
map("n", "<leader>/", snacks_picker("grep"), { desc = "Grep" })
map("n", "<leader>fh", snacks_picker("help", {
  win = {
    input = {
      keys = {
        ["<CR>"] = { "edit_vsplit", mode = { "i", "n" } },
      },
    },
  },
}), { desc = "Search help" })

map("n", "<leader>mp", function()
  load("snacks.nvim")
  require("snacks").image.hover()
end, { desc = "Preview image or formula" })

map("n", "<leader>gf", function()
  load("snacks.nvim")
  require("snacks").picker.git_log_file({
    confirm = function(_, item)
      if item and item.commit then
        require("snacks").gitbrowse({ commit = item.commit })
      end
    end,
  })
end, { desc = "Git log for file" })

map("n", "<leader>gD", function()
  load("snacks.nvim")
  require("snacks").picker.git_diff({ base = "main" })
end, { desc = "Git diff against main" })

map("n", "<leader>fy", function()
  load("yazi.nvim")
  vim.cmd.Yazi()
end, { desc = "Yazi" })

map("n", "<leader>fY", function()
  load("yazi.nvim")
  vim.cmd("Yazi cwd")
end, { desc = "Yazi in current directory" })

map("n", "<leader>wr", function()
  load("winresizer")
  vim.cmd.WinResizerStartResize()
end, { desc = "Resize window" })
map("n", "<leader>cp", "<cmd>Huefy<cr>", { desc = "Color picker" })
map("n", "<leader>gP", "<cmd>Octo search project<cr>", { desc = "Search GitHub project" })
map("n", "<leader><cr>", "<cmd>SnipRun<cr>", { desc = "Run code" })
map("x", "<leader><cr>", "<cmd>SnipRun<cr>", { desc = "Run selection" })
map("n", "<leader><cr>R", "<cmd>%SnipRun<cr>", { desc = "Run file" })
map("n", "<leader><cr>q", "<cmd>SnipClose<cr>", { desc = "Close SnipRun" })

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd.checkhealth("vim.lsp")
end, { desc = "Show Neovim LSP health information" })
