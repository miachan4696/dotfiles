local keymap = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

-- ============================================================================
-- Insert mode: Emacs-like keybindings
-- ============================================================================

keymap("i", "<C-a>", "<Home>", {
  desc = "Move to start of line",
})

keymap("i", "<C-e>", "<End>", {
  desc = "Move to end of line",
})

keymap("i", "<C-b>", "<Left>", {
  desc = "Move left",
})

keymap("i", "<C-f>", "<Right>", {
  desc = "Move right",
})

-- ============================================================================
-- Restore Ctrl-I / Tab behavior
-- ============================================================================

keymap("n", "<C-i>", "<C-i>", opts)
keymap("i", "<C-i>", "<C-i>", opts)

-- ============================================================================
-- Increment / Decrement
-- ============================================================================

keymap("n", "+", "<C-s>", {
  desc = "Increment number",
})

keymap("n", "-", "<C-x>", {
  desc = "Decrement number",
})

-- ============================================================================
-- Tabs
-- ============================================================================

keymap("n", "<Tab>", "<cmd>tabnext<cr>", {
  desc = "Next tab",
})

keymap("n", "<S-Tab>", "<cmd>tabprevious<cr>", {
  desc = "Previous tab",
})

-- ============================================================================
-- Split windows
-- ============================================================================

keymap("n", "ss", "<cmd>split<cr>", {
  desc = "Horizontal split",
})

keymap("n", "sv", "<cmd>vsplit<cr>", {
  desc = "Vertical split",
})

-- Move between windows
keymap("n", "sh", "<C-w>h", {
  desc = "Move to left window",
})

keymap("n", "sj", "<C-w>j", {
  desc = "Move to window below",
})

keymap("n", "sk", "<C-w>k", {
  desc = "Move to window above",
})

keymap("n", "sl", "<C-w>l", {
  desc = "Move to right window",
})

-- Resize windows
keymap("n", "<C-w><Left>", "<C-w><", {
  desc = "Decrease window width",
})

keymap("n", "<C-w><Right>", "<C-w>>", {
  desc = "Increase window width",
})

keymap("n", "<C-w><Up>", "<C-w>+", {
  desc = "Increase window height",
})

keymap("n", "<C-w><Down>", "<C-w>-", {
  desc = "Decrease window height",
})

-- ============================================================================
-- Lazy-loading helpers
-- ============================================================================

local function load(plugin)
  require("lazy").load({
    plugins = { plugin },
  })
end

local function project_root()
  return vim.fs.root(0, {
    ".git",
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
  }) or vim.fn.getcwd()
end

local function snacks_picker(name, picker_opts)
  return function()
    load("snacks.nvim")

    local options = picker_opts or {}

    if name == "files" or name == "grep" then
      local cwd = project_root()

      options = vim.tbl_extend("force", options, {
        cwd = cwd,
        hidden = cwd:match("dotfiles$") ~= nil,
      })
    end

    require("snacks").picker[name](options)
  end
end

-- ============================================================================
-- Snacks
-- ============================================================================

keymap("n", "<leader>bd", "<cmd>%bd|e#|bd#<cr>", {
  desc = "Close all buffers",
})

keymap("n", "<leader>p", snacks_picker("pickers"), {
  desc = "Snacks pickers",
})

keymap("n", "<leader><leader>", snacks_picker("files"), {
  desc = "Find files",
})

keymap("n", "<leader>/", snacks_picker("grep"), {
  desc = "Grep",
})

keymap(
  "n",
  "<leader>fh",
  snacks_picker("help", {
    win = {
      input = {
        keys = {
          ["<CR>"] = {
            "edit_vsplit",
            mode = { "i", "n" },
          },
        },
      },
    },
  }),
  {
    desc = "Search help",
  }
)

keymap("n", "<leader>mp", function()
  load("snacks.nvim")
  require("snacks").image.hover()
end, {
  desc = "Preview image or formula",
})

keymap("n", "<leader>gf", function()
  load("snacks.nvim")

  require("snacks").picker.git_log_file({
    confirm = function(_, item)
      if item and item.commit then
        require("snacks").gitbrowse({
          commit = item.commit,
        })
      end
    end,
  })
end, {
  desc = "Git log for file",
})

keymap("n", "<leader>gD", function()
  load("snacks.nvim")

  require("snacks").picker.git_diff({
    base = "main",
  })
end, {
  desc = "Git diff against main",
})

-- ============================================================================
-- File management
-- ============================================================================

keymap("n", "<leader>fy", function()
  load("yazi.nvim")
  vim.cmd.Yazi()
end, {
  desc = "Open Yazi",
})

keymap("n", "<leader>fY", function()
  load("yazi.nvim")
  vim.cmd("Yazi cwd")
end, {
  desc = "Open Yazi in current directory",
})

-- ============================================================================
-- Other plugins
-- ============================================================================

keymap("n", "<leader>wr", function()
  load("winresizer")
  vim.cmd.WinResizerStartResize()
end, {
  desc = "Resize window",
})

keymap("n", "<leader>cp", "<cmd>Huefy<cr>", {
  desc = "Color picker",
})

keymap("n", "<leader>gP", "<cmd>Octo search project<cr>", {
  desc = "Search GitHub project",
})

-- ============================================================================
-- SnipRun
-- ============================================================================

keymap({ "n", "x" }, "<leader>sr", "<cmd>SnipRun<cr>", {
  desc = "Run code or selection",
})

keymap("n", "<leader>sR", "<cmd>%SnipRun<cr>", {
  desc = "Run entire file",
})

keymap("n", "<leader>sq", "<cmd>SnipClose<cr>", {
  desc = "Close SnipRun",
})

-- ============================================================================
-- LSP
-- ============================================================================

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd.checkhealth("vim.lsp")
end, {
  desc = "Show Neovim LSP health information",
})
