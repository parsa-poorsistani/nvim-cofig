--return {
--	"EdenEast/nightfox.nvim",
--	lazy = false,
--	priority = 999,
--	config = function()
--		vim.cmd('colorscheme nightfox')
--	end
--}
return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 999,
  config = function ()
    require('kanagawa').setup({
    compile = false,
    undercurl = true,
    statementStyle = { bold = true },
    transparent = false,
    dimInactive = false,
    colors = {
        palette = {
          sumiInk0 = "#16161D" -- Setting the dark background color
        },
        theme = {
            wave = {
                ui = {
                    bg = "#000000",  -- sumiInk0 Dark background color
                    bg_m3      = "#16161D"
                },
            },
        },
        -- Customize theme colors if needed
      },
--    overrides = function(colors)
--        return {
--          -- example customization: making comments italic and yellow
--          Comment = { fg = colors.palette.katanaGray, bg = "none", "italic" },
--          -- other customizations...
--        }
--      end,

      -- Set background theme to "wave", or another theme if preferred
      --theme = colors.theme,
      -- Set background darkness (this line is optional)
      --background = "dark",
    })
    vim.cmd("colorscheme kanagawa")
  end
}
