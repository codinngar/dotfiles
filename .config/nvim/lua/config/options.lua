require("nvchad.options")

local o = vim.o

o.tabstop = 4
o.wrap = false
o.cmdheight = 0
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.relativenumber = true
o.cursorlineopt = "both"

-- enable clipboard for wsl
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}

vim.api.nvim_create_autocmd("BufDelete", {
	callback = function()
		local bufs = vim.t.bufs
		if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
			vim.cmd("Nvdash")
		end
	end,
})
