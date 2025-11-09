return {
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = {
            "rafamadriz/friendly-snippets",
            { "L3MON4D3/LuaSnip", version = "v2.*" },
        },

        version = "1.*",
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = "default" },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true } },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                -- show completions from all the buffers
                providers = {
                    buffer = {
                        opts = {
                            -- get all buffers, even ones like neo-tree
                            get_bufnrs = vim.api.nvim_list_bufs,
                            -- or (recommended) filter to only "normal" buffers
                            get_bufnrs = function()
                                return vim.tbl_filter(function(bufnr)
                                    return vim.bo[bufnr].buftype == ""
                                end, vim.api.nvim_list_bufs())
                            end,
                        },
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saghen/blink.cmp" },

        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- history = true
            -- updateevents = "TextChanged,TextChangedI"
            -- override_builtin = true
        end,
    },
    {
		"neovim/nvim-lspconfig",
		-- config = function()
		-- 	local lspconfig = vim.lsp.config()
		-- 	-- setup various lsp's
		-- 	lspconfig.pyright.setup({})
		-- end,
        -- new nvim +0.11 changes 
        vim.lsp.enable('pyright'),
        vim.lsp.enable('ansiblels')
	},

}
