return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("diffview").setup({
            diff_binaries = false,
            enhanced_diff_hl = false,
            git_cmd = { "git" },
            hg_cmd = { "hg" },
            use_icons = true,
            show_help_hints = true,
            watch_index = true,
            icons = {
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
            },
            view = {
                default = {
                    layout = "diff2_horizontal",
                    winbar_info = false,
                },
                merge_tool = {
                    layout = "diff3_horizontal",
                    disable_diagnostics = true,
                    winbar_info = true,
                },
                file_history = {
                    layout = "diff2_horizontal",
                    winbar_info = false,
                },
            },
            file_panel = {
                listing_style = "tree",
                tree_options = {
                    flatten_dirs = true,
                    folder_statuses = "only_folded",
                },
                win_config = {
                    position = "left",
                    width = 35,
                    win_opts = {},
                },
            },
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                    hg = {
                        single_file = {},
                        multi_file = {},
                    },
                },
                win_config = {
                    position = "bottom",
                    height = 16,
                    win_opts = {},
                },
            },
            commit_log_panel = {
                win_config = {
                    win_opts = {},
                },
            },
            default_args = {
                DiffviewOpen = {},
                DiffviewFileHistory = {},
            },
            hooks = {},
            keymaps = {
                disable_defaults = false,
                view = {
                    { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
                    {
                        "n",
                        "gf",
                        "<cmd>DiffviewGoToFile<cr>",
                        { desc = "Open the file in the previous tabpage" },
                    },
                    { "n", "<C-w><C-f>", "<cmd>DiffviewGoToFile<cr>", { desc = "Open the file in a new split" } },
                    { "n", "<C-w>gf", "<cmd>tabnew %<cr>", { desc = "Open the file in a new tabpage" } },
                    { "n", "<leader>e", "<cmd>DiffviewToggleFiles<cr>", { desc = "Focus the file panel" } },
                    { "n", "<leader>b", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
                    {
                        "n",
                        "g<C-x>",
                        "<cmd>DiffviewRefresh<cr>",
                        { desc = "Update stats and entries in the file list" },
                    },
                    { "n", "[x", "<cmd>DiffviewPrevConflict<cr>", { desc = "Go to the previous conflict" } },
                    { "n", "]x", "<cmd>DiffviewNextConflict<cr>", { desc = "Go to the next conflict" } },
                },
                diff1 = {
                    { "n", "g?", "<cmd>h diffview-maps-diff1<cr>", { desc = "Open the help panel" } },
                },
                diff2 = {
                    { "n", "g?", "<cmd>h diffview-maps-diff2<cr>", { desc = "Open the help panel" } },
                },
                diff3 = {
                    { "n", "g?", "<cmd>h diffview-maps-diff3<cr>", { desc = "Open the help panel" } },
                },
                diff4 = {
                    { "n", "g?", "<cmd>h diffview-maps-diff4<cr>", { desc = "Open the help panel" } },
                },
                file_panel = {
                    {
                        "n",
                        "j",
                        "<cmd>lua require('diffview.actions').next_entry()<cr>",
                        { desc = "Bring the cursor to the next file entry" },
                    },
                    {
                        "n",
                        "<down>",
                        "<cmd>lua require('diffview.actions').next_entry()<cr>",
                        { desc = "Bring the cursor to the next file entry" },
                    },
                    {
                        "n",
                        "k",
                        "<cmd>lua require('diffview.actions').prev_entry()<cr>",
                        { desc = "Bring the cursor to the previous file entry" },
                    },
                    {
                        "n",
                        "<up>",
                        "<cmd>lua require('diffview.actions').prev_entry()<cr>",
                        { desc = "Bring the cursor to the previous file entry" },
                    },
                    {
                        "n",
                        "<cr>",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "o",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "l",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "<2-LeftMouse>",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "-",
                        "<cmd>lua require('diffview.actions').toggle_stage_entry()<cr>",
                        { desc = "Stage / unstage the selected entry" },
                    },
                    {
                        "n",
                        "S",
                        "<cmd>lua require('diffview.actions').stage_all()<cr>",
                        { desc = "Stage all entries" },
                    },
                    {
                        "n",
                        "U",
                        "<cmd>lua require('diffview.actions').unstage_all()<cr>",
                        { desc = "Unstage all entries" },
                    },
                    {
                        "n",
                        "X",
                        "<cmd>lua require('diffview.actions').restore_entry()<cr>",
                        { desc = "Restore entry to the state on the left side" },
                    },
                    {
                        "n",
                        "L",
                        "<cmd>lua require('diffview.actions').open_commit_log()<cr>",
                        { desc = "Open the commit log panel" },
                    },
                    {
                        "n",
                        "zo",
                        "<cmd>lua require('diffview.actions').open_fold()<cr>",
                        { desc = "Expand fold" },
                    },
                    {
                        "n",
                        "h",
                        "<cmd>lua require('diffview.actions').close_fold()<cr>",
                        { desc = "Collapse fold" },
                    },
                    {
                        "n",
                        "zc",
                        "<cmd>lua require('diffview.actions').close_fold()<cr>",
                        { desc = "Collapse fold" },
                    },
                    {
                        "n",
                        "za",
                        "<cmd>lua require('diffview.actions').toggle_fold()<cr>",
                        { desc = "Toggle fold" },
                    },
                    {
                        "n",
                        "zR",
                        "<cmd>lua require('diffview.actions').open_all_folds()<cr>",
                        { desc = "Expand all folds" },
                    },
                    {
                        "n",
                        "zM",
                        "<cmd>lua require('diffview.actions').close_all_folds()<cr>",
                        { desc = "Collapse all folds" },
                    },
                    {
                        "n",
                        "<c-b>",
                        "<cmd>lua require('diffview.actions').scroll_view(-0.25)<cr>",
                        { desc = "Scroll the view up" },
                    },
                    {
                        "n",
                        "<c-f>",
                        "<cmd>lua require('diffview.actions').scroll_view(0.25)<cr>",
                        { desc = "Scroll the view down" },
                    },
                    {
                        "n",
                        "<tab>",
                        "<cmd>lua require('diffview.actions').select_next_entry()<cr>",
                        { desc = "Open the diff for the next file" },
                    },
                    {
                        "n",
                        "<s-tab>",
                        "<cmd>lua require('diffview.actions').select_prev_entry()<cr>",
                        { desc = "Open the diff for the previous file" },
                    },
                    {
                        "n",
                        "gf",
                        "<cmd>lua require('diffview.actions').goto_file_edit()<cr>",
                        { desc = "Open the file in the previous tabpage" },
                    },
                    {
                        "n",
                        "<C-w><C-f>",
                        "<cmd>lua require('diffview.actions').goto_file_split()<cr>",
                        { desc = "Open the file in a new split" },
                    },
                    {
                        "n",
                        "<C-w>gf",
                        "<cmd>lua require('diffview.actions').goto_file_tab()<cr>",
                        { desc = "Open the file in a new tabpage" },
                    },
                    {
                        "n",
                        "<leader>e",
                        "<cmd>lua require('diffview.actions').focus_files()<cr>",
                        { desc = "Bring focus to the file panel" },
                    },
                    {
                        "n",
                        "<leader>b",
                        "<cmd>lua require('diffview.actions').toggle_files()<cr>",
                        { desc = "Toggle the file panel" },
                    },
                    {
                        "n",
                        "g<C-x>",
                        "<cmd>lua require('diffview.actions').cycle_layout()<cr>",
                        { desc = "Cycle through available layouts" },
                    },
                    {
                        "n",
                        "g?",
                        "<cmd>h diffview-maps-file-panel<cr>",
                        { desc = "Open the help panel" },
                    },
                    {
                        "n",
                        "<F1>",
                        "<cmd>h diffview-maps-file-panel<cr>",
                        { desc = "Open the help panel" },
                    },
                },
                file_history_panel = {
                    {
                        "n",
                        "g!",
                        "<cmd>lua require('diffview.actions').options()<cr>",
                        { desc = "Open the option panel" },
                    },
                    {
                        "n",
                        "<C-A-d>",
                        "<cmd>lua require('diffview.actions').open_in_diffview()<cr>",
                        { desc = "Open the entry under the cursor in a diffview" },
                    },
                    {
                        "n",
                        "y",
                        "<cmd>lua require('diffview.actions').copy_hash()<cr>",
                        { desc = "Copy the commit hash of the entry under the cursor" },
                    },
                    {
                        "n",
                        "L",
                        "<cmd>lua require('diffview.actions').open_commit_log()<cr>",
                        { desc = "Show commit details" },
                    },
                    {
                        "n",
                        "zR",
                        "<cmd>lua require('diffview.actions').open_all_folds()<cr>",
                        { desc = "Expand all folds" },
                    },
                    {
                        "n",
                        "zM",
                        "<cmd>lua require('diffview.actions').close_all_folds()<cr>",
                        { desc = "Collapse all folds" },
                    },
                    {
                        "n",
                        "j",
                        "<cmd>lua require('diffview.actions').next_entry()<cr>",
                        { desc = "Bring the cursor to the next file entry" },
                    },
                    {
                        "n",
                        "<down>",
                        "<cmd>lua require('diffview.actions').next_entry()<cr>",
                        { desc = "Bring the cursor to the next file entry" },
                    },
                    {
                        "n",
                        "k",
                        "<cmd>lua require('diffview.actions').prev_entry()<cr>",
                        { desc = "Bring the cursor to the previous file entry" },
                    },
                    {
                        "n",
                        "<up>",
                        "<cmd>lua require('diffview.actions').prev_entry()<cr>",
                        { desc = "Bring the cursor to the previous file entry" },
                    },
                    {
                        "n",
                        "<cr>",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "o",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "<2-LeftMouse>",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Open the diff for the selected entry" },
                    },
                    {
                        "n",
                        "<c-b>",
                        "<cmd>lua require('diffview.actions').scroll_view(-0.25)<cr>",
                        { desc = "Scroll the view up" },
                    },
                    {
                        "n",
                        "<c-f>",
                        "<cmd>lua require('diffview.actions').scroll_view(0.25)<cr>",
                        { desc = "Scroll the view down" },
                    },
                    {
                        "n",
                        "<tab>",
                        "<cmd>lua require('diffview.actions').select_next_entry()<cr>",
                        { desc = "Open the diff for the next file" },
                    },
                    {
                        "n",
                        "<s-tab>",
                        "<cmd>lua require('diffview.actions').select_prev_entry()<cr>",
                        { desc = "Open the diff for the previous file" },
                    },
                    {
                        "n",
                        "gf",
                        "<cmd>lua require('diffview.actions').goto_file_edit()<cr>",
                        { desc = "Open the file in the previous tabpage" },
                    },
                    {
                        "n",
                        "<C-w><C-f>",
                        "<cmd>lua require('diffview.actions').goto_file_split()<cr>",
                        { desc = "Open the file in a new split" },
                    },
                    {
                        "n",
                        "<C-w>gf",
                        "<cmd>lua require('diffview.actions').goto_file_tab()<cr>",
                        { desc = "Open the file in a new tabpage" },
                    },
                    {
                        "n",
                        "<leader>e",
                        "<cmd>lua require('diffview.actions').focus_files()<cr>",
                        { desc = "Bring focus to the file panel" },
                    },
                    {
                        "n",
                        "<leader>b",
                        "<cmd>lua require('diffview.actions').toggle_files()<cr>",
                        { desc = "Toggle the file panel" },
                    },
                    {
                        "n",
                        "g<C-x>",
                        "<cmd>lua require('diffview.actions').cycle_layout()<cr>",
                        { desc = "Cycle through available layouts" },
                    },
                    {
                        "n",
                        "g?",
                        "<cmd>h diffview-maps-file-history-panel<cr>",
                        { desc = "Open the help panel" },
                    },
                    {
                        "n",
                        "<F1>",
                        "<cmd>h diffview-maps-file-history-panel<cr>",
                        { desc = "Open the help panel" },
                    },
                },
                option_panel = {
                    {
                        "n",
                        "<tab>",
                        "<cmd>lua require('diffview.actions').select_entry()<cr>",
                        { desc = "Change the current option" },
                    },
                    {
                        "n",
                        "q",
                        "<cmd>lua require('diffview.actions').close()<cr>",
                        { desc = "Close the option panel" },
                    },
                    {
                        "n",
                        "<esc>",
                        "<cmd>lua require('diffview.actions').close()<cr>",
                        { desc = "Close the option panel" },
                    },
                    {
                        "n",
                        "g?",
                        "<cmd>h diffview-maps-option-panel<cr>",
                        { desc = "Open the help panel" },
                    },
                },
                help_panel = {
                    { "n", "q", "<cmd>lua require('diffview.actions').close()<cr>", { desc = "Close help menu" } },
                    { "n", "<esc>", "<cmd>lua require('diffview.actions').close()<cr>", { desc = "Close help menu" } },
                },
            },
        })
    end,
}

