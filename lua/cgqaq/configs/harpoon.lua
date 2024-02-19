local harpoon = require('harpoon')
harpoon:setup()

print(vim.g.mapleader)
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<F2>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<F3>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<F4>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<F5>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<F6>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<F7>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<F8>", function() harpoon:list():select(7) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })