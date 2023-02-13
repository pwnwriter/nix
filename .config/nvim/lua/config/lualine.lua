local ok, lualine = pcall(require, 'lualine')
if not ok then return end

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local config = {
  options = {
    theme = 'auto',
    -- Disable sections and component separators
    component_separators = { left = '»', right = '«' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'netrw', 'carbon.explorer' }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color_fg = {
      n = colors.blue,
      i = colors.magenta,
      v = colors.red,
      V = colors.red,
      s = colors.orange,
      S = colors.orange,
      R = colors.violet,
      Rv = colors.violet,
      r = colors.cyan,
      rm = colors.cyan,
    }

    return { fg = mode_color_fg[vim.fn.mode()], gui = 'bold' }
  end,
  padding = { right = 1 }, -- We don't need space before this
}

ins_left {
  function()
    return ''
  end,
  color = { fg = colors.red, gui = 'bold' }
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
  color = { fg = '#ffffff', gui = 'bold' },
  separator = ''
}

ins_left {
  function()
    return '%='
  end,
  separator = ''
}

ins_left {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  separator = ''
}

ins_right {
  'filetype',
  fmt = string.lower,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.blue, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.yellow, gui = 'bold' },
}

ins_right {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color_fg = {
      n = colors.blue,
      i = colors.magenta,
      v = colors.red,
      V = colors.red,
      s = colors.orange,
      S = colors.orange,
      R = colors.violet,
      Rv = colors.violet,
      r = colors.cyan,
      rm = colors.cyan,
    }

    return { fg = mode_color_fg[vim.fn.mode()], gui = 'bold' }
  end,
  padding = { left = 1 }, -- We don't need space before this
}

lualine.setup(config)

