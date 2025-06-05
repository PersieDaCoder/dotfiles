return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            cs = { "csharpier" },
            lua = { "stylua" },
            prisma = { "prisma-fmt" },
            sh = { "shfmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
        },
    },
}
