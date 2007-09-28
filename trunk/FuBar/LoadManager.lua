-- A load manager for FuBar-dependent addons.
-- This module is intend to replace FuBar's load manager so that plugins can load correctly when FuBar is not loaded.

--[[
Intended functionalties:
	* Gives a list of FuBar-dependent LoD addons.
	* Show load state of addons.
	* Let user specify whether the addon will be loaded or not.
]]

--[[
Load manager functionalities in original Fubar which I am NOT going to support:
	* plugin.GetLoadCondition : Plugin-defined load condition string.
		- this is only checked on load, which is too weak to be enough as a customizable
			load condition. Instead of trying to implement a load manager which makes
			sense, I'd rather educate the users to use LoadManager.
		- seems no plugin ever implemented it, may be some only-ckknight-use plugins.
	* LoadAddonWrapper : Attempts to enable and load plugin dependencies.
		- user should be responsible for enabling the necessary dependencies.
]]

local LoadManager = {}

if _G["FuBar"] then
	_G["FuBar"].modules["LoadManager"] = LoadManager
end

-- Stores a list of FuBar-dependent LoD addons.
LoadManager.addons = {}

-- Refresh the FuBar-dependent addon list.
function LoadManager.RefreshAddonList()
	local addons = LoadManager.addons
	for k in pairs(addons) do
		addons[k] = nil
	end
	for i = 1, GetNumAddOns() do
		local name = GetAddOnInfo(i)
		if IsAddOnLoadOnDemand(i) and LoadManager.IsFuBarDependent(name) then
			table.insert(addons, name)
		end
	end
end

function LoadManager.IterateAddonList()
	return ipairs(LoadManager.addons)
end

function LoadManager.GetAddonLoadState(name)
	if not LoadManager.db or not LoadManager.db.disabled then
		return true
	end
	return not LoadManager.db.disabled[name]
end


function LoadManager.SetAddonLoadState(name, loadState)
	if not LoadManager.db or not LoadManager.db.disabled then
		return false
	end
	LoadManager.db.disabled[name] = not loadState
end


--[[
Current DB format:
	db = {
		disabled = {
			disabledAddonA = true,
			disabledAddonB = true,
			...
		}
	}
]]
function LoadManager.SetDB(db)
	if type(db) ~= 'table' then
		LoadManager.db = nil
	else
		LoadManager.db = db
		if not db.disabled then
			db.disabled = {}
		end
	end
end

do -- Core.isFuBarDependent(name)
	local function ProcessReturns(...)
		for i = 1, select("#", ...) do
			local dep = select(i, ...)
			if dep == "FuBar" then
				return true
			end
		end
	end
	function LoadManager.IsFuBarDependent(name)
		local data = GetAddOnMetadata(name, "X-FuBar-Dependent")
		data = tonumber(data) or data
		if data and data ~= 0 then
			return true
		end
		return ProcessReturns(GetAddOnDependencies(name))
	end
end


function LoadManager.LoadLODPlugins()
	local disabled = db and db.disabled
	for i = 1, GetNumAddOns() do
		local name, _, _, enabled, loadable = GetAddOnInfo(i)
		if IsAddOnLoadOnDemand(i) and enabled and loadable and not IsAddOnLoaded(i) then
			if LoadManager.IsFuBarDependent(name) then
				LoadAddOn(name)
			end
		end
	end
end
