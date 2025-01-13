return {
    {
        'stevearc/conform.nvim',
        event = "BufWritePre",
        opts = {
            formatters_by_ft = {
                python = { 'autopep8' },
            },
            format_on_save = true,
        },
    },
    {
        'mfussenegger/nvim-lint',
        event = "BufReadPre",
        config = function()
            local lint = require('lint')
            lint.linters.flake8.args = {
                '--max-line-length=119',
                '--extend-ignore=E203',
                string.format('--config=~/.config/flake8', vim.fn.getcwd())
            }
            lint.linters_by_ft = {
                python = {'flake8'}
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    }
}
