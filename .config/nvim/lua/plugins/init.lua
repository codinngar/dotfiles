return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"cpp",
				"java",
			},
		},
	},

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()

			local servers = { "lua_ls", "clangd", "jdtls" }
			vim.lsp.enable(servers)
		end,
	},

	-- formatters
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				java = { "jdtls" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	-- dressing
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				direction = "vertical",
				size = 50,
			})

			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm size=15 direction=horizontal<cr>",
				{ silent = true, desc = "Toggle horizontal terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tv",
				"<cmd>ToggleTerm size=50 direction=vertical<cr>",
				{ silent = true, desc = "Toggle vertical terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<cr>",
				{ silent = true, desc = "Toggle vertical terminal" }
			)

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
		end,
	},
}
