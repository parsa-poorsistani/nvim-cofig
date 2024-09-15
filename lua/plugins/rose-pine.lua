return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 999,
  config = function()
    require("rose-pine").setup({
      variant = "auto",  -- Set variant to auto, can be changed to main, moon, or dawn
      dark_variant = "moon",  -- Set the dark variant theme (main, moon, dawn)
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options
      },

      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {
        -- Optional: Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
      },

      highlight_groups = {
        -- Customize highlight groups if needed
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Optional: Modify highlights before applying them
        -- Example: Disable undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
      end,
    })

    vim.cmd("colorscheme rose-pine")
  end
}

