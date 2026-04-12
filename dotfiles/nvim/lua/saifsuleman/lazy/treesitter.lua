return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash", "python",
        },
        sync_install = false,
        auto_install = true,
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
}
