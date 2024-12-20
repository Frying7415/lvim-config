
local M = {}

M.config = function()
  vim.keymap.set(
    "n",
    "<leader>xx",
    function()
      require( "trouble" ).toggle()
    end,
    { desc = "Toggle trouble" }
  )
  vim.keymap.set(
    "n",
    "<leader>xw",
    function()
      require( "trouble" ).toggle("workspace_diagonostics")
    end,
    { desc = "Toggle workspace diagnostics" }
  )
  vim.keymap.set(
    "n",
    "<leader>xd",
    function()
      require( "trouble" ).toggle("document_diagonostics")
    end,
    { desc = "Toggle document diagnostics" }
  )
  vim.keymap.set(
    "n",
    "<leader>xq",
    function()
      require( "trouble" ).toggle("quickfix")
    end,
    { desc = "Toggle quickfix" }
  )
  vim.keymap.set(
    "n",
    "<leader>xl",
    function()
      require( "trouble" ).toggle("loclist")
    end,
    { desc = "Toggle loclist" }
  )
  vim.keymap.set(
    "n",
    "gR",
    function()
      require( "trouble" ).toggle("lsp_references")
    end,
    { desc = "Toggle LSP references" }
  )
end

return M
