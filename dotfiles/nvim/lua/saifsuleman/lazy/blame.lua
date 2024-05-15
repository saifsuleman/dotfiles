return {
    "FabijanZulj/blame.nvim",
    config = function()
        require("blame").setup({
            merge_consecutive = false,
            mappings = {
                commit_info = "i",
                stack_push = "<TAB>",
                stack_pop = "<BS>",
                show_commit = "<CR>",
                close = { "<esc>", "q" }
            }
        })


        vim.keymap.set("n", "gb", "<cmd>BlameToggle window<CR>")
    end
}
