return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
                "asm",
                "bash",
                "c",
                "c_sharp",
                "cpp",
                "css",
                "gitignore",
                "html",
                "java",
                "javascript",
                "json",
                "matlab",
                "markdown",
                "python",
                "r",
                "sql",
                "toml",
                "typescript",
                "tsx",
                "verilog",
                "yaml",
                "go",
                "gdscript"
            },
            highlight = {
                enable = true,
                disable = { "latex" },
            },
            indent = { enable = true },
        })
    end
}
