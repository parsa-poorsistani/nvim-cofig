local opts = {
  ensure_installed = {
    "efm",
		"bashls",
		"pyright",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"clangd",
    "gopls",
    "rust_analyzer",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  dependecies = "williamboman/mason.nvim"
}
