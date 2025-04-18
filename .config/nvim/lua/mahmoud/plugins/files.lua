return {
	"echasnovski/mini.files",
	event = "VeryLazy",
	version = false,
	config = function()
		require("mini.files").setup()
		vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { silent = true, desc = "Explorer" })
	end,
}
