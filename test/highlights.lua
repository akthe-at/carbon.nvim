-- nvim --headless -u NONE -l test/highlights.lua
vim.opt.rtp:prepend(vim.fn.getcwd())
local function check()
  local function luminance(hex)
    local channels = {}
    for channel in hex:gmatch('%x%x') do
      local c = tonumber(channel, 16) / 255
      channels[#channels + 1] = c <= 0.04045 and c / 12.92 or ((c + 0.055) / 1.055) ^ 2.4
    end
    return channels[1] * 0.2126 + channels[2] * 0.7152 + channels[3] * 0.0722
  end
  local function contrast(a, b)
    a, b = luminance(a), luminance(b)
    return (math.max(a, b) + 0.05) / (math.min(a, b) + 0.05)
  end
  local function oklab(hex)
    local rgb = {}
    for v in hex:gmatch('%x%x') do
      local x = tonumber(v, 16) / 255
      rgb[#rgb + 1] = x <= 0.04045 and x / 12.92 or ((x + 0.055) / 1.055) ^ 2.4
    end
    local r, g, b = unpack(rgb)
    local l = (0.4122214708*r + 0.5363325363*g + 0.0514459929*b)^(1/3)
    local m = (0.2119034982*r + 0.6806995451*g + 0.1073969566*b)^(1/3)
    local t = (0.0883024619*r + 0.2817188376*g + 0.6299787005*b)^(1/3)
    return {0.2104542553*l + 0.793617785*m - 0.0040720468*t,
      1.9779984951*l - 2.428592205*m + 0.4505937099*t,
      0.0259040371*l + 0.7827717662*m - 0.808675766*t}
  end
  local function distance(a, b)
    a, b = oklab(a), oklab(b)
    return math.sqrt((a[1]-b[1])^2 + (a[2]-b[2])^2 + (a[3]-b[3])^2)
  end
  for _, style in ipairs({'carbon', 'carbon_day', 'carbon_contrast', 'carbon_day_neutral', 'carbon_day_contrast'}) do
    local c = require('carbon.palette').setup({style = style})
    for _, role in ipairs({'error', 'warning', 'func'}) do
      for _, surface in ipairs({'bg', 'cursor_line_bg', 'pmenu_bg'}) do
        assert(contrast(c[role], c[surface]) >= 4.5, style .. ': insufficient ' .. role .. ' contrast on ' .. surface .. ': ' .. contrast(c[role], c[surface]))
      end
    end
    for _, role in ipairs({'keyword', 'string', 'func', 'number', 'class', 'parameter', 'identifier', 'variable'}) do
      assert(distance(c.error, c[role]) >= 0.08, style .. ': error resembles ' .. role)
      for _, surface in ipairs({'float_bg', 'panel_bg', 'diff_add_bg', 'diff_remove_bg', 'diff_change_bg'}) do
        assert(contrast(c[role], c[surface]) >= 4.5, style .. ': ' .. role .. ' on ' .. surface)
      end
    end
    require('carbon').setup({style = style})
    require('carbon').load()
    local function applied(name)
      return vim.api.nvim_get_hl(0, {name = name, link = false})
    end
    local raw = applied('@markup.raw.block.markdown')
    local normal = applied('NormalFloat')
    assert(raw.fg == nil, style .. ': raw block forces a foreground over float text')
    assert(raw.bg == nil, style .. ': code block overrides hover background')
    for _, name in ipairs({'Search', 'CurSearch', 'Visual', 'MatchParen', 'DiagnosticVirtualTextError', 'DiagnosticVirtualTextWarn'}) do
      local h = applied(name)
      assert(contrast(string.format('#%06x', h.fg), string.format('#%06x', h.bg)) >= 4.5,
        style .. ': insufficient applied contrast for ' .. name)
    end
    assert(applied('Search').bg ~= applied('Visual').bg, 'search looks like selection')
    assert(applied('CurSearch').underline and applied('CurSearch').bold, 'current match lacks emphasis')
    for _, role in ipairs({'comment', 'constant', 'link', 'hint', 'fg_dark', 'git_change', 'git_add', 'string', 'number', 'parameter'}) do
      if c[role] then
        for _, surface in ipairs({'bg', 'cursor_line_bg', 'pmenu_bg'}) do
          assert(contrast(c[role], c[surface]) >= (role == 'comment' and 3 or 4.5),
            style .. ': low contrast ' .. role .. ' on ' .. surface)
        end
      end
    end
    for _, name in ipairs({'PmenuSel', 'PmenuKindSel', 'PmenuExtraSel'}) do
      local h = applied(name)
      assert(contrast(string.format('#%06x', h.fg), string.format('#%06x', h.bg)) >= 4.5,
        style .. ': unreadable selected completion ' .. name)
    end
    assert(contrast(c.diff_change, c.diff_change_bg) >= 4.5, style .. ': DiffText')
    for _, name in ipairs({'Type', 'Typedef', '@type', '@type.builtin', '@type.definition', '@constructor', '@lsp.type.interface'}) do
      assert(applied(name).fg == tonumber(c.class:sub(2), 16), style .. ': inconsistent type ' .. name)
    end
    assert(c.html_attr == c.parameter, style .. ': fields differ from parameters')
    assert(c.warning ~= c.func, 'warning duplicates syntax')
    assert(c.parameter ~= c.variable, style .. ': parameter is indistinguishable from variables')
    assert(c.identifier ~= c.class, style .. ': module names are indistinguishable from types')
    assert(contrast(c.border, c.bg) < contrast(c.fg, c.bg), 'border competes with text')
  end
  local carbon = require('carbon')
  local function hl(name) return vim.api.nvim_get_hl(0, { name = name, link = false }) end
  for _, style in ipairs({'carbon', 'carbon_day', 'carbon_contrast', 'carbon_day_neutral', 'carbon_day_contrast'}) do
    for _, transparent in ipairs({false, true}) do
      carbon.setup({style = style, transparent = transparent, groups = {error = '#123456', h1 = '#abcdef'}})
      carbon.load()
      assert(hl('Normal').fg, style .. ': missing foreground')
      assert(hl('CursorLine').bg, 'transparency removed cursor-line emphasis')
      assert(hl('DiffAdd').bg, 'transparency removed diff emphasis')
      assert(hl('DiagnosticError').fg == 0x123456)
      assert(hl('SnacksNotifierError').fg == hl('DiagnosticError').fg)
      assert(hl('SnacksPickerDiagnosticError').fg == hl('DiagnosticError').fg)
      assert(hl('RenderMarkdownH1Fg').fg == 0xabcdef)
      if transparent then
        for _, name in ipairs({'Normal', 'NormalFloat', 'SnacksNormal', 'SnacksDashboardNormal', 'SnacksPickerNormal', 'SnacksPickerList', 'SnacksPickerPreview'}) do
          assert(hl(name).bg == nil, name .. ': opaque')
        end
      else assert(hl('Normal').bg, style .. ': missing background') end
      for _, pair in ipairs({{'@lsp.type.comment','@comment'}, {'@lsp.type.function','@function'}, {'@lsp.type.method','@function.method'}, {'@lsp.type.parameter','@variable.parameter'}}) do
        assert(vim.deep_equal(hl(pair[1]), hl(pair[2])), pair[1] .. ': inconsistent semantic role')
      end
    end
  end
  carbon.setup({transparent = true, styles = {comments = {italic = false}}, on_colors = function(c) c.error = '#654321' end,
    on_highlights = function(h) h.SnacksNormal = {bg = '#112233'} end,
    before_highlight = function(name, h) if name == 'SnacksNormal' then h.bold = true end end})
  carbon.load()
  assert(hl('DiagnosticError').fg == 0x654321)
  assert(hl('SnacksNormal').bg == 0x112233 and hl('SnacksNormal').bold)
  assert(not hl('@lsp.type.comment').italic)
  carbon.setup({styles = {functions = {bold = false}, properties = {bold = false}}})
  carbon.load()
  assert(not hl('@function').bold)
  assert(vim.deep_equal(hl('@operator'), hl('Operator')))
  assert(vim.deep_equal(hl('@lsp.type.operator'), hl('Operator')))
  carbon.setup({})
  carbon.load()
  -- An unrelated theme's background must survive entering another window.
  vim.g.colors_name = 'other-theme'
  vim.o.background = 'light'
  vim.api.nvim_exec_autocmds('WinEnter', {})
  assert(vim.o.background == 'light', 'Carbon changed another theme background')
  vim.o.background = 'dark'
  vim.cmd.colorscheme('carbon-auto')
  assert(vim.g.colors_name == 'carbon')
  vim.o.background = 'light'
  vim.cmd.colorscheme('carbon-auto')
  assert(vim.g.colors_name == 'carbon-day')
  vim.cmd.colorscheme('carbon-contrast')
  local lualine = require('lualine.themes.carbon')
  assert(lualine.normal.c.fg == require('carbon.palette').carbon_contrast.fg)
  vim.cmd.colorscheme('carbon-day-neutral')
  lualine = require('lualine.themes.carbon')
  assert(lualine.normal.c.fg == require('carbon.palette').carbon_day_neutral.fg)
  assert(not hl('SnacksNormal').bold, 'reload retained old style')
end
local ok, err = pcall(check)
if not ok then vim.api.nvim_err_writeln(err); vim.cmd('cquit') end
print('Highlight checks passed')
vim.cmd('qa!')
