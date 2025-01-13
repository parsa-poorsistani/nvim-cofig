return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,  -- This enables inline blame information
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',  -- Place blame text at end of line
        delay = 500,            -- Delay before blame information appears (in milliseconds)
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    })
  end
}
