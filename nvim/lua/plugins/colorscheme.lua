return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Enable transparent background
      saturation = 1,
      italic_comments = true,
      transparent = true,
      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
        snacks = true,
        -- ...
      },
    })
  end,
}
