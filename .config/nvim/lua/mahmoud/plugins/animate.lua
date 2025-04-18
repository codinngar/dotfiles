return {
	"echasnovski/mini.animate",
	event = "VeryLazy",
	version = false,
	config = function()
		require("mini.animate").setup({
			cursor = {
				timing = require("mini.animate").gen_timing.linear({ duration = 10, unit = "total" }),
			},
			resize = {
				enable = false,
			},
		})
	end,
}
