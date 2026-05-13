local config = function()
	require('nvim-treesitter.configs').setup {
		sync_install = false,

		highlight = { enable = true },
		indent = { enable = true },
		playground = { enable = true },
		autotag = { enable = true },
		rainbow = { enable = true },

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
				},
			},
		},
	}
end

local dependencies = {
	'windwp/nvim-ts-autotag',
	'nvim-treesitter/nvim-treesitter-textobjects',
}

local spec = {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = dependencies,
		event = 'VeryLazy',
		config = config,
	},
	{
		'nvim-treesitter/playground',
		cmd = 'TSPlaygroundToggle',
	},
	{
		'HiPhish/rainbow-delimiters.nvim',
		event = 'VeryLazy',
		config = function()
			local rainbow_delimiters = require('rainbow-delimiters')
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
			}
		end
	},
}

for _, dep in ipairs(dependencies) do
	table.insert(spec, { dep })
end

return spec
