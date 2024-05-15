return {
    "m4xshen/autoclose.nvim",
    config = function()
        local autoclose = require("autoclose")
        autoclose.setup({
            options = { disabled_filetypes = { "text", "markdown" } }
        })
    end
}
