local M = {}

M.config = function()
  -- Set up folding options
  vim.o.foldcolumn = '4'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.o.fillchars = "foldopen:▼,foldclose:►,foldsep:╎,fold:┈"

  -- Configure nvim-ufo with custom fold icons
  require('ufo').setup({
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" ↕ %d "):format(endLnum - lnum)  -- customize icon here
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, {chunkText, chunk[2]})
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, "MoreMsg"})
      return newVirtText
    end
  })
end

return M
