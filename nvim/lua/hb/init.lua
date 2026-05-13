---@param args {
---  [1]: string,
---  opts?: vim.keymap.set.Opts,
---  [string]: string | function,
---}
set = function(args)
	local lhs = args[1]
	local opts = args.opts
	local keymap = {
		ni = { 'n', 'i' },
		nv = { 'n', 'v' },
		iv = { 'i', 'v' },
		niv = { 'n', 'i', 'v' },
	}

	for k, v in pairs(args) do
		if k ~= 1 and k ~= 'opts' then
---@diagnostic disable-next-line: param-type-mismatch
			vim.keymap.set(keymap[k] or k, lhs, v, opts)
		end
	end
end

vim.g.mapleader = ' '

vim.opt.termguicolors = true
vim.g.moonflyVirtualTextColor = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = { a = true }

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.softtabstop = 0

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.scrolloff = 8

vim.opt.ignorecase = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.colorcolumn = '80,120'

-- unbinds
for _, key in ipairs({ 'f', 'b', 'd', 'u' }) do
	set { '<C-' .. key .. '>', n = '' }
end
set { '<S-Up>', niv = '' }
set { '<S-Down>', niv = '' }

-- binds
set { '<C-S-O>', n = '<C-I>' }

set { '<C-s>', niv = vim.cmd.write }
set { '<C-d>', ni = vim.cmd.delete }

set { '<M-Down>', n = '<CMD>move +1<CR>==', v = ":move '>+1<CR>gv=gv" }
set { '<M-Up>', n = '<CMD>move -2<CR>==', v = ":move '<-2<CR>gv=gv" }

set { '<C-M-Down>', n = '<CMD>copy +0<CR>' }
set { '<C-M-Up>', n = '<CMD>copy -1<CR>' }

set { '<Tab>', n = '>>', v = '>gv' }
set { '<S-Tab>', n = '<<', v = '<gv' }

set { '<C-_>', ni = '<CMD>Commentary<CR>', v = '<CMD>Commentary<CR>gv' }

set { '<Leader>b', n = '<CMD>NvimTreeToggle<CR>' }
set { '<Leader>e', n = '<CMD>Trouble diagnostics toggle<CR>' }
set { '<Leader>E', n = '<CMD>Trouble diagnostics toggle filter.buf=0<CR>' }

set { '<Leader>f', n = "gg=G''" }

vim.api.nvim_create_user_command('Prettier', '%!npx prettier --stdin-filepath \'%\'', {})

require('hb.lazy')
require('hb.lsp')
require('hb.telescope_action')

vim.cmd.colorscheme 'moonfly'
