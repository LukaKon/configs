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


	-- lua functions that many plugins use
	-- use('nvim-lua/plenary.vim')

	-- colorscheme
	-- use("Shatur/neovim-ayu")
	use('ellisonleao/gruvbox.nvim')
	
	-- tmux & split window navigation
	use('christoomey/vim-tmux-navigator')
	
	-- maximize and restores current window
	use('szw/vim-maximizer')
	
	-- esential plugins
	use('tpope/vim-surround')
	use('vim-scripts/ReplaceWithRegister')
	
	-- commenting with gc
	use('numToStr/Comment.nvim')

	  -- file explorer
	  use('nvim-tree/nvim-tree.lua')

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- statusline
    use('nvim-lualine/lualine.nvim')

    -- fuzzy finding
    use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
    use({'nvim-telescope.nvim', branch = '0.1.x'})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
