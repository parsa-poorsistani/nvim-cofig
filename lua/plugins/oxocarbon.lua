return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  priority = 1000,  -- Setting this higher than rose-pine to ensure it can override when selected
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("oxocarbon")
    vim.api.nvim_set_hl(0, "Folded", {
        fg = "#f5ca45",
        bg = "#484848",
    })

    vim.api.nvim_set_hl(0, "Comment", {
      fg = "#4d8734",
      italic = true,
    })
    -- vim.cmd("colorscheme oxocarbon")
    -- Transparency, uncomment these lines:
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  end,
}
