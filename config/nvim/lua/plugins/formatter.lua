return 	{
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {},

    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                json = { "jq" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "isort", "black" },
                sh = { "shfmt" },
                -- Use the "*" filetype to run formatters on all filetypes.
                -- ["*"] = { "codespell" },
                ["_"] = { "trim_whitespace" },
                yaml = { "prettier" },
            },

            clients_lsp = function()
                local bufnr = vim.api.nvim_get_current_buf()

                local clients = vim.lsp.get_clients({ bufnr = bufnr })
                if next(clients) == nil then
                    return ""
                end

                local c = {}
                for _, client in pairs(clients) do
                    table.insert(c, client.name)
                end
                return table.concat(c, "|")
            end,

            -- TODO : find out what this function does, what's it trying to suppress
            override_lsp = function()
                local lsp_error_override = { "yamlls" }
                local active_lsp = clients_lsp()
                for _, client in ipairs(lsp_error_override) do
                    if string.match(client, active_lsp) then
                        return true
                    end
                end
            end,

            format_on_save = function()
                local next = next
                --- check if we have to skip formatting due to lsp errors
                if
                    next(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })) ~= nil
                    and not override_lsp()
                    then
                        local notify_ok, notify = pcall(require, "notify")
                        if not notify_ok then
                            return
                        end
                        notify("LSP errors, cannot format")
                        return
                    end
                    return { timeout_ms = 5000, lsp_fallback = true }
                end,
            })
        end,
    }
