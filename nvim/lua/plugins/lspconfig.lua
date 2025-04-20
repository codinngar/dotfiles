return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- setup nvim-java plugin
		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})

		-- setup jdtls
		lspconfig.jdtls.setup({
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/usr/lib/jvm/java-21-openjdk",
								default = true,
							},
						},
					},
				},
			},
		})

		-- setup default capabilities insetead of java because it's handled by nvim-java plugin
		mason_lspconfig.setup_handlers({
			function(server_name)
				if server_name ~= "jdtls" then
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end
			end,
		})
	end,
}
