-- lua/plugins/vimtex.lua
return {
    "lervag/vimtex",
    ft = "tex",  -- only load for .tex files
    config = function()
        -- Compiler settings
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-file-line-error",
            },
        }

        -- PDF viewer
        vim.g.vimtex_view_method = "zathura"  -- change if you use another viewer
        vim.g.vimtex_quickfix_mode = 0        -- disable quickfix window on errors

       -- Auto-save on leaving insert mode for .tex files
        vim.api.nvim_create_autocmd("InsertLeave", {
            pattern = "*.tex",
            callback = function()
                if vim.bo.modified then
                    vim.cmd("write")
                end
            end,
        })

        -- Optional: keybindings
        vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>VimtexView<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { noremap = true, silent = true })
    end,
}

