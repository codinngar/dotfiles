return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                                       ",
			"                                                                       ",
			"                                                                       ",
			"                                                                       ",
			"                                                                     ",
			"       ████ ██████           █████      ██                     ",
			"      ███████████             █████                             ",
			"      █████████ ███████████████████ ███   ███████████   ",
			"     █████████  ███    █████████████ █████ ██████████████   ",
			"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
			"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
			" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
			"                                                                       ",
			"                                                                       ",
			"                                                                       ",
			"                                                                       ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New file", "<cmd>ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
