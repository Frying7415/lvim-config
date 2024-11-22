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

lvim.builtin.which_key.mappings["G"] = {
  name = "GitLab",
  c = {
    name = "Create MR",
    C = { "<cmd>lua require('gitlab').create_mr()<CR>", "Create MR for current branch" },
    u = { "<cmd>lua require('gitlab').copy_mr_url()<CR>", "Copy link to MR" },
    o = { "<cmd>lua require('gitlab').open_in_browser()<CR>", "Open MR in browser" },
    a = {
      name = "Assignee",
      a = { "<cmd>lua require('gitlab').add_assignee()<CR>", "Add" },
      d = { "<cmd>lua require('gitlab').delete_assignee()<CR>", "Delete" },
    },
    r = {
      name = "Reviewer",
      a = { "<cmd>lua require('gitlab').add_reviewer()<CR>", "Add" },
      d = { "<cmd>lua require('gitlab').delete_reviewer()<CR>", "Delete" },
    },
    l = {
      name = "Label",
      a = { "<cmd>lua require('gitlab').add_label()<CR>", "Add" },
      d = { "<cmd>lua require('gitlab').delete_label()<CR>", "Delete" },
    },
  },
  r = {
    name = "Review MR",
    A = { "<cmd>lua require('gitlab').approve()<CR>", "Approve MR" },
    c = { "<cmd>lua require('gitlab').choose_merge_request()<CR>", "Choose MR"},
    R = { "<cmd>lua require('gitlab').revoke()<CR>", "Revoke MR approval" },
    s = { "<cmd>lua require('gitlab').summary()<CR>", "Show MR summary" },
    S = { "<cmd>lua require('gitlab').start_review()<CR>", "Start MR Review" },
    u = { "<cmd>lua require('gitlab').copy_mr_url()<CR>", "Copy link to MR" },
    o = { "<cmd>lua require('gitlab').open_in_browser()<CR>", "Open MR in browser" },
    n = { "<cmd>lua require('gitlab').create_note()<CR>", "Create a note to MR" },
    p = { "<cmd>lua require('gitlab').pipeline()<CR>", "Show pipeline status" },
    d = { "<cmd>lua require('gitlab'),toggle_discussion()<CR>", "Toggle discussion window" },
    D = { "<cmd>lua require('gitlab').toggle_draft_mode()<CR>", "Toggle draft mode" },
    P = { "<cmd>lua require('gitlab'),publush_all_drafts()<CR>", "Publish all drafts" },
    a = {
      name = "Assignee",
      a = { "<cmd>lua require('gitlab').add_assignee()<CR>", "Add" },
      d = { "<cmd>lua require('gitlab').delete_assignee()<CR>", "Delete" },
    },
    r = {
      name = "Reviewer",
      a = { "<cmd>lua require('gitlab').add_reviewer()<CR>", "Add" },
      d = { "<cmd>lua require('gitlab').delete_reviewer()<CR>", "Delete" },
    },
  },
}
