local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.laststatus = 3
opt.showmode = false
opt.showcmd = true

-- Editing
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.backspace = { "indent", "eol", "start" }

-- Search and completion
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.wildmenu = true
opt.completeopt = { "menu", "menuone", "noselect" }

-- Windows and files
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.autoread = true
opt.swapfile = false
opt.undofile = true
opt.updatetime = 300
opt.timeoutlen = 300

vim.filetype.add({
  extension = {
    hcl = "terraform",
    tf = "terraform",
    tfstate = "json",
    tfstate_backup = "json",
    tfvars = "terraform",
  },
  pattern = {
    ["^%.env.*"] = "dotenv",
  },
})
