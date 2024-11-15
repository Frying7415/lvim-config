local M = {}

M.config = function()
  vim.keymap.set(
    "n",
    "<leader>gt",
    "<CMD>Gitsigns toggle_current_line_blame<CR>",
    {}
  )
  vim.keymap.set(
    "n",
    "<leader>gp",
    "<CMD>Gitsigns preview_hunk<CR>",
    {desc = "Preview hunk"}
)
end

return M
