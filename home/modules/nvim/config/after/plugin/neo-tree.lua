-- when using themes that do not support neo-tree but nvim-tree
vim.cmd([[
	highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
	highlight! link NeoTreeDirectoryName NvimTreeFolderName
	highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
	highlight! link NeoTreeRootName NvimTreeRootFolder
	highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
	highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
]])
