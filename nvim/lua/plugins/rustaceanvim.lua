return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.keymap.set("n", "<C-a>", "<Plug>RustHoverAction")
	end,
}
