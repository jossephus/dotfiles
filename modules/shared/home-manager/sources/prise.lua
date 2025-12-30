-- Comprehensive Prise configuration example
-- This shows all available options with explanations

-- Start with the tiling UI and configure it
local prise = require("prise")

-- Configuration table with all possible options
local config = {
-- Theme colors for the UI (Horizon dark theme)
theme = {
  -- Mode indicator colors (status bar left section)
  mode_normal = "#26BBD9",  -- Blue for normal mode
  mode_command = "#E95678", -- Red for command mode (waiting for action)

  -- Background colors (used in status bar and UI elements)
  bg1 = "#16161C", -- shadow (darkest background)
  bg2 = "#1C1E26", -- background
  bg3 = "#232530", -- backgroundAlt (medium background)
  bg4 = "#2E303E", -- accent (lighter background)

  -- Text/foreground colors
  fg_bright = "#D5D8DA", -- lightText (main text)
  fg_dim = "#6C6F93",    -- accentAlt (dimmed/secondary text)
  fg_dark = "#06060C",   -- darkText (for contrast on light backgrounds)

  -- Accent colors
  accent = "#26BBD9", -- Blue accent (matches mode_normal)
  green = "#29D398",  -- ANSI green (success/connected indicator)
  yellow = "#FAB795", -- ANSI yellow (warning/zoom indicator)
},

-- Pane border styling
borders = {
  enabled = true,              -- Show borders around panes
  show_single_pane = false,    -- Show border when only one pane exists
  mode = "box",                -- "box" = full borders, "separator" = tmux-style dividers
  style = "single",            -- "none", "single", "double", "rounded"
  focused_color = "#89b4fa",   -- Color of the focused pane border
  unfocused_color = "#585b70", -- Color of unfocused pane borders
},

-- Status bar at the bottom of the terminal
status_bar = {
  enabled = true, -- Show the powerline-style status bar
},

-- Tab bar at the top when multiple tabs exist
tab_bar = {
  show_single_tab = false, -- Show tab bar even with only one tab
  style = "bar",           -- "pill" (rounded, default) or "bar" (flat/square)
  -- Optional: format tab titles when renaming
  format_title = function(title, tab_index)
    return title .. "-" .. tab_index  -- Appends tab number to title
  end,
},

-- Leader key for keybindings (used as prefix for commands)
leader = "<D-k>", -- Cmd+K on macOS, can use <C-a> for Ctrl+A, etc.

-- macOS-specific: how Option key behaves
macos_option_as_alt = "false", -- "true"|"left"|"right"|"false"
-- "left" = only left Option is Alt
-- "right" = only right Option is Alt

-- Keybindings: map key combinations to actions
keybinds = {
  -- Command palette (search commands)
  ["<D-p>"] = "command_palette",

  -- Splitting
  ["<leader>v"] = "split_horizontal", -- Vertical split (side-by-side)
  ["<leader>s"] = "split_vertical",   -- Horizontal split (top-bottom)
  ["<leader><Enter>"] = "split_auto", -- Auto split based on available space

  -- Navigation between panes
  ["<leader>h"] = "focus_left",
  ["<leader>l"] = "focus_right",
  ["<leader>j"] = "focus_down",
  ["<leader>k"] = "focus_up",
  ["<leader><ArrowUp>"] = "focus_up",
  ["<leader><ArrowDown>"] = "focus_down",
  ["<leader><ArrowLeft>"] = "focus_left",
  ["<leader><ArrowRight>"] = "focus_right",

  -- Pane management
  ["<leader>w"] = "close_pane",  -- Close current pane
  ["<leader>z"] = "toggle_zoom", -- Zoom/focus current pane

  -- Tab management
  ["<leader>t"] = "new_tab",      -- Create new tab
  ["<leader>c"] = "close_tab",    -- Close current tab
  ["<leader>r"] = "rename_tab",   -- Rename current tab
  ["]]"] = "next_tab",     -- Go to next tab
  ["[["] = "previous_tab", -- Go to previous tab

  -- Quick tab access (1-9, 0 for 10th)
  ["<leader>1"] = "tab_1",
  ["<leader>2"] = "tab_2",
  ["<leader>3"] = "tab_3",
  ["<leader>4"] = "tab_4",
  ["<leader>5"] = "tab_5",
  ["<leader>6"] = "tab_6",
  ["<leader>7"] = "tab_7",
  ["<leader>8"] = "tab_8",
  ["<leader>9"] = "tab_9",
  ["<leader>0"] = "tab_10",

  -- Resizing (adjust pane proportions)
  ["<leader>H"] = "resize_left",
  ["<leader>L"] = "resize_right",
  ["<leader>J"] = "resize_down",
  ["<leader>K"] = "resize_up",

  -- Session management
  ["<leader>d"] = "detach_session", -- Detach from this prise session
  ["<leader>q"] = "quit",           -- Quit prise entirely
},
}

-- Call setup to apply configuration
prise.tiling().setup(config)

-- Return the configured UI
return prise.tiling()
