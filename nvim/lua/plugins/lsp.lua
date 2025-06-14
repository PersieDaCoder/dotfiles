return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      require("mason-lspconfig").setup({
        automatic_enable = {},
      }),
      setup = {
        -- Remove the OmniSharp setup function
        -- omnisharp = function(_, opts)
        --     -- ... your OmniSharp setup logic ...
        --     return true
        -- end,

        -- 🔵 C# via csharp_ls setup function
        csharp_language_server = function(_, opts)
          -- csharp_ls typically requires less complex setup than OmniSharp
          -- It usually works well with default settings.

          -- You can customize options here if needed.
          -- Refer to the csharp_ls documentation for available options.
          -- Example (these might not be necessary as defaults are often fine):
          -- opts.formatting = {
          --     editorconfig = true,
          --     newLine = "\n",
          --     useSpaces = true,
          --     tabSize = 4,
          --     indentationSize = 4,
          -- }

          -- Setup capabilities (for nvim-cmp, snippets, etc.)
          -- This part is similar to OmniSharp setup
          opts.capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            opts.capabilities or {}
          )
          opts.capabilities.textDocument.completion.completionItem.snippetSupport = true

          -- on_attach function for csharp_ls
          opts.on_attach = function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- Set up LSP keymaps (can be the same as your OmniSharp ones)
            map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
            map("n", "gr", vim.lsp.buf.references, "Find References")
            map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
            map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
            map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
            map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
            map("n", "<leader>f", function()
              vim.lsp.buf.format()               -- Asynchronous formatting is default
            end, "Format Document")

            -- Add other desired on_attach logic here
          end

          -- nvim-lspconfig will handle calling lspconfig.csharp_ls.setup(opts)
          return true
        end,

        -- Example for other servers if they needed custom setup:
        -- lua_ls = function(_, opts)
        --     -- custom lua_ls setup if any
        --     return true
        -- end
      },
      -- Global on_attach (optional, see previous explanation)
      on_attach = function(client, bufnr)
        -- Global LSP setup that applies to all attached servers
        -- (e.g., diagnostic signs, general keymaps if not server-specific)
      end,
    },
  },
}
