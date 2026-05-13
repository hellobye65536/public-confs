return {
	-- Theme
	'bluz71/vim-moonfly-colors',

	-- nvim-tree
	{
		'nvim-tree/nvim-tree.lua',
		cmd = { 'NvimTreeOpen', 'NvimTreeToggle' },
		opts = {
			renderer = {
				group_empty = true,
			},
		},
	},

	-- mason
	{
		'williamboman/mason.nvim',
		build = ':MasonUpdate',
		lazy = false,
		config = true,
		priority = 51,
	},

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		event = 'VeryLazy',
		config = function()
			require('telescope').setup {}

			local builtin = require('telescope.builtin')
			require('telescope').load_extension('fzf')
			require('telescope').load_extension('ui-select')

			set { '<Leader>fb', n = builtin.buffers }
			set { '<Leader>ff', n = builtin.find_files }
			set { '<Leader>fg', n = builtin.live_grep }
		end,
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'nvim-telescope/telescope-ui-select.nvim',

	-- LuaSnip
	{
		'L3MON4D3/LuaSnip',
		version = '1.*',
		event = 'VeryLazy',
		config = function()
			require('luasnip').setup {
				enable_autosnippets = true,
				region_check_events = "CursorHold,InsertLeave,InsertEnter",
				delete_check_events = "TextChanged,InsertEnter",
			}
			require('luasnip.loaders.from_lua').lazy_load {
				paths = { './luasnippets' },
			}
		end
	},

	-- trouble
	{
		'folke/trouble.nvim',
		cmd = 'Trouble',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},

	-- Action plugins
	{ 'kylechui/nvim-surround',                   event = 'VeryLazy', config = true },
	{ 'tpope/vim-commentary',                     event = 'VeryLazy' },

	-- Misc plugins
	{ 'lukas-reineke/indent-blankline.nvim',      event = 'VeryLazy', main = 'ibl', config = true },
	{ 'nmac427/guess-indent.nvim',                lazy = false,       config = true },
	{ 'windwp/nvim-autopairs',
		event = 'VeryLazy',
		opts = {
			disable_filetype = { "TelescopePrompt", "spectre_panel", "racket" },
		},
	},
}
