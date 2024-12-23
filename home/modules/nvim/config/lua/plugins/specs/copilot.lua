
return {
  {
    'zbirenbaum/copilot.lua',
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require('copilot').setup({
        suggestion = { 
          enabled = true, 
          auto_trigger = true,
          keymap = {
            accept = "<S-RIGHT>",
            next = "<S-DOWN>",
            prev = "<S-UP>"
          }
        },
        panel = { enabled = true, auto_refresh = true },
        filetypes = { typescript = true },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup();
    end,
  },
}
