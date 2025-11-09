vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		keys = {
			{ "-", "<cmd>Neotree focus<cr>", desc = "Explorer" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",

			-- trouble like diagnostics in neotree
			-- "mrbjarksen/neo-tree-diagnostics.nvim",
		},
		config = function()
			local fc = require("neo-tree.sources.filesystem.components")
			require("neo-tree").setup({
				--position = "current",
				--dir = "%:p:h:h",
				--},
				--

				default_component_configs = {
					icon = {
						--folder_closed = " ",
						--folder_open = " ",
					},
				},
				event_handlers = {
					{
						event = "file_opened",
						handler = function(file_path)
							--require("neo-tree.sources.filesystem.components")
							--vim.api.nvim_set_current_dir(".." .. file_path)
							--require("neo-tree").close_all()
						end,
					},
				},

				visible = true,
				close_if_last_window = true,

				window = {
					width = 50,
					position = "left",
					mappings = {
						["o"] = "system_open", -- open folders in your system viewer
						["d"] = "add_directory",
						["D"] = "delete",
						["R"] = "rename",
						["h"] = "navigate_up",
						["Z"] = "expand_all_nodes",
					},
				},
				filesystem = {
					follow_current_file = true, -- focus the currently opened file in tree
					components = {
						name = function(config, node, state)
							local result = fc.name(config, node, state)
							if node:get_depth() == 1 and node.type ~= "message" then
								result.text = vim.fn.fnamemodify(node.path, ":t")
							end
							return result
						end,
					},
					filtered_items = {
						visible = false,
						hide_dotfiles = false,
						hide_by_name = {
							"node_modules",
						},
					},
					window = {
						mappings = {},
					},
				},
				commands = {
					system_open = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.api.nvim_command(string.format("silent !xdg-open '%s' ", path))
					end,
					close_everyone_but_me = function(state) end,
				},
			})
			vim.keymap.set("n", "-", ":Neotree focus<cr>")
		end,
		--"tpope/vim-vinegar",
	},
}
