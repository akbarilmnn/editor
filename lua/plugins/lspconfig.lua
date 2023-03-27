return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { "j-hui/fidget.nvim", opts = {} },


    },
    config = function()
        -- [[
        -- STEP 1: setup mason for installing language servers easily
        -- ]]
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        local servers = {
            lua_ls = {},
            rust_analyzer = {},
            emmet_ls = {},
            html = {},
            cssls = {},
            tsserver = {},
            tailwindcss = {},
            svelte = {}
        }

        mason.setup()

        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }


        -- [[
        -- STEP 2: handle the lsp server when the buffer is attached
        -- ]]


        -- LSP settings.
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            -- this is just a helper function to make descriptive keymaps
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            -- mappings for diagnostics
            nmap("<leader>rn", "<cmd>Lspsaga rename<cr>", '[R]e[n]ame');
            nmap("<leader>ca", "<cmd>Lspsaga code_action<cr>", '[C]ode[A]ction');
            nmap("gd", "<cmd>Lspsaga goto_definition<cr>", "[G]oto [D]efinition");
            nmap("K", "<cmd>Lspsaga hover_doc<cr>", 'Hover Documentation');
            nmap("gt", "<cmd>Lspsaga goto_type_definition<cr>", "[G]oto [T]ype definition");
            nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation");
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences');


            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        -- capabillities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        mason_lspconfig.setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }

        -- [[
        -- STEP 3: start neovim completion
        -- ]]
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' },
            },
        }
    end
}
