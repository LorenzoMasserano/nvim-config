vim.g.mapleader = " "

-- Usa la clipboard di sistema per tutte le operazioni di copia/incolla
vim.opt.clipboard = "unnamedplus"

-- Normal & Visual mode: copia nella clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })

-- Normal & Visual mode: incolla dalla clipboard
vim.keymap.set({ "n", "v" }, "p", '"+p', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "P", '"+P', { noremap = true, silent = true })

-- Leader shortcut (opzionale): copia nella clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true })


-- Kotlin
-- Open the error message in a floating window
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Jump to the previous error in the file
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- Jump to the next error in the file
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- Optional: Make sure your leader key is the Spacebar (if you haven't already)
vim.g.mapleader = " "

-- Trigger the Code Action menu (The Neovim equivalent of Alt+Enter)
vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- Format the entire file using the LSP
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
end)

-- Telescope section
local telescope_ok, builtin = pcall(require, "telescope.builtin")
if telescope_ok then
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
else
    print("Telescope not found! Run :PackerSync")
end

-- Tree section
local tree_ok, nvim_tree = pcall(require, "nvim-tree")
if tree_ok then
    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvim_tree.setup({
        view = {
            width = 30,
            side = "left",
        },
        renderer = {
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
            },
        },
    })
    -- Shortcut to toggle the sidebar: Space + e
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
else
    print("Nvim-Tree not found! Run :PackerSync")
end

-- Recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  view = {
    width = 50,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
})

-- Shortcut to toggle the sidebar: Space + e
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

--Gitsigns
local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
    gitsigns.setup({
        current_line_blame = true,
    })
end

init_options = {
    storagePath = vim.fn.stdpath('data') .. '/kotlin-ls'
}
