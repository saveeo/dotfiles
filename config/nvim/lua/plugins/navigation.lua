return 	{
    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup({
                default_file_explorer = false,
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 20,
                },
            })
        end,

    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                              , branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

            "nvim-telescope/telescope-smart-history.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            --			"kkharji/sqlite.lua",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    wrap_results = true,

                    fzf = {},
                    history = {
                        -- path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
                        limit = 100,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "smart_history")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<space>fd", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<space>ft", builtin.git_files, { desc = "Telescope find git files" })
            vim.keymap.set("n", "<space>fh", builtin.help_tags, { desc = "Telescope find help tags" })
            vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<space>fb", builtin.buffers, { desc = "Telescope find in buffers" })
            vim.keymap.set(
                "n",
                "<space>/",
                builtin.current_buffer_fuzzy_find,
                { desc = "Telescope fuzzy find in buffer" }
            )

            vim.keymap.set("n", "<space>gw", builtin.grep_string, { desc = "Telescope grep string" })

            -- vim.keymap.set("n", "<space>fa", function()
                -- 	---@diagnostic disable-next-line: param-type-mismatch
                -- 	builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
                -- end)

                vim.keymap.set("n", "<space>en", function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end)
            end,
        },
    }

