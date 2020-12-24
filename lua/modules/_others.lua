-- Specifies python and node provider path to make startup faster
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.node_host_prog = os.getenv("HOME") .. '/.yarn/bin/neovim-node-host'

-- disable git messenger default mappings
vim.g.git_messenger_no_default_mappings = true

-- highlight yanked text for 250ms
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank{ timeout = 250 }")
