local lsp = require('lsp-zero')

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'ccls',
    'deno'
})

lsp.preset("recommended")
lsp.setup()
