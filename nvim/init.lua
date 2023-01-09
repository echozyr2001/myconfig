---------------------
-- Global value
user_name = "zyr2"
home_path = user_name
core_path = user_name .. ".core"
plugins_path = user_name .. ".plugins"
config_path = user_name .. ".plugins.config"

function load_requires(path, require_list)
  for _, value in ipairs(require_list) do
    value = path .. "." .. value
    local statu, _ = pcall(require, value)
    if not statu then
      print(value .. " doesn't exist!")
      return
    end
  end
end

---------------------

require(user_name)
--load_requires("", {user_name})
