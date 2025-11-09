return {
	-- {
	-- 	"VonHeikemen/fine-cmdline.nvim",
	-- 	config = function()
	-- 		vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
	-- 	end,
	-- },

	-- auto close unedited buffers
	{
		"axkirillov/hbac.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("hbac").setup({
				autoclose = true,
				threshold = 4,
			})
		end,
	},
	--{
	--"HiPhish/nvim-ts-rainbow2",
	--},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			})
		end,
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
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
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
		main = "ibl",
		config = function()
			--vim.opt.list = true
			--vim.opt.listchars:append("space:⋅")
			----vim.opt.listchars:append("eol:↴")

			--require("indent_blankline").setup({
			--space_char_blankline = " ",
			--show_current_context = true,
			--show_current_context_start = true,
			--})
		end,
	},
	--{
	--"chrisgrieser/nvim-puppeteer",
	--dependencies = "nvim-treesitter/nvim-treesitter",
	--lazy = false,
	--},
	{
		"segeljakt/vim-silicon",
		config = function()
			vim.keymap.set("n", "<Leader>ss", ":Silicon /mnt/c/Users/25191/Downloads/Screenshots/<cr>")
			vim.g.silicon = {
				theme = "1337",
				font = "GoMono Nerd Font Mono",
				background = "#AAAAFF",
				--shadow_color = '#555555',
				--line_pad = 2,
				--pad_horiz = 80,
				--pad_vert = 100,
				--shadow_blur_radius = 0,
				--shadow_offset_x = 0,
				--shadow_offset_y = 0,
				--line_number = true,
				--round_corner = true,
				--window_controls = true,
			}
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				gitblame_virtual_text_column = 400,
			})
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
}
