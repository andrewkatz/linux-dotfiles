-- return {
--   "dracula/vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme dracula]])
--     vim.opt.termguicolors = true
--   end,
-- }
return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme carbonfox]])
  end,
}
-- return {
--   "navarasu/onedark.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("onedark").setup({
--       style = "light",
--     })
--     require("onedark").load()
--     vim.cmd([[colorscheme onedark]])
--     -- Set light background
--   end,
-- }
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme catppuccin-mocha]])
--   end,
-- }
