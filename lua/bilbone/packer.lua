-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Impostazioni colore e terminale
vim.opt.termguicolors = true

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
  
  --Add the LSP config plugin
  use 'neovim/nvim-lspconfig'

  -- The Autocomplete Engine
  use 'hrsh7th/nvim-cmp'
  
  -- The bridge connecting Autocomplete to LSP
  use 'hrsh7th/cmp-nvim-lsp'
  
  -- The Snippet Engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  --Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = { { 'nvim-lua/plenary.nvim' } },
	}

  -- File explorer sidebar
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  
  --Tpope
  use 'tpope/vim-fugitive'

  --Gitsigns
  use 'lewis6991/gitsigns.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					"lua", "vim", "bash", "json", "yaml", "dart", "rust",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			}
		end,
	}

	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				integrations = {
					treesitter = true,
					telescope = true,
					nvimtree = true,
				},
				custom_highlights = function(colors)
					return {
						LineNr = { fg = "#7aa2f7", bg = "none" },
						CursorLineNr = { fg = "#ff9e64", bg = "none", bold = true },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	}
	use 'hrsh7th/nvim-cmp'          -- nvim-cmp
	use 'L3MON4D3/LuaSnip'          -- LuaSnip
	use 'saadparwaiz1/cmp_luasnip'  -- Connettore tra nvim-cmp e LuaSnip
	use 'rafamadriz/friendly-snippets' -- I modelli di codice (Snippet) per Rust, ecc.

	require('bilbone.snip')
end)

