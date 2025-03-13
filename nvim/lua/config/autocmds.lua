local debounce_timer = vim.loop.new_timer()

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = { "*" },
    callback = function()
        vim.cmd("silent! w")
    end,
})

vim.api.nvim_create_autocmd("TextChanged", {
    pattern = { "*" },
    callback = function()
        if debounce_timer then
            debounce_timer:stop()
        end
        -- Start a new debounce timer (e.g., 300ms)
        debounce_timer:start(
            300,
            0,
            vim.schedule_wrap(function()
                vim.cmd("silent! w")
            end)
        )
    end,
})
