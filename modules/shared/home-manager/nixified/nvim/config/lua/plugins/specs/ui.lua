return {
    {
        -- colorize win separator
        "nvim-zh/colorful-winsep.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "vigoux/notifier.nvim",
        config = function()
            require("notifier").setup({})
        end,
    },
    --"simrat39/desktop-notify.nvim",
    
    {
        "glepnir/nerdicons.nvim",
        cmd = "NerdIcons",
        config = function()
            require("nerdicons").setup({})
        end,
    },
    {
        "b0o/incline.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- activate only when vim split happens
            --vim.api.nvim_create_autocmd("VimEnter", {
            --pattern = "*",
            --group = vim.api.nvim_create_augroup("NvimSplitInclince", { clear = true }),
            --once = true,
            --callback = function()

            --end,
            --}
            --})

            local function get_diagnostic_label(props)
                local icons = {
                    Error = "",
                    Warn = "",
                    Info = "",
                    Hint = "",
                }

                local label = {}
                for severity, icon in pairs(icons) do
                    local n =
                        #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                    if n > 0 then
                        local fg = "#"
                            .. string.format(
                                "%06x",
                                vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"]
                            )
                        table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
                    end
                end
                return label
            end
            require("incline").setup({
                --debounce_threshold = { falling = 500, rising = 250 },
                render = function(props)
                    local bufname = vim.api.nvim_buf_get_name(props.buf)
                    local filename = vim.fn.fnamemodify(bufname, ":t")
                    local diagnostics = get_diagnostic_label(props)
                    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
                    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

                    local buffer = {
                        { filetype_icon, guifg = color },
                        { " " },
                        { filename, gui = modified },
                    }

                    if #diagnostics > 0 then
                        table.insert(diagnostics, { "| ", guifg = "grey" })
                    end
                    for _, buffer_ in ipairs(buffer) do
                        table.insert(diagnostics, buffer_)
                    end
                    return diagnostics
                end,
                window = {
                    padding = 2,
                    --margin = {
                    --vertical = 0,
                    --horizontal = 60,
                    --},
                    placement = {
                        vertical = "top",
                        horizontal = "right",
                    },
                    winhighlight = {
                        Normal = "Function",
                    },
                },
            })
        end,
    },
    -- files per tabs
    {
        "tiagovla/scope.nvim",
        event = "VeryLazy",
        config = function()
            require("scope").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                -- highlights = require("ofirkai.tablines.bufferline").highlights, -- Must
                options = {
                    themable = true,
                    separator_style = "slant",
                    indicator = {
                        style = "underline",
                    },
                    show_buffer_icons = true,
                    numbers = "ordinal",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = " ",
                            highlight = "Directory",
                            text_align = "left",
                        },
                    },
                },
            })
        end,
    },
    --{
    --"dstein64/vim-startuptime",
    --cmd = { "StartupTime" },
    --},
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },
    -- distraction-free Readme Reader
    {
        "junegunn/goyo.vim",
        cmd = {"Goyo"},
        dependencies = {
            "junegunn/limelight.vim",
        },
    },
}
