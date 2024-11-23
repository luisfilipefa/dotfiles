return {
  'nvim-treesitter/nvim-treesitter-context',
  cmd = {
    'TSContextToggle',
  },
  keys = {
    { '<leader>tc', '<cmd>TSContextToggle<cr>', { desc = '[t]oggle code [c]ontext' } },
  },
}
