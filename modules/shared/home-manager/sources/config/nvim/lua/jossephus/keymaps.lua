vim.g.mapleader = ","
vim.g.maplocalleader = ","

--tabs
vim.keymap.set("n", "<Leader>tn", ":tabnext<cr>")
vim.keymap.set("n", "<Leader>tp", ":tabprev<cr>")
--{{ center when editing
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "<down>", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<up>", "kzz")
vim.keymap.set("n", "G", "Gzz")
--}}
vim.keymap.set("n", "<Leader>nv", ":tabnew ~/.config/nvim/<CR>")
vim.keymap.set("n", "<Leader>sv", ":so $MYVIMRC<cr>")
vim.keymap.set("i", "<Leader><tab>", "<C-N>")
vim.keymap.set("n", "<Leader><space>", ":nohlsearch<CR>", { silent = true })
--vim.keymap.set("n", "<Leader>ss", ':echo "Hello, World"')
vim.keymap.set("n", "[[", ":bprev<cr>", { noremap = true })
vim.keymap.set("n", "{", ":bprev<cr>", { noremap = true })
vim.keymap.set("n", "]]", ":bnext<cr>")
vim.keymap.set("n", "}", ":bnext<cr>")

vim.keymap.set("n", "<Leader>a", "<C-t>", { noremap = true })
vim.keymap.set("n", "gk", ":vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true })
--vim.highlight.("LspInlayHint", { guifg = "#d8d8d8", guibg = "#3a3a3a" })
vim.cmd([[
  hi LspInlayHint guifg=#d8d8d8 guibg=#3a3a3a
]])

-- vim.keymap.set("n", "][", ":bdelete<cr>") -- closes the whole window insted of deleting the current buffer, use 'famu/bufdelete.nvim' instead
