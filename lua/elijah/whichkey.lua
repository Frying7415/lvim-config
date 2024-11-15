lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>Trouble diagnostics toggle<cr>", "Toggle" },
  b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer" },
  q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix list" },
  l = { "<cmd>Trouble loclist toggle<cr>", "Location list" },
  s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols"},
  r = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP references" },
}
lvim.builtin.which_key.mappings["H"] = {
  name = "Hurl",
  R = { "<cmd>HurlRunner<CR>", "Run All" },
  r = { "<cmd>HurlRunnerAt<CR>", "Run One" },
  m = { "<cmd>HurlToggleMode<CR>", "Toggle Mode" },
  t = {
    name = "Run to",
    e = { "<cmd>HurlRunnerToEntry<CR>", "Run to Entry" },
    E = { "<cmd>HurlRunnerToEnd<CR>", "Run from Current to End" },
  },
}
