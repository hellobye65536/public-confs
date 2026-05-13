---@param ev vim.api.keyset.create_autocmd.callback_args
local on_attach = function(ev)
	vim.api.nvim_set_option_value('omnifunc', '', { buf = ev.buf })
	local opts = { buffer = ev.buf }
	local set = function(args)
		if args.opts == nil then
			args.opts = opts
		end
		set(args)
	end

	set { '<M-CR>', nv = vim.lsp.buf.code_action }
	set { '<Leader> ', n = vim.lsp.buf.hover }
	set { '<Leader>lr', n = vim.lsp.buf.rename }
	set { '<Leader>ll', n = vim.lsp.codelens.run }
	set { '<Leader>lD', n = vim.lsp.buf.declaration }
	set { '<Leader>ld', n = vim.lsp.buf.definition }

	set { '<Leader>f', nv = function() vim.lsp.buf.format { async = true } end }
end

vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

vim.lsp.enable('lua_ls')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff')
vim.lsp.enable('eslint')
vim.lsp.enable('emmet_langauge_server')
