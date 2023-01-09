-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
    print("installing packer...")
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    print("packer installed!")
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local status_packer, packer = pcall(require, "packer")
if not status_packer then
  print("packer doesn't not installed!")
  return
end

-- auto reload neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-list.lua source <afile> | PackerSync
  augroup end
]])

local status_plugin_list, plugin_list = pcall(require, user_name .. ".plugins.plugin-list")
if not status_plugin_list then
  print("plugin-list doesn't exist!")
end

return packer.startup(function(use)
  -- packer plugins manager
  use("wbthomason/packer.nvim")

  -- load plugins
  if plugin_list ~= nil then
    for _, plugin in ipairs(plugin_list) do
      print(plugin)
    end
  end

  -- automatically set configuration
  if packer_bootstrap then
    packer.sync()
  end
end)
