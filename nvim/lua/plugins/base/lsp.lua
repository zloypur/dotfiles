return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {}, version = "^1.0.0" },
			{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			"saghen/blink.cmp",

			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local clientCapabilities = vim.lsp.protocol.make_client_capabilities()

			local blink = require("blink.cmp")
			local capabilities = blink.get_lsp_capabilities(clientCapabilities)

			-- autoinstall of LSPs via mason-lspconfig is disabled in favor of installation
			-- via mason-tool-installer

			local on_attach = function(client, bufrn)
				local o = { noremap = true, silent = true }
				if client.supports_method("textDocument/codeAction") then
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, o)
				end
				if client.supports_method("textDocument/signatureHelp") then
					vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, o)
				end

				if client.supports_method("textDocument/typeDefinition") then
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, o)
				end
				if client.supports_method("typeHierarchy/subtypes") then
					vim.keymap.set("n", "gs", function(_)
						vim.lsp.buf.typehierarchy("subtypes")
					end, o)
				end
				if client.supports_method("typeHierarchy/supertypes") then
					vim.keymap.set("n", "gS", function(_)
						vim.lsp.buf.typehierarchy("supertypes")
					end, o)
				end
				-- following methods are managed via fzf-lua
				-- "textDocument/definition"
				-- "textDocument/references"
				-- "textDocument/implementation"
			end

			for server, serverOpts in pairs(opts.servers) do
				serverOpts.on_attach = on_attach
				serverOpts.capabilities = capabilities
				lspconfig[server].setup(serverOpts)
			end
		end,
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
	},
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		opts = {},
		keys = {
			{
				"<leader>cr",
				function()
					return ":IncRename "
				end,
				expr = true,
			},
			{
				"<leader>cn",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				expr = true,
			},
		},
		config = function(opts)
			require("inc_rename").setup(opts)
		end,
	},
}
