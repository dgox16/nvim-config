local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Rekeymap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- NORMAL MODE
-- Redimensionar
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Moverse entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Diferentes formas de guardar y salir
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader>q", ":q<CR>", opts)
-- Abrir explorador de archivos
keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)
-- Manejo de Buffers
keymap("n", "<M-d>", ":bd<CR>", opts)
keymap("n", "<M-h>", ":bp<CR>", opts)
keymap("n", "<M-l>", ":bn<CR>", opts)
-- LSP
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "{e", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "}e", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- FZF
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<Leader>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<Leader>fb", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<Leader>ft", "<cmd> Telescope treesitter<CR>", opts)
-- Buscar y remplazar
keymap("n", "<Leader>r", ":%s///g<Left><Left><Left>", { noremap = true, silent = false })
-- Ejecutar Python
keymap("n", "py", ":!python %<CR>", opts)
-- Punto y coma al final
keymap("n", "<Leader>;", "$a;<Esc>", opts)
-- Abrir diferentes terminales
keymap("n", "<M-q>", ":ToggleTerm<CR>", opts)
keymap("n", "<M-Q>", ":ToggleTerm ", { noremap = true, silent = false })
-- Scroll mas rapido
keymap("n", "<C-e>", "2<C-e>", opts)
keymap("n", "<C-y>", "2<C-y>", opts)

keymap("n", "<M-p>", ":m .-2<CR>==", opts)
keymap("n", "<M-n>", ":m .+1<CR>==", opts)

keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("n", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("n", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })

keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
-- MODO INSERTAR
keymap("i", "<C-d>", "<C-O>dw", opts)

keymap("i", "<M-p>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<M-n>", "<Esc>:m .+1<CR>==gi", opts)

keymap("i", "<C-b>", "<Esc>^i", opts)
keymap("i", "<C-e>", "<End>", opts)

keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

-- MODO VISUAL
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mover lineas
keymap("x", "<M-p>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<M-n>", ":m '>+1<CR>gv=gv", opts)

-- J K just move
keymap("x", "J", "j", opts)
keymap("x", "K", "k", opts)

keymap("v", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("v", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })
keymap("v", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
keymap("v", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })

keymap("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)
