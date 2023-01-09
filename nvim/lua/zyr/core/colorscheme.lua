local setup, _ = pcall(vim.cmd, "colorscheme nord")
if not setup then
  print("colorscheme not setup!")
  return
end
