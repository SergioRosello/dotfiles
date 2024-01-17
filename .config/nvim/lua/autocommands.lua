local au = require('utils.au')
au.augroup('FileTypeSettings', {
  {
    event = 'BufEnter',
    pattern = '*.tex',
    command = [[setlocal spell spelllang=es,en_us]],
    callback = function()
      vim.opt_local.filetype = 'tex'
    end,
  },
  {
    event = 'BufEnter',
    pattern = '*.hcl',
    callback = function()
      vim.opt_local.filetype = 'hcl'
    end,
  },
  {
    event = 'BufEnter',
    pattern = '*.tf,*.tfvars',
    callback = function()
      vim.opt_local.filetype = 'terraform'
    end,
  },
  {
    event = 'BufEnter',
    pattern = '.env',
    callback = function()
      vim.opt_local.filetype = 'sh'
    end,
  },
  {
    event = 'BufEnter',
    pattern = '*.md',
    command = [[setlocal spell spelllang=es,en_us]],
  },
})
