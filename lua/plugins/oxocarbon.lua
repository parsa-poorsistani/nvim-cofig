return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = true,  -- We set this to true since we don't need it loaded immediately
  priority = 1000,  -- Setting this higher than rose-pine to ensure it can override when selected
  config = function()
    -- This function will be called when the plugin is loaded
    vim.opt.background = "dark"  -- You can adjust this to "light" if you prefer
    -- vim.cmd.colorscheme("oxocarbon")
    vim.cmd("colorscheme oxocarbon")
    -- If you want transparency, uncomment these lines:
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  end,
}
