# vim: ft=lua
{ pkgs }: ''
  local dap = require("dap")
  local dapui = require("dapui")
  require("nvim-dap-virtual-text").setup({})

  -- TODO: This whole file will probably need to go in luanix

  dapui.setup({
  	mappings = {
  		open = { "zo" },
  		close = { "zc" },
  		remove = "d",
  		edit = "e",
  		repl = "r",
  		toggle = "t",
  	},
  	layouts = {
  		{
  			elements = {
  				-- Elements can be strings or table with id and size keys.
  				{ id = "scopes", size = 0.5 },
  				"breakpoints",
  				"watches",
  				"stacks",
  			},
  			size = 50, -- 50 columns
  			position = "left",
  		},
  		{
  			elements = {
  				"repl",
  				"console",
  			},
  			size = 0.25, -- 25% of total lines
  			position = "bottom",
  		},
  	},
  	controls = {
  		enabled = true,
  		elements = "repl",
  	},
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
  	dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
  	dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
  	dapui.close()
  end

  ---- Keybindings
  vim.api.nvim_set_keymap("n", "<Leader>D", ":lua require'dap'.run()<CR>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":lua require'dap'.terminate()<CR>", { noremap = true })

  vim.api.nvim_set_keymap("n", "<Up>", ":lua require'dap'.continue()<CR>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<Down>", ":lua require'dap'.step_over()<CR>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<Right>", ":lua require'dap'.step_into()<CR>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<Left>", ":lua require'dap'.step_out()<CR>", { noremap = true })

  vim.api.nvim_set_keymap("n", "<Leader>BB", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
  vim.api.nvim_set_keymap(
  	"n",
  	"<Leader>BC",
  	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  	{ noremap = true }
  )
  vim.api.nvim_set_keymap("n", "<Leader>rc", ":lua require'dap'.run_to_cursor()<CR>", { noremap = true })

  -- Golang
  -- TODO: Fix this command path + bring in dependency
  dap.adapters.delve = {
  	type = "server",
  	port = "''${port}",
  	executable = {
  		command = { "${pkgs.delve}/bin/dlv" },
  		args = { "dap", "-l", "127.0.0.1:''${port}" },
  	},
  }

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
  	{
  		type = "delve",
  		name = "Debug",
  		request = "launch",
  		program = "''${file}",
  	},
  	{
  		type = "delve",
  		name = "Debug test", -- configuration for debugging test files
  		request = "launch",
  		mode = "test",
  		program = "''${file}",
  	},
  	-- works with go.mod packages and sub packages
  	{
  		type = "delve",
  		name = "Debug test (go.mod)",
  		request = "launch",
  		mode = "test",
  		program = "./''${relativeFileDirname}",
  	},
  }

  -- Python
  -- TODO: Fix file paths
  dap.adapters.python = {
  	type = "executable",
  	command = { "${pkgs.python310Packages.debugpy}/venv/bin/python" },
  	args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
  	{
  		-- The first three options are required by nvim-dap
  		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
  		request = "launch",
  		name = "Launch file",

  		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

  		program = "''${file}", -- This configuration will launch the current file if used.
  		pythonPath = function()
  			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
  			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
  			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
  			local cwd = vim.fn.getcwd()
  			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
  				return cwd .. "/venv/bin/python"
  			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
  				return cwd .. "/.venv/bin/python"
  			else
  				return "/usr/bin/python"
  			end
  		end,
  	},
  }

  -- Node
  -- TODO: Fix file paths + Work this out
  dap.adapters.node2 = {
  	type = "executable",
  	command = "node",
  	-- Assuming this is installed via Mason
  	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
  }

  -- dap.adapters.firefox = {
  -- 	type = "executable",
  -- 	command = "node",
  -- 	-- Assuming this is installed via Mason
  -- 	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js" },
  -- }

  dap.configurations.typescript = {
  	{
  		name = "Attach to process",
  		type = "node2",
  		request = "attach",
  		processId = require("dap.utils").pick_process,
  	},
  	-- {
  	-- 	name = "Debug with Firefox",
  	-- 	type = "firefox",
  	-- 	request = "launch",
  	-- 	reAttach = true,
  	-- 	url = "http://localhost:4200",
  	-- 	webRoot = "''${workspaceFolder}",
  	-- 	firefoxExecutable = "/usr/bin/firefox",
  	-- },
  }

  -- dotNet
  -- TODO: fix file path
  dap.adapters.coreclr = {
  	type = "executable",
  	command = { "${pkgs.netcoredbg}/bin/netcoredbg" },
  	args = { "--interpreter=vscode" },
  }

  dap.configurations.cs = {
  	{
  		type = "coreclr",
  		name = "launch - netcoredbg",
  		request = "launch",
  		program = function()
  			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
  		end,
  	},
  }

  -- Rust
''
