return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    -- todo: figure out a way to show diagnostics for the entire workspace?
    -- {
    --   '<leader>wd',
    --   '<cmd>Trouble diagnostics toggle filter.dirname=vim.fn.getcwd()<cr>',
    --   desc = '[w]orkspace [d]iagnostics',
    -- },
    {
      '<leader>dd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[d]ocument [d]iagnostics',
    },
  },
}
