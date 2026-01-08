local prise = require("prise")

local POWERLINE = {
  right_solid = "\u{E0B0}",
  left_solid = "\u{E0B2}",
}

local config = {
  tab_bar = {
    show_single_tab = true,
    format_title = function(title, tab_index)
      local program = title:match(".-(%w+)%s*$") or title
      return tab_index .. ". " .. program
    end,
    render = function(tabs, screen_width, theme)
      local segments = {}
      local used_width = 0
      local last_bg = theme.bg1

      for i, tab in ipairs(tabs) do
        local tab_fg
        if tab.is_active then
          tab_fg = "#ffffff"
        elseif tab.is_hovered then
          tab_fg = theme.fg_bright
        else
          tab_fg = theme.fg_dim
        end

        local tab_text = " " .. tab.title .. " "

        table.insert(segments, {
          text = tab_text,
          style = {
            fg = tab_fg,
            bold = tab.is_active
          }
        })
        used_width = used_width + prise.gwidth(tab_text)

        if i < #tabs then
          table.insert(segments, {
            text = " │ ",
            style = { fg = theme.fg_dim }
          })
          used_width = used_width + 3
        end
      end

      local session_name = prise.get_session_name() or "prise"

      local right_width = 1 + prise.gwidth(" " .. session_name .. " ")

      local padding = screen_width - used_width - right_width
      if padding < 0 then
        padding = 0
      end

      table.insert(segments, {
        text = string.rep(" ", padding),
        style = {}
      })

      table.insert(segments, { text = POWERLINE.right_solid, style = { fg = theme.bg1, bg = theme.bg1 } })
      table.insert(segments, { text = " " .. session_name .. " ", style = { bg = theme.bg1, fg = theme.fg_bright } })

      return segments
    end,
  },

  theme = {
    -- Dark background like tmux
    mode_normal = "#2a7b2e",  -- Green
    mode_command = "#d65d0e", -- Orange
    bg1 = "#1d2021",          -- Very dark background
    bg2 = "#282828",          -- Dark background
    bg3 = "#3c3836",          -- Medium gray (for right side)
    bg4 = "#504945",          -- Lighter gray

    -- Text colors
    fg_bright = "#ebdbb2", -- Light cream (for time)
    fg_dim = "#928374",    -- Lighter gray than before
    fg_dark = "#1d2021",   -- Dark for contrast

    -- Accent colors
    accent = "#458588", -- Blue
    green = "#b8bb26",  -- Yellow-green
    yellow = "#fabd2f", -- Yellow
  },

  borders = {
    enabled = true,
    show_single_pane = false,
    mode = "box",
    style = "rounded",
    focused_color = "#458588",
    unfocused_color = "#504945",
  },

  status_bar = {
    enabled = false,
  },

  leader = "<D-k>",

  keybinds = {
    ["<D-p>"] = "command_palette",
    ["<leader>v"] = "split_horizontal",
    ["<leader>s"] = "split_vertical",
    ["<leader><Enter>"] = "split_auto",
    ["<leader>h"] = "focus_left",
    ["<leader>l"] = "focus_right",
    ["<leader>j"] = "focus_down",
    ["<leader>k"] = "focus_up",
    ["<leader><ArrowUp>"] = "focus_up",
    ["<leader><ArrowDown>"] = "focus_down",
    ["<leader><ArrowLeft>"] = "focus_left",
    ["<leader><ArrowRight>"] = "focus_right",
    ["<leader>w"] = "close_pane",
    ["<leader>z"] = "toggle_zoom",
    ["<leader>t"] = "new_tab",
    ["<leader>c"] = "close_tab",
    ["<leader>r"] = "rename_tab",
    ["<leader>]"] = "next_tab",
    ["<leader>["] = "previous_tab",
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
    ["<leader>H"] = "resize_left",
    ["<leader>L"] = "resize_right",
    ["<leader>J"] = "resize_down",
    ["<leader>K"] = "resize_up",
    ["<leader>d"] = "detach_session",
    ["<leader>q"] = "quit",
  },
}

prise.tiling().setup(config)
return prise.tiling()
