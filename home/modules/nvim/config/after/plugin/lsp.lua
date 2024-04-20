require("neoconf").setup({
  -- override any of the default settings here
})

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "lua_ls",
  "vtsls",
  "rust_analyzer",
  "tailwindcss",
})

-- Fix Undefined global 'vim'
--lsp.configure("lua-language-server", {
  --settings = {
    --Lua = {
      --diagnostics = {
        --globals = { "vim" },
      --},
    --},
  --},
--})

lsp.configure("tailwindcss", {
  settings = {
    tailwindCSS = {
      -- add tailwind's class completion to vue's <Transition> attributes: enter-from-class, enter-to-class
      classAttributes = {
        "class",
        "className",
        "classList",
        "ngClass",
        "enter-from-class",
        "enter-to-class",
        "enter-active-class",
        "leave-active-class",
      },
    },
  },
})
local lspconfig = require("lspconfig")

lspconfig.dartls.setup {}

lspconfig.volar.setup {
  --filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  filetypes = {'javascriptreact', 'typescriptreact', 'vue', 'json'},
  settings = {
    typescript = {
      preferences = {
        -- "relative" | "non-relative" | "auto" | "shortest"(not sure)
        importModuleSpecifier = "non-relative"
      }
    }
  },
}

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    },
  },
})

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

--local ih = require("inlay-hints")

--require("rust-tools").setup({
  --tools = {
      --on_initialized = function()
          --print("Hello World");
          --ih.set_all()
      --end,
    --inlay_hints = {
      --auto = true, 
      --other_hints_prefix = " -> ",
    --}
  --}
--})


lspconfig.rust_analyzer.setup {
  tools = {
      --on_initialized = function()
          --print("Hello World");
          --ih.set_all()
      --end,
    inlay_hints = {
      auto = false,
      --show_parameter_hints = false,
      --parameter_hints_prefix = "",
      --other_hints_prefix = "",
    }

  }
}

local cmp = require("cmp")
local lspkind = require("lspkind")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  --["<Leader><Tab>"] = cmp.mapping.complete(),
  -- ["<C-Space>"] = cmp.mapping.complete(),
  --["<Tab>"] = cmp.mapping.confirm({ select = true }),
  ["<Tab>"] = cmp.mapping(function(callback)
    if cmp.visible() then 
      return cmp.confirm({ select = true })
    end 
    return cmp.complete()
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
})


cmp.setup({
  formatting = lspkind.cmp_format({
    mode = "symbol_text",
    menu = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
      --copilot = "[Copilot]",
    },
  }),
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
      col_offset = -8,
      side_padding = 0
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
      col_offset = 100,
      side_padding = 100,
    }),
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  experimental = { ghost_text = true },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "crates" },
    --{ name = "copilot" },
  }),
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  if client.server_capabilities.documentSymbolProvider then
    local navic = require("nvim-navic")
    navic.attach(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)
  --vim.keymap.set("n", "<leader>vrr", function()
    --vim.lsp.buf.references()
    --end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
  end)

  lsp.setup()

  vim.diagnostic.config({
    virtual_text = true,
  })

  -- formatting and linting on save
  -- taken from:
  --      https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
  --      https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
  --      https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md
  local null_ls = require("null-ls")
  local null_opts = lsp.build_options("null-ls", {})

  local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
      filter = function(client)
        -- apply whatever logic you want (in this example, we'll only use null-ls)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    })
  end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    on_attach = function(client, bufnr)
      null_opts.on_attach(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            --vim.lsp.buf.format({ bufnr = bufnr })
            --vim.lsp.buf.formatting_sync()
            lsp_formatting(bufnr)
          end,
        })
      end
    end,
    sources = {
      -- You can add tools not supported by mason.nvim
      null_ls.builtins.formatting.rome.with({
        fileypes = { ["vue"] = true, ["svelte"] = true },
      }),
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.clang_format,
    },
  })

  -- See mason-null-ls.nvim's documentation for more details:
  -- https://github.com/jay-babu/mason-null-ls.nvim#setup
  require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false, -- You can still set this to `true`
    automatic_setup = true,
  })

  -- Required when `automatic_setup` is true
  -- require("mason-null-ls").setup_handlers()
  --
--require("mason-lspconfig").setup_handlers({
  --function(server_name) 
    --print("hello we here")
    --local server_config = {}
    --if require("neoconf").get(server_name .. ".disable") then 
      --return 
    --end 
    --if server_name == "volar" then 
      --server_config.filetypes = { 'vue', 'typescript', 'javascript' }
    --end
    --lspconfig[server_name].setup(server_config)
  --end, 
--})
--require('mason-lspconfig').setup_handlers({
  --function(server_name)
    --local server_config = {}
    --if require("neoconf").get(server_name .. ".disable") then
      --print("We are definitely here")
      --return
    --end
    --if server_name == "volar" then
        --server_config.filetypes = { 'vue', 'typescript', 'javascript' }
    --end
    --lspconfig[server_name].setup(server_config)
  --end,
--})
