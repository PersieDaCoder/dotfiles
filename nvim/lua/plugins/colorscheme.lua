return {
    {
        "datsfilipe/vesper.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vesper").setup({
                transparent = true, -- Boolean: Sets the background to transparent
                italics = {
                    comments = true, -- Boolean: Italicizes comments
                    keywords = false, -- Boolean: Italicizes keywords
                    functions = false, -- Boolean: Italicizes functions
                    strings = true, -- Boolean: Italicizes strings
                    variables = false, -- Boolean: Italicizes variables
                },
                overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
                palette_overrides = {},
            })
            vim.cmd([[colorscheme vesper]])
        end,
    },
}
