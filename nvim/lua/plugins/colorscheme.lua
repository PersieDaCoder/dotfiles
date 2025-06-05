return {
    "ellisonleao/gruvbox.nvim",
    config = function()
        require("gruvbox").setup({
            bold = true,
            contrast = "hard",
            transparent_mode = true,
        })
    end,
}
