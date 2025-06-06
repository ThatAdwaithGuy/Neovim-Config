return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {

    "neovim/nvim-lspconfig",

    dependencies = { "nanotee/sqls.nvim" },

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              templ = "html",
            },
          },
        },
      })

      lspconfig.sqls.setup({
        on_attach = function(client, bufnr)
          require("sqls").on_attach(client, bufnr) -- require sqls.nvim
        end,
      })

      for _, server in ipairs({
        "lua_ls",
        "gopls",
        "templ",
        "svelte",
        "ts_ls",
        "rust_analyzer",
        "pyright",
        "clangd",
        "ocamllsp",
      }) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          --vim.keymap.set('n', '<space>wl', function()
          --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          --end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
      })
    end,
  },
}
