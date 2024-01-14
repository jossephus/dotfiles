return {
    {
        "lewis6991/impatient.nvim",
        config = function()
            --print("Hello Impatient")
            require("impatient").enable_profile()
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        config = function()
            vim.keymap.set({'n', 't'}, '<A-h>', require('smart-splits').resize_left)
            vim.keymap.set({'n', 't'}, '<A-j>', require('smart-splits').resize_down)
            vim.keymap.set({'n', 't'}, '<A-DOWN>', require('smart-splits').resize_down)
            vim.keymap.set({'n', 't'}, '<A-k>', require('smart-splits').resize_up)
            vim.keymap.set({'n', 't'}, '<A-UP>', require('smart-splits').resize_up)
            vim.keymap.set({'n', 't'}, '<A-l>', require('smart-splits').resize_right)
        end, 
    },
    {
        "famiu/bufdelete.nvim",
        keys = {
        	{"][", "<cmd>:Bdelete<cr>", "buffer delete"},
        },
        config = function()
            vim.keymap.set("n", "][", ":Bdelete<cr>")
        end,
    },
	{
		"folke/trouble.nvim",
		keys = {
			{"<Leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "trouble toggle"},
			{"<Leader>q", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "trouble toggle"},
		},
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to    the default settings
				-- refer to the configuration section below
			})
		end,
	},

	
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	-- "nvim-treesitter/playground",
	
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	
	{ 
		"folke/zen-mode.nvim",
		keys = {"<Leader>zZ", "<Leader>zz"},
	},
}
