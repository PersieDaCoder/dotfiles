return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

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
            layout = {
              layout = {
                position = "float",
                relative = "editor",
                width = math.floor(vim.o.columns * 0.5), -- 50% of screen width
                height = math.floor(vim.o.lines * 0.5),  -- 50% of screen height
                row = math.floor(vim.o.lines * 0.25),    -- center vertically
                col = math.floor(vim.o.columns * 0.25),  -- center horizontally
                style = "minimal",
                border = "rounded",
              }
            },
          },
        },
      },
      terminal = {
        win = {
          position = "float",
        },
      },
      dashboard = {
        width = 60,
        row = nil,                                                                   -- dashboard position. nil for center
        col = nil,                                                                   -- dashboard position. nil for center
        pane_gap = 4,                                                                -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = "󰒲 ",
              key = "L",
              desc = "Lazy",
              action = ":Lazy",
              enabled = package.loaded.lazy ~= nil,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          -- Used by the `header` section
          header = [[
░▄▀▀▄░█▀▀░█▀▀▄░█▀▀░░▀░░█▀▀░█▀▄░█▀▀▄░█▀▄░▄▀▀▄░█▀▄░█▀▀░█▀▀▄
░█▄▄█░█▀▀░█▄▄▀░▀▀▄░░█▀░█▀▀░█░█░█▄▄█░█░░░█░░█░█░█░█▀▀░█▄▄▀
░█░░░░▀▀▀░▀░▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀░░▀░▀▀▀░░▀▀░░▀▀░░▀▀▀░▀░▀▀
]],
        },
        -- item field formatters
        formats = {
          icon = function(item)
            if item.file and item.icon == "file" or item.icon == "directory" then
              return M.icon(item.file, item.icon)
            end
            return { item.icon, width = 2, hl = "icon" }
          end,
          footer = { "%s", align = "center" },
          header = { "%s", align = "center" },
          file = function(item, ctx)
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > ctx.width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(ctx.width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
                or { { fname, hl = "file" } }
          end,
        },
        sections = {
          { section = "header", align = "center" },
          {
            pane = 2,
            { section = "keys",   gap = 1, padding = 1 },
            { section = "startup" },
          },
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
