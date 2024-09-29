vim.diagnostic.config({
  virtual_text = false,  -- Disable virtual text if you don't want inline errors
  signs = true,          -- Keep showing diagnostic signs in the gutter
  underline = true,
  update_in_insert = false, -- Do not update diagnostics while typing
  severity_sort = true,      -- Sort diagnostics by severity

  -- Floating window configuration
  float = {
    show_header = true,
    source = "always",   -- Show the source of the diagnostic
    border = "rounded",  -- Rounded border for the floating window
    focusable = false,   -- Do not allow focus on the floating window
    prefix = function(diagnostic)
      local diag_to_prefix = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "💡",
      }
      return string.format(" %s ", diag_to_prefix[diagnostic.severity])
    end,
  },
})



local on_attach = require("util.lsp").on_attach
--local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

    -- ansiblels setup
    lspconfig.ansiblels.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "yaml", "yml" },  -- Assuming Ansible uses YAML
        settings = {
            ansible = {
                ansible = {
                    path = "ansible",  -- Path to ansible executable
                },
                ansibleLint = {
                    enabled = true,
                    path = "ansible-lint",  -- Path to ansible-lint executable
                },
                python = {
                    interpreterPath = "python",  -- Path to Python interpreter
                },
            },
        },
    })

 -- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	})

  --Docker-file
  lspconfig.dockerls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "/usr/local/bin/docker-langserver" }
  })
  -- YAML
  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        schemas = {
          kubernetes = "*.yaml",
          -- Add other schemas as needed
        },
        validate = true,
        hover = true,
        completion = true,
      },
    },
    filetypes = {"yaml", "yml"},
  })

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

  -- go
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
  })
	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})

	-- docker
	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- C/C++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

  -- python --
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  })


  -- Rust
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"rust"},
    settings = {
      ["rust_analyzer"] = {
        autoimport = {
          enable = true
        },
        cargo = {
          loadOutDirsFromCheck = true,
          allFeatures = true,
        },
        procMacro = {
          enable = true
        },
        inlayHints = {
          auto = true,
          enable = true,
          chainingHints = true,
          parameterHints = true,
          typeHints = true,
        },
        runnables = {
          useCargoEnv = true,
          use_telescope = true,
        }
      }
    }
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })

 	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local hadolint = require("efmls-configs.linters.hadolint")
	local solhint = require("efmls-configs.linters.solhint")
  --local cpplint = require("efmls-configs.linters.cpplint")
	local clangformat = require("efmls-configs.formatters.clang_format")
  local yaml_lint = {
    lintCommand = 'yamllint -f parsable -',
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'}
  }

  local prettier = {
    formatCommand = 'prettier --stdin-filepath ${INPUT}',
    formatStdin = true
  }
	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"json",
			"jsonc",
			"sh",
			"javascript",
			"markdown",
			"docker",
			"c",
			"cpp",
      "yaml",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				sh = { shellcheck, shfmt },
				javascript = { eslint_d, prettier_d },
				markdown = { prettier_d },
				docker = { hadolint, prettier_d },
				c = { clangformat },
				cpp = { clangformat },
        yaml = {yaml_lint, prettier},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
