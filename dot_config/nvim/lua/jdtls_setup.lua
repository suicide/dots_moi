local M = {}

local default_on_attach = require('lsp_mappings')

function M.setup()
    local on_attach = function(client, bufnr)
      require'jdtls.setup'.add_commands()
      require'jdtls'.setup_dap()
      -- require'lsp-status'.register_progress()
      require'compe'.setup {
          enabled = true;
          autocomplete = true;
          debug = false;
          min_length = 1;
          preselect = 'enable';
          throttle_time = 80;
          source_timeout = 200;
          incomplete_delay = 400;
          max_abbr_width = 100;
          max_kind_width = 100;
          max_menu_width = 100;
          documentation = true;

          source = {
            path = true;
            buffer = true;
            calc = true;
            vsnip = false;
            nvim_lsp = true;
            nvim_lua = true;
            spell = true;
            tags = true;
            snippets_nvim = false;
            treesitter = true;
          };
        }

      -- require'lspkind'.init()
      -- require'lspsaga'.init_lsp_saga()

      -- Kommentary
      -- vim.api.nvim_set_keymap("n", "<leader>/", "<plug>kommentary_line_default", {})
      -- vim.api.nvim_set_keymap("v", "<leader>/", "<plug>kommentary_visual_default", {})

      -- require'formatter'.setup{
      --     filetype = {
      --         java = {
      --             function()
      --                 return {
      --                     exe = 'java',
      --                     args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
      --                     stdin = true
      --                 }
      --             end
      --         }
      --     }
      -- }

      vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.java FormatWrite
        augroup end
      ]], true)

      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Mappings.
      local opts = { noremap=true, silent=true }
      default_on_attach(client, bufnr)
      -- Java specific
      buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
      buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
      buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
      buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
      buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
      buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)


    end

    local root_markers = {'.git'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')

    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }

    local workspace_folder = home .. "/.local/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local config = {
        flags = {
          allow_incremental_sync = true,
        };
        capabilities = capabilities,
        on_attach = on_attach,
    }

    config.settings = {
        ['java.format.settings.url'] = home .. "/.config/_style/eclipse-java-google-style.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
        java = {
          signatureHelp = { enabled = true };
          contentProvider = { preferred = 'fernflower' };
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            }
          };
          sources = {
            organizeImports = {
              starThreshold = 9999;
              staticStarThreshold = 9999;
            };
          };
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            }
          };
          configuration = {
            runtimes = {
            }
          };
        };
    }
    config.cmd = {'jdtls.sh', workspace_folder}
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    -- local jar_patterns = {
    --     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    --     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
    --     '/dev/microsoft/vscode-java-test/server/*.jar',
    -- }

    -- local bundles = {}
    -- for _, jar_pattern in ipairs(jar_patterns) do
    --   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
    --     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
    --       table.insert(bundles, bundle)
    --     end
    --   end
    -- end

    local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    config.init_options = {
      -- bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities;
    }

    -- UI
    -- local finders = require'telescope.finders'
    -- local sorters = require'telescope.sorters'
    -- local actions = require'telescope.actions'
    -- local pickers = require'telescope.pickers'
    -- require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    --   local opts = {}
    --   pickers.new(opts, {
    --     prompt_title = prompt,
    --     finder    = finders.new_table {
    --       results = items,
    --       entry_maker = function(entry)
    --         return {
    --           value = entry,
    --           display = label_fn(entry),
    --           ordinal = label_fn(entry),
    --         }
    --       end,
    --     },
    --     sorter = sorters.get_generic_fuzzy_sorter(),
    --     attach_mappings = function(prompt_bufnr)
    --       actions.goto_file_selection_edit:replace(function()
    --         local selection = actions.get_selected_entry(prompt_bufnr)
    --         actions.close(prompt_bufnr)

    --         cb(selection.value)
    --       end)

    --       return true
    --     end,
    --   }):find()
    -- end

    -- Server
    require('jdtls').start_or_attach(config)
end

return M
