local M = {}

M.get_winbar = function()
    if vim.bo.filetype == "NvimTree" then
        return ""
    end
    local navic = require("nvim-navic")
    if navic.is_available() then
        return navic.get_location()
    else
        return ""
    end
end

return M
