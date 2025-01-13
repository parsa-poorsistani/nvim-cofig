return {
    "SmiteshP/nvim-navic",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        local navic = require("nvim-navic")
        navic.setup({
            highlight = true,
            lsp = {
                auto_attach = false,
            },
            click = true,
            separator = " > ",
        })
    end,
    lazy = false,
}
