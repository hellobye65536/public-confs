return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
	},
	{
		'pmizio/typescript-tools.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
		lazy = false,
		opts = {
			settings = {
				tsserver_plugins = {
					'styled-components',
				},
				code_lens = 'all',
			},
		},
	},
}
