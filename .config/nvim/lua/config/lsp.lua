local status, nvim_lsp = pcall(require, 'lspconfig')

if (not status) then
  print('lspconfig is not installed')

  return 
end

local masonStatus, mason = pcall(require, 'mason')

if (not masonStatus) then
  print('mason is not installed')
  return
end


require("mason").setup()
require("mason-lspconfig").setup()

