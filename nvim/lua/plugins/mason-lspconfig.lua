return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            "jsonls",
            "lua_ls",
            "ts_ls",
            "tailwindcss",
        },
        automatic_installation = true,
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
    end,
}
