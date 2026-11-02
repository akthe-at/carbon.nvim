-- nvim -u NONE -c 'set rtp+=.' -c 'luafile scripts/preview.lua'
-- Switch variants with :colorscheme carbon-day (or any Carbon variant).
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.cmd.colorscheme('carbon')
vim.cmd.enew()
vim.bo.buftype = 'nofile'
vim.bo.bufhidden = 'wipe'
vim.bo.swapfile = false
vim.bo.filetype = 'lua'
vim.api.nvim_buf_set_lines(0, 0, -1, false, {
 '-- Carbon preview: search, selection, diagnostics, diff, and completion',
 'local limit = 24',
 'local function collect(items)',
 '  local result = {}',
 '  for _, item in ipairs(items) do',
 '    result[#result + 1] = item.name',
 '  end',
 '  return result',
 'end',
 '',
 '-- Search: /result   Selection: use v or V on the code above',
 '-- Completion: :lua vim.fn.cursor(6, 5); vim.cmd("startinsert"); vim.fn.complete(1, {"result", "return", "require"})',
})
vim.cmd('syntax on')
vim.fn.setreg('/', 'result')
vim.opt.hlsearch = true
local ns = vim.api.nvim_create_namespace('carbon-preview')
local diagnostics = {}
for i, severity in ipairs({vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN,
  vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT}) do
 diagnostics[#diagnostics + 1] = {lnum = i + 1, col = 8, end_col = 14,
  severity = severity, message = ({'Unknown name', 'Unused parameter', 'Type information', 'Consider simplifying'})[i]}
end
vim.diagnostic.config({virtual_text = true, underline = true, signs = true})
vim.diagnostic.set(ns, 0, diagnostics)
for i, name in ipairs({'DiffAdd', 'DiffChange', 'DiffDelete'}) do
 vim.api.nvim_buf_set_extmark(0, ns, i + 4, 0, {line_hl_group = name})
end
vim.fn.cursor(6, 5)
