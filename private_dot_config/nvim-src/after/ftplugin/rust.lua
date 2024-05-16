-- print('this is in after\\ftplugin rust.lua')

local function nosupport_msg(cmd)
  return function()
    print(string.format("'%s' nosupport! it defined in nvim\\runtime\\ftplguin\\rust.vim", cmd))
  end
end

local buf_cmds = { 'RustRun', 'RustExpand', 'RustEmitIr', 'RustEmitAsm', 'RustFmt', 'RustFmtRange' }

for _, cmd in ipairs(buf_cmds) do
  vim.api.nvim_buf_del_user_command(0, cmd)
  -- pcall(vim.api.nvim_buf_del_user_command, 0, cmd)
  vim.api.nvim_buf_create_user_command(0, cmd, nosupport_msg(cmd), { desc = cmd .. ' nosupport!' })
end

local user_cmds = { 'RustPlay' }

for _, cmd in ipairs(user_cmds) do
  vim.api.nvim_del_user_command(cmd)
  -- pcall(vim.api.nvim_del_user_command, cmd)
  vim.api.nvim_create_user_command(cmd, nosupport_msg(cmd), { desc = cmd .. ' nosupport!' })
end
