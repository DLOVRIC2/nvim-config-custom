-- TO RUN THIS FILE DO THE FOLLOWING:
-- :so
-- :PackerSync


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

	
	-- Git
	use 'tpope/vim-fugitive'

    -- FML hahah
    use 'eandrju/cellular-automaton.nvim'


    -- Zen mode
    use 'folke/zen-mode.nvim' 


    -- Autotag for js,ts,html
    use 'windwp/nvim-ts-autotag'


    -- Autopair for brackets
    use 'windwp/nvim-autopairs'

    -- Comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Prettier formatting
    use('MunifTanjim/prettier.nvim')
    -- Null-ls required for prettier to work. Note since null-ls is archived, this is the same but community
    -- maintained version.
    -- use('nvimtools/none-ls.nvim')

	-- LSP setup
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}


    -- DAP setup -- might need to move some of this setup to individual files.
    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }


    use {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    args = {"--no-cov"}
                },
            }
        end
    }

    use {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        requires = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    }

    -- Jupyter notebook in nvim 
    -- The UpdateRmotePlugins is actually not ran on startup, so make sure to run that command before you can use it.
    -- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

    -- Image support (also for jupyter notebooks)
    -- use {'edluffy/hologram.nvim'}


    -- Something that if not installed its causing an error:
    use { "nvim-neotest/nvim-nio" }


    -- File tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }


end)
