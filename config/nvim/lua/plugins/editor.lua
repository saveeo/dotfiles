return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.surround").setup()
        require("mini.ai").setup()
        require("mini.operators").setup()
        require("mini.pairs").setup()
        require("mini.bracketed").setup()
        require("mini.clue").setup()
    end,
}
