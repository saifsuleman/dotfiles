return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-Space>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-n>",
                        prev = "<M-p>",
                        dismiss = "<C-]>",
                    },
                },
                panel = {
                    enabled = true,
                    keymap = {
                        toggle = "<M-c>",
                        next = "<M-n>",
                        prev = "<M-p>",
                        select = "<CR>",
                        close = "<Esc>",
                    },
                }
            })
        end
    },
}
