-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end


-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

  -- configuring lsp servers
  use({
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }
  ) -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({'glepnir/lspsaga.nvim', branch = 'main'})
  use('jose-elias-alvarez/typescript.nvim')
  use('onsails/lspkind.nvim')

  -- formatting and linting
  use({
    'jose-elias-alvarez/null-ls.nvim',
    -- config = function()
    --   require('null-ls').setup()
    -- end,
    require = {'nvim-lua/plenary.nvim'},
})
  use('jayp0521/mason-null-ls.nvim')

  -- treesitter
  use({ -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({with_sync = true})
    end,
  })

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

	-- lua functions that many plugins use
	use('nvim-lua/plenary.nvim')

	-- colorscheme
  use('EdenEast/nightfox.nvim')

	-- tmux & split window navigation
	use('christoomey/vim-tmux-navigator')

	-- maximize and restores current window
	use('szw/vim-maximizer')

	-- esential plugins
	use('tpope/vim-surround')
	use('vim-scripts/ReplaceWithRegister')

	-- commenting with gc
	use('numToStr/Comment.nvim')

  -- colorizer
  use('NvChad/nvim-colorizer.lua')

  -- file explorer with icons
  use({
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons'},
  })

  -- icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use('nvim-lualine/lualine.nvim')

  -- whichkey
  use('folke/which-key.nvim')

  -- fuzzy finding
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }})

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  -- use('hrsh7th/cmp-cmdline')

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- auto closing
  use({'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end })
  use('windwp/nvim-ts-autotag')

  -- git signs plugin
  use('lewis6991/gitsigns.nvim')

  -- Add indentation guides even on blank lines
  use('lukas-reineke/indent-blankline.nvim')

  -- terminal
  use({"akinsho/toggleterm.nvim",
        tag = '*', config = function()
        require('toggleterm').setup()
      end
  })

  -- folding
  -- use({'anuvyklack/pretty-fold.nvim'})

  use({
      "jiaoshijie/undotree",
      requires = {
        "nvim-lua/plenary.nvim",
      },
  })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
