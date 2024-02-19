vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.zig.zon",
    callback = function()
        vim.bo.filetype = 'zig'
    end,
})