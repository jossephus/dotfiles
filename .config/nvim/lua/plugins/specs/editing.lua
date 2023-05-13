return {
	-- {
	-- 	"VonHeikemen/fine-cmdline.nvim",
	-- 	config = function()
	-- 		vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
	-- 	end,
	-- },
  {
    "HiPhish/nvim-ts-rainbow2",
  },
  {
    "SmiteshP/nvim-navic",
    config = function() 
      require("nvim-navic").setup()
    end, 
  },
	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		config = function()
			require("treesj").setup({})
		end,
	},
	--{
	---- because formatting wasn't working with lsp for vue
	--"sbdchd/neoformat",
	--config = function()
	--vim.cmd([[
	--augroup vue_fmt
	--autocmd!
	--autocmd BufWritePre *.vue undojoin | Neoformat
	--augroup END
	--]])
	--end,
	--},
	-- "gpanders/editorconfig.nvim",
	{
		"preservim/nerdcommenter",
	},

	--"Pocco81/auto-save.nvim", -- auto save is not fun
	-- auto pairs is messing with cmp
	--"jiangmiao/auto-pairs",
	{
		"cohama/lexima.vim",
	},

	"tpope/vim-surround",
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	--{
	--"ahmedkhalf/project.nvim",
	--config = function()
	--require('project_nvim').setup({

	--})
	--end,
	--},
	--{
	--"Shatur/neovim-session-manager",
	--config = function()
	--require("session_manager").setup({
	--autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
	--})
	--end,
	--},
	{
		"jossephus/vim-geez",
		-- use <Leader>g to toggle between geez and english
		--
		config = function()
			vim.cmd([[
                function! ToggleGeezKeyboard() 
                   if &keymap !=# "geez"
                       set keymap=geez
                   else
                       set keymap=
                   endif
                endfunction

                nnoremap <Leader>g :call ToggleGeezKeyboard()<cr>
                inoremap <Leader>g <ESC>:call ToggleGeezKeyboard()<cr>i
            ]])
			--vim.cmd("set keymap=geez")
		end,
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			--vim.opt.listchars:append("eol:↴")

			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
}
