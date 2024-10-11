{
  # Import all your configuration modules here
  # imports = [ ./bufferline.nix ];

  # GLOBAL
  globals.mapleader = " ";
  
  opts = {
    number = true;

    clipboard = "unnamedplus";

    smarttab = true;
    expandtab = false; # Change to true to auto-convert tabs to spaces
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
  };

  extraConfigLua = ''
      -- Add default mappings for 's' and 'S'
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward-to)')
      vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward-to)')

      vim.keymap.set({'v'}, 's', '<Plug>(leap-forward-till)')
      vim.keymap.set({'v'}, 'S', '<Plug>(leap-backward-till)')
    '';

  # KEYMAPS
  keymaps = [
    # pasting from system clipboard
    {
      action = "\"*p";
      key = "<leader>p";
      options = { desc = "[P]aste from system clipboard"; };
    }

    # toggleterm
    {
      key = "<leader>T";
      action = "+Toggle";
      options = { desc = "[T]oggle windows"; };
    }
    {
      action = "<cmd>ToggleTerm<CR>";
      key = "<leader>Tt";
      options = { desc = "[T]oggle [t]erminal"; };
    }
    {
      action = "<C-\\><C-n>";
      key = "<Esc><Esc>";
      mode = ["t"];
      options = { desc = "Escape terminal mode"; };
    }

    # nvim-tree
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<leader>Te";
      options = { desc = "[T]oggle [e]xplorer (Nvim-Tree)"; };
    }

    # lazygit
    {
      action = "<cmd>LazyGit<CR>";
      key = "<leader>Tg";
      options = { desc = "[T]oggle [g]it (LazyGit)"; };
    }

    # rest
    {
      mode = "n";
      key = "<leader>r";
      action = "+rest";
      options = { desc = "[R]est client"; };
    }
    {
      action = "<cmd>Rest open<CR>";
      key = "<leader>ro";
      options = { desc = "[R]est [o]pen window"; };
    }
    {
      action = "<cmd>Rest run<CR>";
      key = "<leader>rr";
      options = { desc = "[R]est [r]un request"; };
    }
    {
      action = "<cmd>Rest last<CR>";
      key = "<leader>rl";
      options = { desc = "[R]est [l]ast request"; };
    }

    # telescope (nvim)
    {
      mode = "n";
      key = "<leader>f";
      action = "+find";
      options = { desc = "[F]ind"; };
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      options = { desc = "[F]ind [f]iles (Telescope)"; };
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
      options = { desc = "[F]ind [b]uffers (Telescope)"; };
    }
    {
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader><leader>";
      options = { desc = "Switch between buffers (Telescope)"; };
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
      options = { desc = "[F]ind [g]rep (Telescope)"; };
    }

    # telescope (vscode-like)
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<C-p>";
      options = { desc = "VSCode-like find files (Telescope)"; };
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<C-f>";
      options = { desc = "VSCode-like live grep (Telescope)"; };
    }

    # Tabs
    {
      mode = "n";
      key = "<leader>t";
      action = "+tab";
      options = { desc = "[T]ab options"; };
    }
    {
      mode = "n";
      key = "<leader>tn";
      action = "<CMD>tabnew<CR>";
      options = { desc = "[T]ab [n]ew"; };
    }
    {
      mode = "n";
      key = "<leader>tc";
      action = "<CMD>tabclose<CR>";
      options = { desc = "[T]ab [c]lose"; };
    }
    {
      mode = "n";
      key = "<leader>tr";
      action = "<CMD>tabnext<CR>";
      options = { desc = "[T]ab [r]ight (next tab)"; };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action = "<CMD>tabprevious<CR>";
      options = { desc = "[T]ab [l]eft (previous tab)"; };
    }

    # code actions
    {
      mode = "n";
      key = "<leader>c";
      action = "+code";
      options = { desc = "[C]ode actions"; };
    }
    {
      key = "<leader>cf";
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      options = { desc = "[C]ode [f]ormat"; };
    }
    {
      key = "<leader>cd";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options = { desc = "[C]ode [d]iagnostics toggle"; };
    }
    {
      key = "<leader>cl";
      action = "<CMD>Trouble lsp toggle<CR>";
      options = { desc = "[C]ode [l]sp information toggle"; };
    }
    {
      key = "<leader>cq";
      action = "<CMD>Trouble quickfix toggle<CR>";
      options = { desc = "[C]ode [q]uickfix list toggle"; };
    }
    {
      key = "<leader>ct";
      action = "<CMD>Trouble todo toggle<CR>";
      options = { desc = "[C]ode [t]odo toggle"; };
    }
];


  # COLORSCHEMES
  colorschemes = {
    catppuccin = {
      enable = true;

      settings = {
        flavour = "mocha";

        # Needed to keep terminal transparency, if any
        transparent_background = false;
      };
    };
  };

  # PLUGINS
  plugins = {
    # UI
    noice = {
      enable = true;
    };
    nvim-tree = {
      enable = true;
      
      openOnSetup = true;
      disableNetrw = true;
      hijackNetrw = true;
      hijackCursor = false;
      diagnostics = {
        enable = true;
        showOnDirs = true;
      };
      updateFocusedFile = {
        enable = true;
        updateRoot = false;
      };
      view = {
        width = "30";
        side = "left";
      };
      actions.openFile.resizeWindow = false;
      modified.enable = true;
      tab.sync.open = true;
    };
    toggleterm = {
      enable = true;

      size = "10";
      hideNumbers = true;
      shadeTerminals = true;
      startInInsert = true;
      insertMappings = true;
      persistSize = true;
      direction = "horizontal";
      closeOnExit = true;
    };
    which-key.enable = true;
    lazygit.enable = true;
    rest.enable = true;
    telescope.enable = true;
    lualine.enable = true;
    todo-comments.enable = true;
    web-devicons.enable = true;
    # EDITING / NAVIGATION
    leap = {
      enable = true;
      addDefaultMappings = false;
      highlightUnlabeledPhaseOneTargets = true;
    };
    yanky = {
      enable = true;
      settings = {
        system_clipboard.sync_with_ring = true;
      };
    };
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;

    # EDITING / COMPLETIONS
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        {name = "nvim_lsp";}
        {name = "treesitter";}
        {name = "luasnip";}
        {name = "emmet";}
        {name = "tailwindcss";}
        {name = "path";}
        {name = "buffer";}
      ];

      settings.snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Down>" = ''
            function(fallback)
              if cmp and cmp.visible() then
                cmp.select_next_item()
              elseif luasnip and luasnip.expandable() then
                luasnip.expand()
              elseif luasnip and luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace and check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
        "<Up>" = ''
            function(fallback)
              if cmp and cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip and luasnip.expandable() then
                luasnip.expand()
              elseif luasnip and luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace and check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
        "<Tab>" = ''
            function(fallback)
              if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end
          '';
        "<S-Tab>" = ''
            function(fallback)
              if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end
          '';
      };
    };
    friendly-snippets.enable = true;
    luasnip.enable = true;

    # LANGUAGE
    treesitter = {
      enable = true;

      settings = {
        auto_install = true;
        ensure_installed = [
          "markdown"
        ];
      };
    };

    lsp = {
      enable = true;
      servers = {
        arduino_language_server.enable = true;
        clangd.enable = true;
        csharp_ls.enable = true;
        cssls.enable = true;
        emmet_ls.enable = true;
        html.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        ruff.enable = true;
        tsserver.enable = true;
        tailwindcss.enable = true;
        vuels.enable = true;
      };
    };

    conform-nvim = {
      enable = true;

      settings = {
        format_on_save = # Lua
          ''
            function(bufnr)
               -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                  lsp_format_opt = 'never'
                else
                  lsp_format_opt = 'fallback'
                end
                return {
                  timeout_ms = 500,
                  lsp_format = lsp_format_opt,
                }
            end
          '';
        formatters_by_ft = {};
      };
    };
    trouble.enable = true;
    render-markdown.enable = true;
  };
}
