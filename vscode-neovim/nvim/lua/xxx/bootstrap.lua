local M = {}

if vim.fn.has "nvim-0.7" ~= 1 then
    vim.notify(
        "Please upgrade your Neovim base installation. Lunarvim requires v0.7+",
        vim.log.levels.WARN)
    vim.wait(5000, function() return false end)
    vim.cmd "cquit"
end

---Require a module in protected mode without relying on its cached value
---@param module string
---@return any
function _G.require_clean(module)
    package.loaded[module] = nil
    _G[module] = nil
    local _, requested = pcall(require, module)
    return requested
end

function _G.get_cache_dir()
    -- cache_dir = Local\Temp\nvim.x
    local cache_dir = vim.call("stdpath", "cache") or ""
    cache_dir = join_paths(cache_dir:match("(.*[/\\])"):sub(1, -2), "nvim.x")
    return cache_dir
end

---Initialize the `&runtimepath` variables and prepare for startup
---@return table
function M:init_rtp(root_dir, base_dir)
    self.root_dir = root_dir
    -- base_dir: root_dir/nvim
    self.base_dir = base_dir
    -- runtime_dir root_dir/nvim-data
    self.data_dir = join_paths(root_dir, "nvim-data")
    -- config_dir: root_dir/nvim
    self.config_dir = base_dir
    -- cache_dir: temp_dir
    self.cache_dir = get_cache_dir()

    -- print("-----------")
    -- print("root_dir:            ", self.root_dir)
    -- print("base_dir:            ", self.base_dir)
    -- print("config_dir:          ", self.config_dir)
    -- print("data_dir:            ", self.data_dir)
    -- print("cache_dir:           ", self.cache_dir)

    ---@meta overridden to use CACHE_DIR instead, since a lot of plugins call this function interally
    ---NOTE: changes to "data" are currently unstable, see #2507
    vim.fn.stdpath = function(what)
        local path = ""
        -- local what_msg = what
        if what == "config" then
            path = self.config_dir
        elseif what == "data" then
            path = self.data_dir
            -- what_msg = what .. "  "
        elseif what == "cache" then
            path = _G.get_cache_dir()
            -- what_msg = what .. " "
        elseif what == "log" then
            path = self.data_dir
        else
            path = vim.call("stdpath", what) or ""
        end
        -- print(what .. ": " .. path)
        return path
    end

    -- print("####: ", vim.call("stdpath", "data"))
    -- print("####: ", vim.fn.stdpath("data"))

    vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site"))
    vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site", "after"))
    vim.opt.rtp:prepend(join_paths(self.data_dir, "site"))
    vim.opt.rtp:append(join_paths(self.data_dir, "site", "after"))

    vim.opt.rtp:remove(vim.call("stdpath", "config"))
    vim.opt.rtp:remove(join_paths(vim.call("stdpath", "config"), "after"))
    vim.opt.rtp:prepend(self.config_dir)
    vim.opt.rtp:append(join_paths(self.config_dir, "after"))
    --
    -- -- TODO: we need something like this: vim.opt.packpath = vim.opt.rtp
    vim.cmd [[let &packpath = &runtimepath]]
    -- end

    return self
end

return M
