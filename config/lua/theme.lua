require("gitsigns").setup()
require("nvim-web-devicons").setup({ default = true })
require("indent_blankline").setup({})
require("colorizer").setup()

local banner = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	[[  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	[[  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
	[[]],
	[[]],
}

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = banner,
		week_header = {
			enable = false,
		},
		shortcut = {
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
		},
	},
})

vim.cmd.colorscheme("tokyonight-moon")
