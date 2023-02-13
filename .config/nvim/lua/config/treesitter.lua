local plugin = require "nvim-treesitter.configs"

plugin.setup {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "rust",
        "lua",
        "c"
    },
    textobjects = {
        select = {
            enable = true,
        },
    },
}
