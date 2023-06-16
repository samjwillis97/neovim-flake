# vim: ft=lua
{ pkgs }: ''
  local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
      -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
      -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
      -- vim.keymap.set("n", "<space>wl", function()
      -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, bufopts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
      -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<space>a", ":CodeActionMenu<CR>", bufopts)
      vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
  end

  local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
  }

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require'lspconfig'.elixirls.setup({
      cmd = { "${pkgs.elixir-ls}/lib/language_server.sh" },
	  on_attach = on_attach,
	  flags = lsp_flags,
	  capabilities = capabilities,
  })
''
