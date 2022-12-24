local status, cmp = pcall(require, "cmp")
if (not status) then return end
                
local lspkind = require('lspkind')
local luasnip = require('luasnip')

-- autopairs

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end 

autopairs.setup{}

cmp.setup({
    
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name =  'buffer' }
    }),

    formatting = {
        format = lspkind.cmp_format({wirth_text = false, maxwidth = 50})
    }

})


