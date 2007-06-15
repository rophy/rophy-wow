if SimpleBankState then
	SimpleBankState:UpdateLocales({
	
		-- Column Headers
		["Item Name"] = true,
		["Rarity"] = true,
		["Quantity"] = "Count",
		["Owner"] = true,
		["Location"] = "Loc",
		["Type"] = true,
		["Equip Loc"] = "InvSlot",
		
		-- Rarities.
		["Poor"] = true,
		["Normal"] = true,
		["Good"] = true,
		["Rare"] = true,
		["Epic"] = true,
		["Legendary"] = true,
		["Artifact"] = true,
		
		-- Locations
		["BAG"] = "Bag",
		["BANK"] = "Bank",
		["MAIL"] = "Mailbox",
		["INVENTORY"] = "Wearing",
		
		-- Equip Locations.
		[""] = "",
		["INVTYPE_AMMO"] = "Ammo",
		["INVTYPE_HEAD"] = "Head",
		["INVTYPE_NECK"] = "Neck",
		["INVTYPE_SHOULDER"] = "Shoulder",
		["INVTYPE_BODY"] = "Shirt",
		["INVTYPE_CHEST"] = "Chest",
		["INVTYPE_ROBE"] = "Robe",
		["INVTYPE_WAIST"] = "Waist",
		["INVTYPE_LEGS"] = "Legs",
		["INVTYPE_FEET"] = "Feet",
		["INVTYPE_WRIST"] = "Wrist",
		["INVTYPE_HAND"] = "Hands",
		["INVTYPE_FINGER"] = "Fingers",
		["INVTYPE_TRINKET"] = "Trinkets",
		["INVTYPE_CLOAK"] = "Cloaks",
		["INVTYPE_WEAPON"] = "One-Hand",
		["INVTYPE_SHIELD"] = "Shield",
		["INVTYPE_2HWEAPON"] = "Two-Handed",
		["INVTYPE_WEAPONMAINHAND"] = "Main-Hand Weapon",
		["INVTYPE_WEAPONOFFHAND"] = "Off-Hand Weapon",
		["INVTYPE_HOLDABLE"] = "Held In Off-Hand",
		["INVTYPE_RANGED"] = "Bows Guns or Crossbows",
		["INVTYPE_THROWN"] = "Ranged",
		["INVTYPE_RANGEDRIGHT"] = "Wands",
		["INVTYPE_RELIC"] = "Relics",
		["INVTYPE_TABARD"] = "Tabard",
		["INVTYPE_BAG"] = "Containers",
		
		-- SearchFrame Texts.
		["Search:"] = true,
		["No Type Available"] = true,
		["Refresh"] = true,
		
		-- SearchFrame Tooltips.
		["Left click to select what columns to show."] = true,
		["Left click to sort."] = true,
		["Left click to sort, right click to filter."] = true,
		["The item type list will be built after you do an initial search."] = true,

		
	})
end
