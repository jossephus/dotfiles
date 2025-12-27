return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "onsails/lspkind.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },

  --{
  --"jay-babu/mason-null-ls.nvim",
  --event = { "BufReadPre", "BufNewFile" },
  --dependencies = {
  --"williamboman/mason.nvim",
  --"nvimtools/none-ls.nvim",
  --},
  --},

  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt", lsp_format = "fallback" },
          javascript = { "prettierd" },
          typescript = { "biome" },
          lua = { "stylua" },
          nix = { "alejandra" },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
      })
    end,
  },

  --{
  --"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --config = function()
  --require("lsp_lines").setup()
  --end,
  --},
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
        end,
        preview_opts = {
          border = nil,
        },
        preview_window = false,
        title = true,
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function() end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    --branch = "anticonceal",
    config = function()
      require("lsp-inlayhints").setup({
        inlay_hints = {
          parameter_hints = {
            show = true,
            prefix = "<- ",
            separator = ", ",
            remove_colon_start = false,
            remove_colon_end = true,
          },
          type_hints = {
            -- type and other hints
            show = true,
            prefix = "",
            separator = ", ",
            remove_colon_start = false,
            remove_colon_end = false,
          },
          only_current_line = false,
          -- separator between types and parameter hints. Note that type hints are
          -- shown before parameter
          labels_separator = "  ",
          -- whether to align to the length of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- highlight group
          highlight = "FloatShadow",
          -- virt_text priority
          priority = 0,
        },
        enabled_at_startup = true,
        debug_mode = false,
      })
      vim.keymap.set("n", "<Leader>ih", ":lua require('lsp-inlayhints').toggle()<cr>")
    end,
  },
  --{
  --"simrat39/inlay-hints.nvim",
  --config = function()
  --require("inlay-hints").setup({
  --highlight = "Comment",
  --prefix = " > ",
  --aligned = true,
  --only_current_line = false,
  --enabled = { "ChainingHint", "TypeHint", "ParameterHint" },
  --eol = {
  --right_align = true,
  --},
  --});
  --end,
  --},
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
      })
    end,
  },
  {
    "folke/neoconf.nvim",
  },
}
