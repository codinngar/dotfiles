return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		require("blink-cmp").setup({
			completion = {
				ghost_text = { enabled = true },
			},
			keymap = {
				["<C-space>"] = { "show" },
				["<C-j>"] = { "select_next" },
				["<C-k>"] = { "select_prev" },
				["<C-l>"] = { "show_documentation" },
				["<C-h>"] = { "hide_documentation" },
				["<cr>"] = { "select_and_accept", "fallback" },
			},
		})
	end,
}
