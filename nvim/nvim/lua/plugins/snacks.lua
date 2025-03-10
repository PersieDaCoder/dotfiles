return {
  "folke/snacks.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("snacks").setup({
      -- these are the default options
      telescope = {
        defaults = {
          -- `file_ignore_patterns` will be appended to the list of
          -- patterns in telescope's config.
          file_ignore_patterns = {},
        },
      },
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
      terminal = {
        win = {
          position = "float",
        },
      },
      -- these are the default options
      plugins = {
  -- stylua: ignore
  ["null-ls"] = { -- stylua: line_length=999
  "null-ls.builtins.code_actions.stylua",
  "null-ls.builtins.formatting.stylua",
  "null-ls.builtins.diagnostics.eslint_d",
  "null-ls.builtins.formatting.eslint_d",
  "null-ls.builtins.code_actions.eslint_d",
  },
  -- stylua: ignore
  mason = { -- stylua: line_length=999
  "mason.lspconfig.lua_ls",
  "mason.lspconfig.eslint_d",
  "mason.lspconfig.stylua",
  "mason.packages.eslint_d",
  "mason.packages.stylua",
  "mason.packages.lua_language_server",
  },
  -- stylua: ignore
  lspconfig = { -- stylua: line_length=999
  "lspconfig.lua_ls.setup",
  "lspconfig.eslint_d.setup",
  },
  -- stylua: ignore
  nvim_tree = { -- stylua: line_length=999
  "nvim-tree.setup",
  },
  -- stylua: ignore
  cmp = { -- stylua: line_length=999
  "cmp.setup",
  "cmp.mapping",
  "cmp.sources",
  "luasnip.require",
  },
  -- stylua: ignore
  telescope = { -- stylua: line_length=999
  "telescope.load_extension",
  },
  -- stylua: ignore
  bufferline = { -- stylua: line_length=999
  "bufferline.setup",
  },
  -- stylua: ignore
  lualine = { -- stylua: line_length=999
  "lualine.setup",
  },
  -- stylua: ignore
  indent_blankline = { -- stylua: line_length=999
  "indent_blankline.setup",
  },
  -- stylua: ignore
  which_key = { -- stylua: line_length=999
  "which-key.setup",
  },
  -- stylua: ignore
  catppuccin = { -- stylua: line_length=999
  "catppuccin.setup",
  },
  -- stylua: ignore
  nvim_cmp = { -- stylua: line_length=999
  "require",
  },
  -- stylua: ignore
  mini = { -- stylua: line_length=999
  "mini.ai.setup",
  "mini.comment.setup",
  "mini.pairs.setup",
  "mini.surround.setup",
  "mini.starter.setup",
  "mini.statusline.setup",
  "mini.trailspace.setup",
  },
  -- stylua: ignore
  leap = { -- stylua: line_length=999
  "leap.set_default_keymaps",
  "leap.add_repeat_mappings",
  "leap.setup",
  },
  -- stylua: ignore
  harpoon = { -- stylua: line_length=999
  "harpoon.setup",
  },
  -- stylua: ignore
  nvim_navic = { -- stylua: line_length=999
  "nvim-navic.attach",
  },
      },
    })
  end,
}
