local ok, wk = pcall(require, 'which-key')
if not ok then
  return
end

wk.add({
  { "<Leader>b", group = "buffers" },
  { "<Leader>bi", desc = "Buffers" },
  { "<Leader>f", group = "files" },
  { "<Leader>ff", desc = "Find File" },
  { "<Leader>fr", desc = "Old files" },
  { "<Leader>gg", desc = "live_grep" },
  { "<Leader>h", group = "helps" },
  { "<Leader>hk", desc = "Show keymaps" },
  { "<Leader>ht", desc = "Show help tags" },
})
