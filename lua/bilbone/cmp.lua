local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  -- 1. Snippet Engine (Required by cmp)
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  -- 2. Your custom keybindings for the menu
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- Ctrl + k to go UP
    ['<C-j>'] = cmp.mapping.select_next_item(), -- Ctrl + j to go DOWN
    ['<C-Space>'] = cmp.mapping.complete(),     -- Ctrl + Space to force menu open
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm selection
  }),
  
  -- 3. Where should the menu get its data?
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Get data from the Kotlin Language Server
    { name = 'luasnip' },  -- Get data from the snippet engine
  })
})
