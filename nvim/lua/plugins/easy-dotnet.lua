return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local Path = require("plenary.path")

        -- Linux-only .sln file finder
        local function find_solution_file(start_dir)
            local dir = Path:new(start_dir)
            while not dir:equals(Path:new("/")) do
                for _, file in ipairs(dir:scan()) do
                    if file:match("%.sln$") then
                        return dir:absolute() .. "/" .. file
                    end
                end
                dir = dir:parent()
            end
            return nil
        end

        local function patched_get_solution_projects(bufnr)
            local cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p:h")
            local sln_file = find_solution_file(cwd)

            if not sln_file then
                error("No .sln file found in current or parent directories")
            end

            local cmd = string.format('dotnet sln "%s" list', sln_file)
            local output = vim.fn.systemlist(cmd)

            if vim.v.shell_error ~= 0 then
                error("Command failed: " .. cmd)
            end

            return output
        end

        -- Linux-only secret path
        local function get_secret_path(secret_guid)
            return vim.fn.expand("~") .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
        end

        local dotnet = require("easy-dotnet")

        dotnet.setup({
            get_sdk_path = get_sdk_path, -- assumes you define get_sdk_path elsewhere
            new = { project = { prefix = "sln" } },
            secrets = {
                path = get_secret_path,
            },
            csproj_mappings = true,
            fsproj_mappings = true,
            auto_bootstrap_namespace = {
                type = "block_scoped",
                enabled = true,
            },
            picker = "telescope",
            background_scanning = true,
        })

        require("easy-dotnet.parsers.sln-parse").get_solution_projects = patched_get_solution_projects
    end,
}
