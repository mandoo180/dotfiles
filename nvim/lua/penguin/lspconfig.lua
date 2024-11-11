local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  print('loading lspconfig not ok')
  return
end

lspconfig.pyright.setup({})
lspconfig.ts_ls.setup({})
lspconfig.lua_ls.setup({})
