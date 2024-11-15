lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "python",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css"
}

-- -- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "ruff_lsp" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "ruff" })
-- -- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "pyright"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- Function to get the Python path
local function get_python_path()
  -- Check if a Poetry environment is active
  local pyproject_path = vim.fn.getcwd() .. '/pyproject.toml'
  if vim.fn.filereadable(pyproject_path) == 1 then
    local venv_path = vim.fn.trim(vim.fn.system('poetry env info --path 2>/dev/null'))
    if vim.fn.empty(venv_path) == 0 then
      return venv_path .. '/bin/python' -- Path to Python inside the Poetry virtual environment
    end
  end
  -- Fallback to system Python
  return vim.fn.trim(vim.fn.system('which python'))
end
-- Assign the Python path to a variable
local python_path = get_python_path()

local dap = require('dap')
dap.adapters.python = {
  type = 'executable',
  command = python_path,
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}', -- This will launch the current file
    pythonPath = function()
      return get_python_path()
    end,
    cwd = vim.fn.getcwd(),
    env = {
      PYTHONPATH = vim.fn.getcwd(),
    },
  },
}
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.errorbells = true

-- FOLDS
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldtext = ""
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4


lvim.builtin.lualine.sections.lualine_c = { "branch" }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "autopep8" } }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "flake8",
    args = {
      "--max-line-length",
      "120"
    },
    extra_args = {
      "--max-line-length",
      "120"
    },
    filetypes = { "python" }
  }
}

lvim.lang.python.formatters = {
  {
    exe = "flake8",
    args = { "--max-line-length=120", "--extend-ignore=F841" },
  }
}

lvim.lsp.on_attach_callback = function(client, bufnr)
  -- …
  require"lsp_signature".on_attach()
  -- …
end

