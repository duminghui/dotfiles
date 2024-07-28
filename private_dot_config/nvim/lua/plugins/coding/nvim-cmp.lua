local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return false
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- TODO(kylo252): upstream this
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
        or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return luasnip.in_snippet() and luasnip.jumpable(-1)
  else
    -- return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
    return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
  end
end

local M = {}
---@param _ LazyPlugin
---@param opts cmp.ConfigSchema
M.opts = function(_, opts)
  local icons = xxx.icons

  local cmp = require("cmp")
  local cmp_types = require("cmp.types.cmp")
  local ConfirmBehavior = cmp_types.ConfirmBehavior
  local SelectBehavior = cmp_types.SelectBehavior
  local cmp_mapping = require("cmp.config.mapping")

  local opts_meta = {
    max_width = 50,
    kind_icons = icons.kinds(),
    source_names = {
      nvim_lsp = "[LSP]",
      emoji = "[Emoji]",
      path = "[Path]",
      calc = "[Calc]",
      cmp_tabnine = "[Tabnine]",
      vsnip = "[Snippet]",
      luasnip = "[Snippet]",
      buffer = "[Buffer]",
      tmux = "[TMUX]",
      copilot = "[Copilot]",
      treesitter = "[Treesitter]",
      cmdline = "[Cmdline]",
      snippets = "[Snippets]",
      lazydev = "Lazydev",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = nil,
      luasnip = 1,
    },
    duplicate_default = nil,
    confirm_opts = {
      behavior = ConfirmBehavior.Replace,
      select = true,
    },
    cmdline = {
      enable = true,
      options = {
        {
          type = ":",
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        },
        {
          type = { "/", "?" },
          sources = {
            { name = "buffer" },
          },
        },
      },
    },
  }

  local auto_select = false
  ---@type cmp.ConfigSchema
  local opts_new = {
    meta = opts_meta,
    enabled = function()
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
      if buftype == "prompt" then
        return false
      end
      return true
    end,
    -- confirmation = {
    --   default_behavior = ConfirmBehavior.Insert,
    --   get_commit_characters = function(commit_characters)
    --     vim.print(commit_characters)
    --     return commit_characters
    --   end,
    -- },
    completion = {
      completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      keyword_length = 1,
    },
    preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    experimental = {
      ghost_text = true,
    },
    formatting = {
      meta = {},
      fields = { "abbr", "kind", "menu" },
      expandable_indicator = false,
      format = function(entry, item)
        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. icons.ui.Ellipsis
          end
        end

        local lazy_icons = LazyVim.config.icons.kinds
        if lazy_icons[item.kind] then
          item.kind = lazy_icons[item.kind] .. item.kind
        end

        if entry.source.name == "crates" then
          item.kind = icons.misc.Package
          item.kind_hl_group = "CmpItemKindCrate"
        end

        item.menu = opts_meta.source_names[entry.source.name] or entry.source.name
        item.dup = opts_meta.duplicates[entry.source.name] or opts_meta.duplicate_default
        return item
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      completion = {
        border = "single",
      },
      documentation = {
        border = "single",
      },
    },
    mapping = cmp_mapping.preset.insert({
      ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item({ behavior = SelectBehavior.Select }), { "i" }),
      ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item({ behavior = SelectBehavior.Select }), { "i" }),
      ["<C-b>"] = cmp_mapping.scroll_docs(-4),
      ["<C-f>"] = cmp_mapping.scroll_docs(4),
      -- ["<C-y>"] = cmp_mapping({
      --   i = cmp_mapping.confirm({ behavior = ConfirmBehavior.Replace, select = false }),
      --   c = function(fallback)
      --     if cmp.visible() then
      --       cmp.confirm({ behavior = ConfirmBehavior.Replace, select = false })
      --     else
      --       fallback()
      --     end
      --   end,
      -- }),
      ["<Tab>"] = cmp_mapping(function(fallback)
        local ok, luasnip = pcall(require, "luasnip")
        if cmp.visible() then
          cmp.select_next_item()
        elseif ok and luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif ok and jumpable(1) then
          luasnip.jump(1)
        elseif has_words_before() then
          -- cmp.complete()
          fallback()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp_mapping(function(fallback)
        local ok, luasnip = pcall(require, "luasnip")
        if cmp.visible() then
          cmp.select_prev_item()
        elseif ok and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<C-Space>"] = cmp_mapping.complete(),
      ["<C-e>"] = cmp_mapping.abort(),
      -- LazyVim/lua/lazyvim/plugins/coding.lua
      ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
      ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
      ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
      -- ["<CR>"] = cmp_mapping(function(fallback)
      --   if cmp.visible() then
      --     local confirm_opts = vim.deepcopy(opts_meta.confirm_opts) -- avoid mutating the original opts below
      --     local is_insert_mode = function()
      --       ---@diagnostic disable-next-line:undefined-field
      --       return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
      --     end
      --     if is_insert_mode() then -- prevent overwriting brackets
      --       confirm_opts.behavior = ConfirmBehavior.Insert
      --     end
      --     ---@type cmp.Entry|nil
      --     local entry = cmp.get_selected_entry()
      --     local is_copilot = entry and entry.source.name == "copilot"
      --     if is_copilot then
      --       confirm_opts.behavior = ConfirmBehavior.Replace
      --       confirm_opts.select = true
      --     end
      --     if cmp.confirm(confirm_opts) then
      --       return -- success, exit early
      --     end
      --   end
      --   fallback() -- if not exited early, always fallback
      -- end),
    }),
  }

  -- table.insert(opts.sources, { name = "nvim_lsp_signature_help" })

  LazyVim.merge(opts, opts_new)
end

---@class CustomCmpConfigSchema : cmp.ConfigSchema
---@field meta table

---@param _ LazyPlugin
---@param opts CustomCmpConfigSchema
M.config = function(_, opts)
  opts = opts or {}
  local cmp = require("cmp")
  cmp.setup(opts)

  local cmdLineOpts = opts.meta.cmdline or {}
  if cmdLineOpts.enable then
    for _, option in ipairs(cmdLineOpts.options) do
      cmp.setup.cmdline(option.type, {
        mapping = cmp.mapping.preset.cmdline({
          ["<CR>"] = function(fallback)
            -- 即使加了这个, 也不会进入到这个方法中
            return fallback()
          end,
        }),
        sources = option.sources,
      })
    end
  end
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- since nvim 0.10 had vim.lsp.buf.signature_help()
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-cmdline",
  },
  opts = M.opts,
  config = M.config,
}
