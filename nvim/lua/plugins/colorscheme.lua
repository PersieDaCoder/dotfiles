return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                -- Enable transparent background
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
            vim.cmd([[colorscheme cyberdream]])
        end,
    },
}
