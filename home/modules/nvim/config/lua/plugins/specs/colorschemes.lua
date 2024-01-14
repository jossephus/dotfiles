return {
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
	},
	{
		"ofirgall/ofirkai.nvim",
		lazy = true,
		config = function()
			require("ofirkai").setup({
				scheme = {
					background = "#23231d",
					winbar_bg = "#1d1d14",
				},
			})
		end,
	},
	{
		"Yazeed1s/minimal.nvim",
		lazy = true,
	},
	{
		"akinsho/horizon.nvim",
		lazy = true,
	},
}










-- collections of colorschemes I've tried before and liked
--{
--"loctvl842/monokai-pro.nvim",
--lazy = true,
--config = function()
--require("monokai-pro").setup({
--transparent_background = true,
--filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
--override = function()
--return {
--Normal = { bg = "#114352" },
--}
--end,
--})
--end,
--},
--{
--"Mofiqul/vscode.nvim",

--lazy = true,
--config = function()
--local c = require("vscode.colors").get_colors()
--require("vscode").setup({
--transparent = true,
--italic_comments = true,
--})
--require("vscode").load()
--end,
--},
--{
--"rebelot/kanagawa.nvim",
--lazy = true,
--},
--{
--"glepnir/zephyr-nvim",
--lazy = true,
--},
--{
--"rktjmp/lush.nvim",
--},
--{
--"kaiuri/nvim-juliana",
--},
--{
--"rose-pine/neovim",
--as = "rose-pine",
--},
--{
--"Mofiqul/dracula.nvim",
--},
--{
--"catppuccin/nvim",
--lazy = true,
--},
--{
--"lunarvim/darkplus.nvim",
--lazy = true,
--},
--{
--"EdenEast/nightfox.nvim",
--lazy = true,
--},
