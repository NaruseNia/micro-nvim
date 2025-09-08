require("blink-cmp").setup {
  completion = {
    documentation = {
      auto_show = true
    },
    menu = {
      draw = {
        -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
        columns = { { "label", "label_description", gap = 1 }, { "kind", gap = 1 }, { "source_name" } },
      },
    }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  snippets = { preset = "luasnip" },
  fuzzy = {
    implementation = "prefer_rust",
  },
  keymap = {
    -- set to 'none' to disable the 'default' preset
    preset = 'enter',

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },

    -- disable a keymap from the preset
    ['<C-e>'] = false, -- or {}

    -- show with a list of providers
    ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
  },
}
