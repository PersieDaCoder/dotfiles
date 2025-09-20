return {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
        require("ayu").setup({
            mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
            overrides = {
                LineNr = { fg = "#7C8FA4" }, -- Brighter line numbers
                CursorLineNr = { fg = "#FFB454" }, -- Highlighted current line number
            }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
        })
        vim.cmd.colorscheme("ayu-dark")
    end,
}
