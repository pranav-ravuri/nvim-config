vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")

-- greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>p", '"+P', { noremap = true })
vim.keymap.set({ "i" }, "<C-S-v>p", '"+P', { noremap = true })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { noremap = true })

-- Cut (delete to clipboard)
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { noremap = true })
vim.keymap.set("n", "<leader>D", '"+dd', { noremap = true })

-- Ctrl+Shift+C to copy in command mode
vim.keymap.set("c", "<C-S-c>", function()
	vim.fn.system("wl-copy", vim.fn.getcmdline())
end, { noremap = true })

-- Ctrl+Shift+V to paste in command mode
vim.keymap.set("c", "<C-S-v>", function()
	local clipboard = vim.fn.system("wl-paste")
	vim.fn.setcmdline(clipboard)
end, { noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Move line down (Alt+J)
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { noremap = true, silent = true })

-- Move line up (Alt+K)
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })

-- Also in visual mode (for multiple lines)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
