-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",
}

M.nvdash = {
	load_on_startup = true,
}

M.ui = {
	telescope = {
		style = "bordered",
	},
}

return M
