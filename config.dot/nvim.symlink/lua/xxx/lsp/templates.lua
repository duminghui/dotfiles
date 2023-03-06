local M = {}

local Log = require "xxx.core.log"
local utils = require "xxx.utils"
local lsp_utils = require "xxx.lsp.utils"
local lsp_opts = require "xxx.lsp.config"
local Table = require "xxx.utils.table"
local fmt = string.format


local ftplugin_dir = ""


local join_paths = _G.join_paths

function M.set_ftplugin_dir(new_ftplugin_dir)
    ftplugin_dir = new_ftplugin_dir
end

function M.remove_template_files()
    if ftplugin_dir == "" then
        return
    end
    -- remove any outdated files
    for _, file in ipairs(vim.fn.glob(ftplugin_dir .. "/*.lua", true, true)) do
        vim.fn.delete(file)
    end
    vim.fn.delete(ftplugin_dir, "d")
    Log:info(fmt("delete ftplugin template files end: %s", ftplugin_dir))
end

local skipped_filetypes = lsp_opts.automatic_configuration.skipped_filetypes
local skipped_servers = lsp_opts.automatic_configuration.skipped_servers
local ensure_installed_servers = lsp_opts.mason_lspconfig.setup.ensure_installed

---Check if we should skip generating an ftplugin file based on the server_name
---@param server_name string name of a valid language server
local function should_skip(server_name)
    -- ensure_installed_servers should take priority over skipped_servers
    return vim.tbl_contains(skipped_servers, server_name) and not vim.tbl_contains(ensure_installed_servers, server_name)
end

function M.generate_ftplugin(ft_servers)
    local filetype = ft_servers[1]
    local filename = join_paths(ftplugin_dir, filetype .. ".lua")
    for _, server_name in ipairs(ft_servers[2]) do
        local setup_cmd = string.format([[require("xxx.lsp.manager").setup(%q)]], server_name)
        -- overwrite the file completely
        utils.write_file(filename, setup_cmd .. "\n", "a")
    end
end

function M.filetype_servers_list(servers_names)
    servers_names = servers_names or lsp_utils.get_supported_servers()
    local ft_servers = {}
    for _, server_name in ipairs(servers_names) do
        if should_skip(server_name) then
            goto continue
        end

        -- get the supported filetypes and remove any ignored ones
        local filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(skipped_filetypes, ft)
        end, lsp_utils.get_supported_filetypes(server_name) or {})

        if not filetypes then
            goto continue
        end

        for _, filetype in ipairs(filetypes) do
            filetype = filetype:match "%.([^.]*)$" or filetype
            local entry = Table.find_first(ft_servers, function(t)
                return t[1] == filetype
            end)
            if entry then
                table.insert(entry[2], server_name)
            else
                table.insert(ft_servers, { filetype, { server_name } })
            end
        end

        ::continue::
    end
    return ft_servers
end

---Generates ftplugin files based on a list of server_names
---The files are generated to a runtimepath: "$LUNARVIM_RUNTIME_DIR/site/after/ftplugin/template.lua"
---@param servers_names? table list of servers to be enabled. Will add all by default
function M.generate_templates(servers_names)
    if ftplugin_dir == "" then
        return
    end

    local ft_len = #vim.fn.globpath(ftplugin_dir, "*.lua", 0, 1)
    local ft_servers_list = M.filetype_servers_list(servers_names)

    if ft_len ~= #ft_servers_list or not utils.is_directory(ftplugin_dir) then
        M.remove_template_files()
    else
        return
    end

    Log:debug "Templates installation in progress"

    -- create the directory if it didn't exist
    if not utils.is_directory(ftplugin_dir) then
        vim.fn.mkdir(ftplugin_dir, "p")
    end

    for _, ft_servers in ipairs(ft_servers_list) do
        M.generate_ftplugin(ft_servers)
    end
    Log:debug(fmt("Templates installation is complete(%s)", #ft_servers_list))
end

return M
