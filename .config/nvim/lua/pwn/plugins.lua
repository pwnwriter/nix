local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')
if not ok then return end

lazy.setup({

  ----- Colorschemes -------
  -- { 'catppuccin/nvim'},
  -- Rosepine 

  {'rose-pine/neovim'},

  ------- Treesitter ---------
      {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = "BufEnter",
        config = function() require "config/treesitter" end,
        build = ":TSUpdate",
    },

      -- bars
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require "config/lualine" end,
    },

  ------ Bufferline ---- 
  { "akinsho/bufferline.nvim" },

  ----- Nvim tree ---
  { "nvim-tree/nvim-tree.lua" }, 

  ----- Auto completion ----
  --
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim"},
  { "williamboman/mason.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
 	{ "simrat39/rust-tools.nvim" },

  { "akinsho/toggleterm.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },


  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  { "windwp/nvim-autopairs" },
  { "hrsh7th/vim-vsnip" },


})
