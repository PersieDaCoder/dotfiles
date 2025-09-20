return {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {
        formatters_by_ft = {
            cs = { "csharpier", "organize_imports" },
            lua = { "stylua" },
            prisma = { "prisma-fmt" },
            sh = { "shfmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
        },
        formatters = {
            organize_imports = {
                command = "prettier",
                stdin = false,
            },
            prettier = {
                condition = function(self, ctx)
                    return vim.fs.find({
                        ".prettierrc",
                        ".prettierrc.json",
                        ".prettierrc.yml",
                        ".prettierrc.yaml",
                        ".prettierrc.json5",
                        ".prettierrc.js",
                        ".prettierrc.cjs",
                        ".prettierrc.mjs",
                        ".prettierrc.toml",
                        "prettier.config.js",
                        "prettier.config.cjs",
                        "prettier.config.mjs",
                    }, { path = ctx.filename, upward = true })[1]
                end,
            },
        },
    },
}
