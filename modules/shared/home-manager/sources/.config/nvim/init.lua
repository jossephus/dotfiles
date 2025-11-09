require("jossephus")
require("impatient")
-- press c-s to save files in the three modes
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>")

-- vue autoformatting is not working for some reason
-- I will use this until I figure it out
--vim.cmd([[
--augroup vue_auto_format
    --autocmd!
    --autocmd BufWritePost *.vue :lua vim.lsp.buf.format { async = true }
--augroup END
--]])

--vim.lsp.start({
  --name = 'monkey-language-server',
  --cmd = { 'monkey-language-server' },
--})

vim.filetype.add({
  extension = {
    ziggy = "ziggy",
    wren = "wren"
  }
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ziggy", {}),
	pattern = "ziggy",
	callback = function()
		vim.lsp.start({
			name = "Ziggy LSP",
			cmd = { "ziggy", "lsp" },
			root_dir = vim.loop.cwd(),
			flags = { exit_timeout = 1000 },
		})
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ziggy_schema", {}),
	pattern = "ziggy_schema",
	callback = function()
		vim.lsp.start({
			name = "Ziggy LSP",
			cmd = { "ziggy", "lsp", "--schema" },
			root_dir = vim.loop.cwd(),
			flags = { exit_timeout = 1000 },
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wren", {}),
	pattern = "wren",
	callback = function()
		vim.lsp.start({
			name = "Wren LSP",
			cmd = { "/home/aldrich/workspace/zigspace/src/wren-lsp/zig-out/bin/wren-lsp" },
			root_dir = vim.loop.cwd(),
			flags = { exit_timeout = 1000 },
		})
	end,
})
--vim.lsp.set_log_level("debug")

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

