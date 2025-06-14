return {
    "williamboman/mason.nvim",
    priority = 1000,
    opts = {
        ensure_installed = {
            -- LSP servers
            "csharp-language-server",
            "lua-language-server",
            "prisma-language-server",
            "tailwindcss-language-server",
            "typescript-language-server",

            -- Formatters and tools
            "csharpier",
            "shfmt",
            "stylua",
            "prettier",
        },
    },
}
