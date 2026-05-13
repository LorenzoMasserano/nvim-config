-- Enable the kotlin Language server
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config('kotlin_language_server', {
    capabilities = capabilities,
})

vim.lsp.enable('kotlin_language_server')
