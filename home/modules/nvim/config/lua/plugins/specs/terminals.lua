return {
	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<Leader><Leader>" },
		},
		config = function()
			vim.g.floaterm_width = 0.8
			vim.g.floaterm_height = 0.8
			vim.keymap.set("n", "<Leader><Leader>", ":FloatermToggle<CR>")
			-- vim.keymap.set("n", "<ALT-`>", ":FloatermToggle<CR>")
			vim.keymap.set("t", "<Leader><space>", "<C-\\><C-n>:FloatermToggle<CR>")
			vim.keymap.set("t", "<Leader><Leader>", "<C-\\><C-n>:FloatermNext<CR>")
			vim.keymap.set("t", "<Leader>a", "<C-\\><C-n>:FloatermNew<CR>")
			vim.cmd([[
                highlight link Floaterm CursorLine
                highlight link FloatermBorder CursorLineBg
            ]])
		end,
	},
	{
		"michaelb/sniprun",
		build = "bash ./install.sh",
		cmd = { "SnipRun" },
    config = function()
      require('sniprun').setup({
        interpreter_options = {
          Rust_original = {
               compiler = "rustc"
             }
          }
        })
    end,
	},
	{
		"akinsho/toggleterm.nvim",
		keys = { "<Leader>`" },
		opts = {
			open_mapping = "<Leader>`",
			direction = "vertical",
		},
		config = function()
			require("toggleterm").setup({
				open_mapping = "<Leader>`",
				size = 30,
				direction = "horizontal",
			})

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
