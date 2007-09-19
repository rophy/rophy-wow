	if true then

		local FuBarPlugin = AceLibrary("FuBarPlugin-2.0")
		local nSideBar = LibStub("nSideBar")
		local FuBar = _G["FuBar"]

		if not FuBar then error("NoFuBar") end

		local Core = {}
		FuBar.nSideBarMapper = Core
		
		Core.plugins = {}
		
		
		function Core.IsButtonPlugin(plugin)
			return ( not plugin.OnTextUpdate and plugin.UpdateText == FuBarPlugin.UpdateText )
		end

		function Core.RegisterPlugin(plugin)
			if not Core.IsButtonPlugin(plugin) then
				return false
			end
			Core.Convert(plugin)
			return true
		end

		local scriptsToMap = { "OnMouseDown", "OnMouseUp", "OnDoubleClick", "OnClick", "OnEnter", "OnLeave" }
		function Core.Convert(plugin)
			local iconPath = plugin.iconFrame and plugin.iconFrame:GetTexture()
			local button = nSideBar.AddButton(plugin:GetTitle(), iconPath)
			local pluginFrame = plugin.frame
			button.self = plugin
			for i, script in ipairs(scriptsToMap) do
				local pluginHandler = pluginFrame:GetScript(script)
				if pluginHandler then
					local buttonHandler = button:GetScript(script)
					if buttonHandler then
						button:SetScript(script, function(...)
							buttonHandler(...)
							pluginHandler(...)
						end)
					else
						button:SetScript(script, pluginHandler)
					end
				end
			end
			plugin.frame = button
			plugin.CheckWidth = function() end
		end
		
		function Core.ConvertPlugins()
		end
		
		
	end
	