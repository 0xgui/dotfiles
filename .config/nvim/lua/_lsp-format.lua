require("lsp-format").setup {}
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>Format<CR>', opts)

