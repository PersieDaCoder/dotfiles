return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            -- LSP servers
            "csharp-language-server",
            "lua-language-server",
            "prisma-language-server",
            "tailwindcss-language-server",
            "vtsls",

            -- Formatters and tools
            "csharpier",
            "shfmt",
            "stylua",
            "prettier",
            "js-debug-adapter", -- for JavaScript/TypeScript DAP
        },
    },
}
