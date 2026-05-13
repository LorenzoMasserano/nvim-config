-- Required modules (Required = Moduli richiesti)
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load snippets from friendly-snippets (Carica gli snippet da friendly-snippets)
-- This line loads all pre-defined snippets (Rust included)
require("luasnip.loaders.from_vscode").lazy_load()

-- Setup keymaps for LuaSnip (Imposta le mappature per LuaSnip)
-- These allow jumping between the tabstops/placeholders within the snippet
vim.keymap.set({"i", "s"}, "<C-j>", function()
	-- Expands the snippet or jumps to the next tabstop if possible
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		-- If not jumpable, do nothing (to avoid inserting characters)
		return ""
	end
end, { silent = true, noremap = true, expr = true, desc = "LuaSnip: Next Tabstop" })

vim.keymap.set({"i", "s"}, "<C-k>", function()
	-- Jumps to the previous tabstop
	if luasnip.jump_prev() then
		luasnip.jump_prev()
	end
end, { silent = true, noremap = true, desc = "LuaSnip: Previous Tabstop" })


-- Setup nvim-cmp (Configurazione di nvim-cmp)
cmp.setup({
    -- 1. Snippet integration (Integrazione Snippet)
    -- Tells nvim-cmp to use LuaSnip for expansion
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    
    -- 2. Define Completion Sources (Definisce le Sorgenti di Completamento)
    -- This defines where the suggestions come from
    sources = {
        -- Source for Language Server Protocol (rust-analyzer) suggestions
        { name = 'nvim_lsp' },
        -- Source for words in the current buffer
        { name = 'buffer' },
        -- Source for LuaSnip (CRITICAL for your Rust functions)
        { name = 'luasnip' },
    },

    -- 3. Key Mappings (Mappature dei Tasti)
    mapping = cmp.mapping.preset.insert({
        -- Accept the selected item (e.g., confirming the 'fn' snippet)
        ['<CR>'] = cmp.mapping.confirm({ select = true }), 
        
        -- Custom Tab mapping for smart navigation
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- When the menu is visible, select the next item
                cmp.select_next_item()
            elseif luasnip.expandable() or luasnip.jumpable() then
                -- If not visible, expand the current snippet or jump tabstop
                luasnip.expand_or_jump()
            else
                -- If nothing else applies, fall back to the default Tab behavior
                fallback()
            end
        end, { 'i', 's' }) -- Apply in Insert ('i') and Snippet ('s') modes
    })
})

-- NOTE: If you use the 'Tab' mapping above, you might prefer the 
-- smart 'Tab' over '<C-j>' for jumping. You can choose which one to keep.
