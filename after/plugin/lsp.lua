local status, nvim_lsp = pcall(require, "lspconfig") 
if (not status) then return end

local protocol = require("vim.lsp.protocol")
local util = require("lspconfig/util")

local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then 
        vim.api.nvim_command [[ augroup Format ]]
        vim.api.nvim_command [[ autocmd! * <buffer> ]]
        vim.api.nvim_command [[ augroup END ]]
    end
end


nvim_lsp.tsserver.setup {
    on_attach = on_attach, 
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }, 
    root_dir = function(fname)
       return util.path.dirname(fname)
    end,
    cmd = { 'typescript-language-server', '--stdio' }
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    root_dir = function(fname)
       return util.path.dirname(fname)
    end,

}

nvim_lsp.denols.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern("deps.ts"),
}

nvim_lsp.clangd.setup{
    on_attach = on_attach,
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach, 
}

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern("*.html"),
}

nvim_lsp.svelte.setup {
    on_attach = on_attach,
}

nvim_lsp.marksman.setup {
    on_attach = on_attach,
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern("*.scss")
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
}

nvim_lsp.zls.setup {
    on_attach = on_attach,
    root_dir = util.root_pattern("*.zig"),
}

