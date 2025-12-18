vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

vim.cmd([[
  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill'
    execute 'FloatermNew! '.a:cmd.' | less -X'
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])

--require('neotest').setup({
    --adapters = {
        --require('neotest-rust'),
        --require('neotest-vitest') { args = '--silent=false' },
        ----require('neotest-vim-test') ({ allow_file_types = { "javascript" } }),
    --}
--})
--vim.keymap.set('n', '<Leader>tn', ':lua require("neotest").run.run()<cr>')
--vim.keymap.set('n', '<Leader>to', ':lua require("neotest").summary.open()<cr>')
--vim.keymap.set('n', '<Leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
