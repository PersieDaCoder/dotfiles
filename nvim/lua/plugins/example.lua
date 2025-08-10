-- Enable nvim-cmp for better C# completion
-- stylua: ignore
if false then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Source for LSP completions
            "hrsh7th/cmp-buffer", -- Source for buffer completions
            "hrsh7th/cmp-path", -- Source for path completions
            "hrsh7th/cmp-cmdline", -- Source for command line completions
            "hrsh7th/cmp-emoji", -- Source for emoji completions (optional)
            -- If you use a snippet engine like luasnip, add its cmp source here
            -- "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
            local cmp = require("cmp")

            -- Configure sources - the order matters for suggestion priority
            opts.sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP completion source (crucial for auto-imports)
                { name = "buffer" }, -- Completions from current buffer words
                { name = "path" }, -- File path completions
                -- If you added cmp-emoji dependency:
                { name = "emoji" },
                -- If you added a snippet source:
                -- { name = "luasnip" },
            }, {
                -- Fallback sources if the above don't provide completions
                { name = "buffer" },
            })

            -- Configure completion behavior (mappings, window appearance, etc.)
            opts.completion = {
                completeopt = "menu,menuone,preview,noselect",
            }

            opts.mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
                ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item
            })

            -- Optional: configure completion and documentation windows
            opts.window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }

            -- Optional: configure snippets if you use a snippet engine
            -- opts.snippet = {
            --   expand = function(args)
            --     require("luasnip").lsp_expand(args.body)
            --   end,
            -- },

            -- Configure command line completion (optional)
            -- cmp.setup.cmdline(':', {
            --   sources = cmp.config.sources({
            --     { name = 'cmdline' }
            --   })
            -- })
        end,
    },
    {
        "saghen/blink.cmp",
        lazy = true,
        version = not vim.g.lazyvim_blink_main and "*",
        build = vim.g.lazyvim_blink_main and "cargo build --release",
        opts_extend = {
            "sources.completion.enabled_providers",
            "sources.compat",
            "sources.default",
        },
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- add blink.compat to dependencies
            {
                "saghen/blink.compat",
                optional = true, -- make optional so it's only enabled if any extras need it
                opts = {},
                version = not vim.g.lazyvim_blink_main and "*",
            },
        },
        event = "InsertEnter",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            snippets = {
                expand = function(snippet, _)
                    return LazyVim.cmp.expand(snippet)
                end,
            },
            appearance = {
                -- sets the fallback highlight groups to nvim-cmp's highlight groups
                -- useful for when your theme doesn't support blink.cmp
                -- will be removed in a future release, assuming themes add support
                use_nvim_cmp_as_default = false,
                -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },
            completion = {
                accept = {
                    -- experimental auto-brackets support
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
                ghost_text = {
                    enabled = vim.g.ai_cmp,
                },
            },

            -- experimental signature help support
            -- signature = { enabled = true },

            sources = {
                -- adding any nvim-cmp sources here will enable them
                -- with blink.compat
                compat = {},
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = {
                        -- Enable auto-import completions for C#
                        transform_items = function(_, items)
                            -- Mark items that would trigger auto-imports
                            for _, item in ipairs(items) do
                                if item.additionalTextEdits then
                                    item.labelDetails = item.labelDetails or {}
                                    item.labelDetails.description = (item.labelDetails.description or "") .. " (auto-import)"
                                end
                            end
                            return items
                        end,
                    },
                },
            },

            cmdline = {
                enabled = false,
            },

            keymap = {
                preset = "enter",
                ["<C-y>"] = { "select_and_accept" },
            },
        },
        ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
        config = function(_, opts)
            -- setup compat sources
            local enabled = opts.sources.default
            for _, source in ipairs(opts.sources.compat or {}) do
                opts.sources.providers[source] = vim.tbl_deep_extend(
                    "force",
                    { name = source, module = "blink.compat.source" },
                    opts.sources.providers[source] or {}
                )
                if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
                    table.insert(enabled, source)
                end
            end

            -- add ai_accept to <Tab> key
            if not opts.keymap["<Tab>"] then
                if opts.keymap.preset == "super-tab" then -- super-tab
                    opts.keymap["<Tab>"] = {
                        require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
                        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                        "fallback",
                    }
                else -- other presets
                    opts.keymap["<Tab>"] = {
                        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                        "fallback",
                    }
                end
            end

            -- Unset custom prop to pass blink.cmp validation
            opts.sources.compat = nil

            -- check if we need to override symbol kinds
            for _, provider in pairs(opts.sources.providers or {}) do
                ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
                if provider.kind then
                    local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                    local kind_idx = #CompletionItemKind + 1

                    CompletionItemKind[kind_idx] = provider.kind
                    ---@diagnostic disable-next-line: no-unknown
                    CompletionItemKind[provider.kind] = kind_idx

                    ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
                    local transform_items = provider.transform_items
                    ---@param ctx blink.cmp.Context
                    ---@param items blink.cmp.CompletionItem[]
                    provider.transform_items = function(ctx, items)
                        items = transform_items and transform_items(ctx, items) or items
                        for _, item in ipairs(items) do
                            item.kind = kind_idx or item.kind
                            item.kind_icon = LazyVim.config.icons.kinds[item.kind_name] or item.kind_icon or nil
                        end
                        return items
                    end

                    -- Unset custom prop to pass blink.cmp validation
                    provider.kind = nil
                end
            end

            require("blink.cmp").setup(opts)
        end,
    },
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },
    -- add tsserver and setup with typescript.nvim instead of lspconfig
    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         "jose-elias-alvarez/typescript.nvim",
    --         init = function()
    --             require("lazyvim.util").lsp.on_attach(function(_, buffer)
    --       -- stylua: ignore
    --       vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
    --                 vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    --             end)
    --         end,
    --     },
    --     ---@class PluginLspOpts
    --     opts = {
    --         ---@type lspconfig.options
    --         servers = {
    --             -- tsserver will be automatically installed with mason and loaded with lspconfig
    --             tsserver = {},
    --         },
    --         -- you can do any additional lsp server setup here
    --         -- return true if you don't want this server to be setup with lspconfig
    --         ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    --         setup = {
    --             -- example to setup with typescript.nvim
    --             tsserver = function(_, opts)
    --                 require("typescript").setup({ server = opts })
    --                 return true
    --             end,
    --             -- Specify * to use this function as a fallback for any server
    --             -- ["*"] = function(server, opts) end,
    --         },
    --     },
    -- },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "c_sharp",
            })
        end,
    },

    -- -- or you can return new options to override all the defaults
    -- -- use mini.starter instead of alpha
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
}
