if not AceLibrary then return end

local L = setmetatable({}, {__index = function(t,k) return k end})
local Menu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0")

function Menu:RefreshOptions()
	local registry = rConfiguration:GetRegistry()
	local options = self.options
	for i, config in ipairs(registry) do
		if config.name and ( config.enable or config.disable ) then
			local state 
			if config.enable and config.disable then
				state = "(O) "
			elseif config.enable and not config.disable then
				state = "(+) "
			elseif not config.enable and config.disable then
				state = "(-) "
			end
			local name = state .. config.name
			local option = {
				type = "toggle",
				name = name,
				desc = L["Click to toggle, Shift-Click to enable, Alt-Click to disable."],
				order = config.order,
				get = function() return config.enabled end,
				set = function(enable)
					if IsAltKeyDown() then	-- Hold Alt to force disable.
						enable = false
					elseif IsShiftKeyDown() then	-- Hold Shift to force enable.
						enable = true
					end
					if enable and config.enable then
						config.enabled = config.enable()
					elseif not enable and config.disable then
						config.enabled = not config.disable()
					end
				end,
			}
			options.args[name] = option
		end
	end
end

function Menu:OnEnable()
	local options = {
		type = "group",
		name = L["rConfiguration"],
		desc = L["Enable/Disable the configs"],
		args = {
			refresh = {
				type = "execute",
				name = L["Refresh"],
				desc = L["Reload the rConfiguration registry into options"],
				order = 1,
				func = "RefreshOptions"
			}
		},
	}
	self:RegisterChatCommand({"/rconfig"}, options)
	self.options = options
end
