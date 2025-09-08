-- Common
vim.keymap.set("n", "<leader>/", ":noh<cr>", { desc = "Clear search" })
vim.keymap.set("n", "<A-J>", "<cmd>m+1<cr>", { desc = "Swap lower" })
vim.keymap.set("n", "<A-K>", "<cmd>m-2<cr>", { desc = "Swap upper" })
vim.keymap.set({ "n", "i" }, "<C-l>", require("actions-preview").code_actions, { desc = "LSP code action" })

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" })

-- Oil
vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open Oil" })

-- Telescope
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope").extensions.smart_open.smart_open()
end, { noremap = true, silent = true })

-- Hover (lazy)
-- See: plugins.config.hover

-- Flash (lazy)
-- See: plugins.config.flash

-- Toggleterm (lazy)
-- See: plugins.config.toggleterm
