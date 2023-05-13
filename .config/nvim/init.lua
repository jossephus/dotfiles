require("jossephus")
require("impatient")
-- press c-s to save files in the three modes
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")

-- vue autoformatting is not working for some reason
-- I will use this until I figure it out
vim.cmd([[
augroup vue_auto_format
    autocmd!
    autocmd BufWritePost *.vue :lua vim.lsp.buf.format { async = true }
augroup END
]])

--use({
--"mhartington/formatter.nvim",
--config = function()
--require("formatter").setup({
--filetype = {
--javascriptreact = {
---- prettier
--function()
--return {
--exe = "prettier",
--args = {
--vim.api.nvim_buf_get_name(0),
--},
--}
--end,
--},
--javascript = {
---- prettier
--function()
--return {
--exe = "prettier",
--args = {
--"--stdin-filepath",
--vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
--},
--stdin = true,
--}
--end,
--},
--css = {
---- prettier
--function()
--return {
--exe = "prettier",
--args = {
--"--stdin-filepath",
--vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
--},
--stdin = true,
--}
--end,
--},
--},
--})
