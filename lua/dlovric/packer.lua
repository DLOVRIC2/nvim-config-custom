-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope for fuzzy find and live grep
	use {
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Colorscheme for the nvim
	use { 
		'rose-pine/neovim', 
		as = 'rose-pine', 
		config = function()
			vim.cmd('colorscheme rose-pine') 
		end
	}

	-- Treesitter for syntax parsing
	use ( 
	'nvim-treesitter/nvim-treesitter',
	{run = ':TSUpdate'}
	)


	-- Harpoon for extra file navigation
	use 'ThePrimeagen/harpoon'


	-- Undo tree
	use 'mbbill/undotree'

end)
