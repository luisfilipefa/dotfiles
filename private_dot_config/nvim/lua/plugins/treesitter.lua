return { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', 
    opts = {
      ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'javascript', 'typescript', 'dockerfile', 'json', 'ssh_config', 'yaml', 'sql', 'gitignore', 'make', 'tsx', 'css', 'html', 'scss' },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true,  },
    },
  }
