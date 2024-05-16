local function get_short_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local M = {}

M.sections = {
  lualine_a = { get_short_cwd },
}

M.filetypes = { 'neo-tree' }

return M
