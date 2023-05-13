-- remove the tildes in new blank line
-- vim.wo.fillchars='eob: '

-- options
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.wildmode = "longest:full,full"

vim.opt.title = true
vim.opt.mouse = "a"

vim.opt.termguicolors = true

-- spell checking is f*ing annoying
--vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.undofile = true

vim.opt.showcmd = true
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = true
vim.opt.incsearch = true

--ported vimrc commands
function pvc(cmd)
	vim.api.nvim_command(cmd)
end
