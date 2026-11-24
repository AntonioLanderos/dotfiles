return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
        local ensure_installed = {
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
            "markdown",
            "markdown_inline",
            "python",
            "sql",
            "toml",
            "typescript",
            "tsx",
            "systemverilog",
            "yaml",
            "go",
            "gdscript",
        }

        require("nvim-treesitter").install(ensure_installed)

        -- On the main branch highlighting/indent are started per-buffer by
        -- Neovim itself, not by a module table. Start them on FileType.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- vimtex owns latex highlighting; let treesitter handle the rest.
                if vim.bo[args.buf].filetype == "tex" then
                    return
                end
                -- No-op silently for filetypes without an installed parser.
                local ok = pcall(vim.treesitter.start, args.buf)
                if ok then
                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
