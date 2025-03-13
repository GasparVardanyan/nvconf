local Module = {}
Module.__index = Module

---@class Module
---@field name string
---@field plugins table[] List of plugin spec tables
---@field loaded_plugins table<string, boolean> Tracks which plugins are loaded
local Module = {}
Module.__index = Module

---Create a new module
---@param name string
---@param plugins table[] List of plugin spec tables
---@return Module
function Module:new (name, plugins)
	local obj = setmetatable ({}, self)
	obj.name = name
	obj.plugins = plugins or {} ---@type table[]
	obj.loaded_plugins = {} ---@type table<string, boolean>

--	vim.api.nvim_create_autocmd ("User", {
--		pattern = name .. "Ready",
--		callback = function ()
--		end,
--	})

	vim.api.nvim_create_autocmd ("User", {
		pattern = "LazyLoad",
		callback = function (data)
			obj:mark_plugin_loaded (data.data)
		end,
	})

	return obj
end

---Mark a plugin as loaded and check if module is ready
---@param plugin string The name of the loaded plugin
function Module:mark_plugin_loaded (plugin)
	for _, spec in ipairs (self.plugins) do
		if spec [1] == plugin then
			self.loaded_plugins [plugin] = true
			self:check_ready ()
			break
		end
	end
end

---Check if all plugins are loaded, then emit name..Ready
function Module:check_ready ()
	for _, spec in ipairs (self.plugins) do
		if not self.loaded_plugins [spec [1]] then
		end
	end
end

if nil then

		---@class Module2
		---@field name string The name of the module
		---@field plugins table<string, boolean> The map of plugins managed by this module and their load status
		local Module2 = {}
		Module2.__index = Module2

		---Creates a new module instance.
		---@param name string The module name
		---@return Module2
		function Module2:new(name)
			local obj = setmetatable({
				name = name,
				plugins = {},
			}, self)

			-- Listen for the module ready event to load mappings
			vim.api.nvim_create_autocmd("User", {
				pattern = name .. "Ready",
				callback = function()
					require("mappings." .. name)
				end,
			})

			-- Listen for LazyLoad to track plugin loading
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyLoad",
				callback = function(data)
					local plugin_name = data.data
					if obj.plugins[plugin_name] ~= nil then
						obj.plugins[plugin_name] = true
						obj:check_ready()
					end
				end,
			})

			return obj
		end

		---Registers the plugins for this module.
		---@param plugins string[] A list of plugin repository names ("user/repo")
		function Module2:register_plugins(plugins)
			for _, repo in ipairs(plugins) do
				local name = repo:match(".*/(.*)") -- Extract only the repository name
				self.plugins[name] = false -- Initialize the plugin as not loaded
			end
		end

		---Checks if all plugins are loaded and emits the module ready event.
		function Module2:check_ready()
			for _, loaded in pairs(self.plugins) do
				if not loaded then
					return
				end
			end
			vim.api.nvim_exec_autocmds("User", { pattern = self.name .. "Ready" })
		end

		return Module2


return Module
