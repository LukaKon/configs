local setup, null_ls = pcall(require, "null-ls")
if not setup then
	print("null-ls not found...")
	return
end

local eslint_setup, eslint = pcall(require, "eslint")
if not eslint_setup then
	print("eslint not found")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

local sources = {
	-- formatting.prettier.with({ extra_args = {}}),
	formatting.prettier,
	formatting.stylua,
	diagnostics.eslint_d,
	formatting.autopep8,
	diagnostics.fish,
	-- diagnostics.flake8,
	diagnostics.pylint,
	formatting.isort,
	formatting.taplo,
	diagnostics.hadolint,
	diagnostics.yamllint,
	diagnostics.gitlint,
	-- formatting.rustfmt,
	formatting.astyle,
	diagnostics.luacheck,

	-- completion.luasnip,
}

-- to setup format on save
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- vim.lsp.buf.format({ bufnr = bufnr })
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	-- configure format on save
	on_attach = on_attach,
})

eslint.setup({
	bin = "eslint_d", -- or `eslint`
	code_actions = {
		enable = true,
		apply_on_save = {
			enable = true,
			types = { "directive", "problem", "suggestion", "layout" },
		},
		disable_rule_comment = {
			enable = true,
			location = "same_line", -- "separate_line", -- or `same_line`
		},
	},
	diagnostics = {
		enable = true,
		report_unused_disable_directives = false,
		run_on = "type", -- or `save`
	},
})
