vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = { "*" },
    callback = function()
        vim.cmd("silent! w")
    end,
})
