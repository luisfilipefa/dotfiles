return {
  {
    'nvim-neotest/neotest',
    lazy = false,
    dependencies = { 'nvim-neotest/nvim-nio', 'nvim-neotest/neotest-jest' },
    opts = {
      adapters = {
        ---@class neotest.JestOptions
        ['neotest-jest'] = {
          jestCommand = 'npm test --',
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
    config = function(_, opts)
      if opts.adapters then
        local adapters = {}
        for name, config in pairs(opts.adapters or {}) do
          if type(name) == 'number' then
            if type(config) == 'string' then
              config = require(config)
            end
            adapters[#adapters + 1] = config
          elseif config ~= false then
            local adapter = require(name)
            if type(config) == 'table' and not vim.tbl_isempty(config) then
              local meta = getmetatable(adapter)
              if adapter.setup then
                adapter.setup(config)
              elseif adapter.adapter then
                adapter.adapter(config)
                adapter = adapter.adapter
              elseif meta and meta.__call then
                adapter = adapter(config)
              else
                error('Adapter ' .. name .. ' does not support setup')
              end
            end
            adapters[#adapters + 1] = adapter
          end
        end
        opts.adapters = adapters
      end

      require('neotest').setup(opts)
    end,
    keys = {
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = '[t]est nea[r]est',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[t]oggle test [s]ummary panel',
      },
      {
        '<leader>to',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '[t]oggle test [o]utput panel',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[t]est file',
      },
    },
  },
}
