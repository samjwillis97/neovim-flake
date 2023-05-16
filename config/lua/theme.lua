require("gitsigns").setup()
require("nvim-web-devicons").setup({ default = true })
require("indent_blankline").setup({})
require("colorizer").setup()
require("mini")
require("mini.base16").setup({
	palette = {
		base00 = os.getenv("BASE_00"),
		base01 = os.getenv("BASE_01"),
		base02 = os.getenv("BASE_02"),
		base03 = os.getenv("BASE_03"),
		base04 = os.getenv("BASE_04"),
		base05 = os.getenv("BASE_05"),
		base06 = os.getenv("BASE_06"),
		base07 = os.getenv("BASE_07"),
		base08 = os.getenv("BASE_08"),
		base09 = os.getenv("BASE_09"),
		base0A = os.getenv("BASE_0A"),
		base0B = os.getenv("BASE_0B"),
		base0C = os.getenv("BASE_0C"),
		base0D = os.getenv("BASE_0D"),
		base0E = os.getenv("BASE_0E"),
		base0F = os.getenv("BASE_0F"),
	},
	use_cterm = true,
})

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

vim.cmd.colorscheme("gruvbox")
