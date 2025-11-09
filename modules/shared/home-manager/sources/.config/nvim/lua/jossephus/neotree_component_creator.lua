-- neo-tree-plugin.lua
-- Plugin for Neo-tree to create component files with a given name

local function create_component_files(dir_path)
	vim.ui.input({ prompt = "Enter component name: " }, function(component_name)
		if not component_name or component_name == "" then
			vim.notify("Component name cannot be empty", vim.log.levels.ERROR)
			return
		end

		local html_file = string.format("%s/%s.component.html", dir_path, component_name)
		local scss_file = string.format("%s/%s.component.scss", dir_path, component_name)

		-- Create the files
		local html_created = vim.loop.fs_open(html_file, "w", 420) -- 420 = 0644 permissions
		local scss_created = vim.loop.fs_open(scss_file, "w", 420)

		if html_created then
			vim.loop.fs_close(html_created)
		end
		if scss_created then
			vim.loop.fs_close(scss_created)
		end

		if html_created and scss_created then
			vim.notify(string.format("Created %s and %s", html_file, scss_file), vim.log.levels.INFO)
		else
			vim.notify("Failed to create component files", vim.log.levels.ERROR)
		end
	end)
end

local function setup_neo_tree_plugin()
	-- Mapping the custom function to Neo-tree
	vim.api.nvim_set_keymap("n", "<leader>ng", "", {
		noremap = true,
		silent = true,
		callback = function()
			local neo_tree = require("neo-tree")
			local state = neo_tree.get_state("filesystem")
			if not state or not state.tree then
				vim.notify("Neo-tree filesystem state is unavailable", vim.log.levels.ERROR)
				return
			end

			local node = state.tree:get_node()
			if not node then
				vim.notify("No directory selected in Neo-tree", vim.log.levels.ERROR)
				return
			end

			if node.type ~= "directory" then
				vim.notify("Please select a directory", vim.log.levels.ERROR)
				return
			end

			create_component_files(node.path)
		end,
	})

	vim.notify("Neo-tree plugin for component creation loaded", vim.log.levels.INFO)
end

-- Initialize the plugin
setup_neo_tree_plugin()
