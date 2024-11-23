require 'config.options'
require 'config.keymaps'
require 'config.lazy'

-- wip neotest failed test bug
-- this solution is not working for some reason. neovim still displays another version when i run !node -v
vim.g.node_host_prog = vim.fn.getenv 'HOME' .. '/nvm/current/bin/node'
