
CombatLogScribeDB = {
	["events"] = {
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = {
			["AURAADDEDOTHERHELPFUL"] = {
				"%s gains %s.", -- [1]
				"Seasoned Guardian gains Shield Block.", -- [2]
			},
			["POWERGAINOTHERSELF"] = {
				"You gain %d %s from %s's %s.", -- [1]
				"You gain 10 Mana from Unknown Entity's Blessing of Wisdom.", -- [2]
			},
			["PERIODICAURAHEALOTHEROTHER"] = {
				"%s gains %d health from %s's %s.", -- [1]
				"Hatecrest Screamer gains 80 health from Hatecrest Screamer's Renew.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHELPFUL"] = {
				"%s gains %s (%d).", -- [1]
				"Hulking Helboar gains Hulk (2).", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Angelstouch gains 15 Mana from Unknown Entity's Blessing of Wisdom.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE"] = {
			["PERIODICAURADAMAGEOTHEROTHER"] = {
				"%s suffers %d %s damage from %s's %s.", -- [1]
				"Minimonty suffers 89 Fire damage from Randomize's Flamestrike.", -- [2]
			},
			["AURAADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s.", -- [1]
				"Pete is afflicted by Earthbind.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Pestillence's Corruption is absorbed by Mos.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Rein's Viper Sting drains 154 Mana from Althion.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s (%d).", -- [1]
				"Mistick is afflicted by Sunder Armor (2).", -- [2]
			},
			["PERIODICAURADAMAGEOTHER"] = {
				"%s suffers %d %s damage from %s.", -- [1]
				"Kruztique suffers 255 Fire damage from Flame Wave.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Flame Wave is absorbed by Kruztique.", -- [2]
			},
			["PERIODICAURADAMAGESELFOTHER"] = {
				"%s suffers %d %s damage from your %s.", -- [1]
				"Mistress Natalia Mar'alith suffers 186 Shadow damage from your Corruption.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES"] = {
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Lava Annihilator attacks but Athenna is immune.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Stormpike Owl attacks. Moiranna absorbs all the damage.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Alterac Ram misses Vyxxenn.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Seasoned Guardian attacks. Cleatus dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Seasoned Guardian attacks. Jeebes parries.", -- [2]
			},
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Gehennas attacks. Michele blocks.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS"] = {
			["AURAADDEDOTHERHELPFUL"] = {
				"%s gains %s.", -- [1]
				"Yurneroo gains Berserker Stance.", -- [2]
			},
			["RESILIENCE"] = {
				"Resilience", -- [1]
				"Resilience gains Water Shield.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["AURAAPPLICATIONADDEDOTHERHELPFUL"] = {
				"%s gains %s (%d).", -- [1]
				"Hadesspawn gains Unstable Power (8).", -- [2]
			},
			["PERIODICAURAHEALOTHEROTHER"] = {
				"%s gains %d health from %s's %s.", -- [1]
				"Yurneroo gains 174 health from Vyxxenn's Renew.", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Yurneroo gains 1 Rage from Yurneroo's Bloodrage.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE"] = {
			["PERIODICAURADAMAGEOTHEROTHER"] = {
				"%s suffers %d %s damage from %s's %s.", -- [1]
				"Vyxxenn suffers 151 Fire damage from Haihachi's Pyroblast.", -- [2]
			},
			["SPELLPOWERDRAINOTHERSELF"] = {
				"%s's %s drains %d %s from you.", -- [1]
				"Niigel's Viper Sting drains 277 Mana from you.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Pyrotechnic's Ignite is absorbed by Zibana.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Luvcow's Viper Sting drains 212 Mana from Tric.", -- [2]
			},
			["AURAADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s.", -- [1]
				"Vyxxenn is afflicted by Frost Nova.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s (%d).", -- [1]
				"Tehsnipe is afflicted by Ignite (2).", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Xcel's Drain Mana drains 140 Mana from Preacha. Xcel gains 140 Mana.", -- [2]
			},
			["SPELLLOGABSORBSELFOTHER"] = {
				"Your %s is absorbed by %s.", -- [1]
				"Your Immolate is absorbed by Althion.", -- [2]
			},
			["PERIODICAURADAMAGEOTHER"] = {
				"%s suffers %d %s damage from %s.", -- [1]
				"Hien suffers 1644 Shadow damage from Shadow Word: Death.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Shadow Word: Death is absorbed by Kruztique.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["PERIODICAURADAMAGESELFOTHER"] = {
				"%s suffers %d %s damage from your %s.", -- [1]
				"Seijim suffers 159 Shadow damage from your Corruption.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_AURA_GONE_SELF"] = {
			["AURAREMOVEDOTHER"] = {
				"%s fades from %s.", -- [1]
				"Master Demonologist fades from Unknown Entity.", -- [2]
			},
			["AURAREMOVEDSELF"] = {
				"%s fades from you.", -- [1]
				"Stealth fades from you.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_SELF_BUFF"] = {
			["SIMPLEPERFORMSELFSELF"] = {
				"You perform %s.[SIMPLEPERFORMSELFSELF]", -- [1]
				"You perform Vanish.[SIMPLEPERFORMSELFSELF]", -- [2]
			},
			["SIMPLECASTSELFOTHER"] = {
				"You cast %s on %s.[SIMPLECASTSELFOTHER]", -- [1]
				"You cast Demonic Sacrifice on Yazlop.[SIMPLECASTSELFOTHER]", -- [2]
			},
			["POWERGAINSELFOTHER"] = {
				"%s gains %d %s from %s.[POWERGAINSELFOTHER]", -- [1]
				"Khuunam gains 247 Mana from Life Tap.[POWERGAINSELFOTHER]", -- [2]
			},
			["ITEMENCHANTMENTADDSELFSELF"] = {
				"You cast %s on your %s.", -- [1]
				"You cast Stamina +7 on your Felheart Bracers.", -- [2]
			},
			["HEALEDCRITSELFSELF"] = {
				"Your %s critically heals you for %d.", -- [1]
				"Your Healing Wave critically heals you for 113.", -- [2]
			},
			["DISPELFAILEDSELFSELF"] = {
				"You fail to dispel your %s.", -- [1]
				"You fail to dispel your Frost Nova.", -- [2]
			},
			["SPELLTERSEPERFORM_SELF"] = {
				"You perform %s.[SPELLTERSEPERFORM_SELF]", -- [1]
				"You perform Preparation.[SPELLTERSEPERFORM_SELF]", -- [2]
			},
			["SPELLEXTRAATTACKSSELF_SINGULAR"] = {
				"You gain %d extra attack through %s.", -- [1]
				"You gain 1 extra attack through Thrash.", -- [2]
			},
			["SPELLEVADEDSELFOTHER"] = {
				"Your %s was evaded by %s.", -- [1]
				"Your Curse of Agony was evaded by Hive'Zara Hatchling.", -- [2]
			},
			["OPEN_LOCK_SELF"] = {
				"You perform %s on %s.[OPEN_LOCK_SELF]", -- [1]
				"You perform Pick Lock on Thorium Lockbox.[OPEN_LOCK_SELF]", -- [2]
			},
			["SPELLIMMUNESELFOTHER"] = {
				"Your %s failed. %s is immune.", -- [1]
				"Your Curse of Agony failed. Lava Annihilator is immune.", -- [2]
			},
			["SPELLSPLITDAMAGESELFOTHER"] = {
				"Your %s causes %s %d damage.", -- [1]
				"Your Blessing of Sacrifice causes Nino 55 damage.", -- [2]
			},
			["SPELLMISSSELFOTHER"] = {
				"Your %s missed %s.", -- [1]
				"Your Steal Weapon missed Gan'arg Warp-Tinker.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["HEALEDSELFSELF"] = {
				"Your %s heals you for %d.", -- [1]
				"Your Healing Draught heals you for 536.", -- [2]
			},
			["POWERGAINSELFSELF"] = {
				"You gain %d %s from %s.[POWERGAINSELFSELF]", -- [1]
				"You gain 750 Mana from Life Tap.[POWERGAINSELFSELF]", -- [2]
			},
			["ITEMENCHANTMENTADDSELFOTHER"] = {
				"You cast %s on %s's %s.", -- [1]
				"You cast Minor Speed Increase on Kruztique's Faith Healer's Boots.", -- [2]
			},
			["SPELLTERSE_SELF"] = {
				"You cast %s.[SPELLTERSE_SELF]", -- [1]
				"You cast Life Tap.[SPELLTERSE_SELF]", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES"] = {
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Firesworn attacks but Souldreamer is immune.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Wildspawn Rogue attacks. Kruztique absorbs all the damage.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Wildspawn Rogue misses Kruztique.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Eliza's Guard attacks. Aubrie dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Eliza's Guard attacks. Aubrie parries.", -- [2]
			},
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Spectral Researcher attacks. Nimbus blocks.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_BREAK_AURA"] = {
			["AURADISPELSELF3"] = {
				"Your %s is removed by %s's %s.", -- [1]
				"Your Cone of Cold is removed by Ballis's Escape Artist.", -- [2]
			},
			["AURADISPELOTHER"] = {
				"%s's %s is removed.", -- [1]
				"Seasoned Guardian's Sap is removed.", -- [2]
			},
			["AURADISPELSELF"] = {
				"Your %s is removed.", -- [1]
				"Your Stealth is removed.", -- [2]
			},
			["AURADISPELOTHER2"] = {
				"%s's %s is removed by %s.", -- [1]
				"Yukishiro's Scatter Shot is removed by Tondogger.", -- [2]
			},
			["AURADISPELOTHER3"] = {
				"%s's %s is removed by %s's %s.", -- [1]
				"Applebee's Scatter Shot is removed by Tondogger's Sinister Strike.", -- [2]
			},
			["AURADISPELSELF2"] = {
				"Your %s is removed by %s.", -- [1]
				"Your Scatter Shot is removed by Ko.", -- [2]
			},
			["AURASTOLENOTHEROTHER"] = {
				"%s steals %s's %s.", -- [1]
				"Kruztique steals Isra's Divine Spirit.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_COMBAT_XP_GAIN"] = {
			["COMBATLOG_XPGAIN_FIRSTPERSON"] = {
				"%s dies, you gain %d experience.", -- [1]
				"Mindless Zombie dies, you gain 50 experience.", -- [2]
			},
			["COMBATLOG_XPGAIN_EXHAUSTION1"] = {
				"%s dies, you gain %d experience. (%s exp %s bonus)[COMBATLOG_XPGAIN_EXHAUSTION1]", -- [1]
				"Infernal Warbringer dies, you gain 472 experience. (+236 exp Rested bonus)[COMBATLOG_XPGAIN_EXHAUSTION1]", -- [2]
			},
			["COMBATLOG_XPGAIN_FIRSTPERSON_UNNAMED"] = {
				"You gain %d experience.", -- [1]
				"You gain 40 experience.", -- [2]
			},
			["COMBATLOG_XPGAIN_FIRSTPERSON_GROUP"] = {
				"%s dies, you gain %d experience. (+%d group bonus)", -- [1]
				"Shadowmoon Adept dies, you gain 593 experience. (+170 group bonus)", -- [2]
			},
			["COMBATLOG_XPGAIN_EXHAUSTION1_GROUP"] = {
				"%s dies, you gain %d experience. (%s exp %s bonus, +%d group bonus)[COMBATLOG_XPGAIN_EXHAUSTION1_GROUP]", -- [1]
				"Bonestripper Buzzard dies, you gain 362 experience. (+181 exp Rested bonus, +24 group bonus)[COMBATLOG_XPGAIN_EXHAUSTION1_GROUP]", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS"] = {
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Zryan hits Irondeep Miner for 160.[COMBATHITOTHEROTHER]", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHERSELF"] = {
				"%s's %s crits you for %d %s damage.", -- [1]
				"Shair's Shoot crits you for 104 Frost damage. (29 resisted) (26 absorbed)", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Potshot's Auto Shot crits Rdik for 1062.", -- [2]
			},
			["SPELLLOGCRITOTHERSELF"] = {
				"%s's %s crits you for %d.", -- [1]
				"Edilio's Auto Shot crits you for 667. (167 absorbed)", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Yomis's Shoot crits Kruztique for 175 Nature damage.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Shair's Shoot hits you for 98 Frost damage. (25 absorbed)", -- [2]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Greater Fire Elemental hits Boldman for 123 Fire damage.[COMBATHITSCHOOLOTHEROTHER] (51 resisted) (31 absorbed)", -- [2]
				"2.0.10.6448", -- [3]
			},
			["COMBATHITOTHERSELF"] = {
				"%s hits you for %d.[COMBATHITOTHERSELF]", -- [1]
				"Kcid hits you for 165.[COMBATHITOTHERSELF] (41 absorbed)", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_FALLING_OTHER"] = {
				"%s falls and loses %d health.", -- [1]
				"Vyxxenn falls and loses 44 health.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Shardix's Shoot hits Parkson for 106 Nature damage.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Potshot's Auto Shot hits Edorinn for 346.", -- [2]
			},
			["SPELLLOGOTHERSELF"] = {
				"%s's %s hits you for %d.", -- [1]
				"Edilio's Auto Shot hits you for 309. (77 absorbed)", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHEROTHER"] = {
				"%s crits %s for %d %s damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [1]
				"Greater Fire Elemental crits Styxson for 606 Fire damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
				"%s suffers %d points of fire damage.", -- [1]
				"Kruztique suffers 12 points of fire damage.", -- [2]
			},
			["COMBATHITCRITOTHERSELF"] = {
				"%s crits you for %d.[COMBATHITCRITOTHERSELF]", -- [1]
				"Kcid crits you for 318.[COMBATHITCRITOTHERSELF] (80 absorbed)", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Zryan crits Irondeep Miner for 309.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_LAVA_OTHER"] = {
				"%s loses %d health for swimming in lava.", -- [1]
				"Bigpotato loses 603 health for swimming in lava.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE"] = {
			["PERIODICAURADAMAGEOTHEROTHER"] = {
				"%s suffers %d %s damage from %s's %s.", -- [1]
				"Alterac Ram suffers 24 Physical damage from Sekaikaze's Rend.", -- [2]
			},
			["SPELLPOWERLEECHOTHERSELF"] = {
				"%s's %s drains %d %s from you. %s gains %d %s.", -- [1]
				"Bloodthirsty Marshfang's Drain Mana drains 154 Mana from you. Bloodthirsty Marshfang gains 154 Mana.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Unknown Entity's Viper Sting drains 277 Mana from Datexy.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Lunarjustice's Serpent Sting is absorbed by Overseer Maltorius.", -- [2]
			},
			["AURAADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s.", -- [1]
				"Alterac Ram is afflicted by Cheap Shot.", -- [2]
			},
			["SPELLLOGABSORBSELFOTHER"] = {
				"Your %s is absorbed by %s.", -- [1]
				"Your Deep Wound is absorbed by Overseer Maltorius.", -- [2]
			},
			["SPELLPOWERDRAINOTHERSELF"] = {
				"%s's %s drains %d %s from you.", -- [1]
				"Murkblood Spearman's Viper Sting drains 342 Mana from you.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Marshfang Ripper's Drain Mana drains 154 Mana from Haaroon. Marshfang Ripper gains 154 Mana.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s (%d).", -- [1]
				"Sea Elemental is afflicted by Sunder Armor (2).", -- [2]
			},
			["PERIODICAURADAMAGESELFOTHER"] = {
				"%s suffers %d %s damage from your %s.", -- [1]
				"Stone Maw Basilisk suffers 37 Physical damage from your Deep Wound.", -- [2]
			},
		},
		["CHAT_MSG_LOOT"] = {
			["LOOT_ROLL_WON"] = {
				"%s won: %s", -- [1]
				"Kruztique won: |cff1eff00|Hitem:24923:0:0:0:0:0:-18:475660325|h[Grimscale Legguards of Agility]|h|r", -- [2]
			},
			["LOOT_ITEM_SELF_MULTIPLE"] = {
				"You receive loot: %sx%d.", -- [1]
				"You receive loot: |cffffffff|Hitem:2589:0:0:0:0:0:0:0|h[Linen Cloth]|h|rx2.", -- [2]
			},
			["LOOT_ROLL_ROLLED_GREED"] = {
				"Greed Roll - %d for %s by %s", -- [1]
				"Greed Roll - 67 for |cff1eff00|Hitem:24923:0:0:0:0:0:-18:475660325|h[Grimscale Legguards of Agility]|h|r by Verytall", -- [2]
			},
			["LOOT_ITEM"] = {
				"%s receives loot: %s.", -- [1]
				"Clausvolka receives loot: |cffffffff|Hitem:8948:0:0:0:0:0:0:1389958314|h[Dried King Bolete]|h|r.", -- [2]
			},
			["LOOT_ROLL_PASSED_SELF"] = {
				"You passed on: %s", -- [1]
				"You passed on: |cff0070dd|Hitem:24024:0:0:0:0:0:0:1966834958|h[Pauldrons of Arcane Rage]|h|r", -- [2]
			},
			["CREATED_ITEM"] = {
				"%s creates: %s.", -- [1]
				"Dorwin creates: |cffffffff|Hitem:6265:0:0:0:0:0:0:1644796545|h[Soul Shard]|h|r.", -- [2]
			},
			["LOOT_ITEM_MULTIPLE"] = {
				"%s receives loot: %sx%d.", -- [1]
				"Cheeky receives loot: |cffffffff|Hitem:21038:0:0:0:0:0:0:1031883341|h[Hardpacked Snowball]|h|rx5.", -- [2]
			},
			["LOOT_ITEM_PUSHED_SELF"] = {
				"You receive item: %s.", -- [1]
				"You receive item: |cff0070dd|Hitem:19045:0:0:0:0:0:0:0|h[Stormpike Battle Standard]|h|r.", -- [2]
			},
			["LOOT_ROLL_PASSED"] = {
				"%s passed on: %s", -- [1]
				"Nedru passed on: |cff0070dd|Hitem:24024:0:0:0:0:0:0:1966834958|h[Pauldrons of Arcane Rage]|h|r", -- [2]
			},
			["LOOT_ROLL_ALL_PASSED"] = {
				"Everyone passed on: %s", -- [1]
				"Everyone passed on: |cff0070dd|Hitem:24384:0:0:0:0:0:0:1766089234|h[Diamond-Core Sledgemace]|h|r", -- [2]
			},
			["LOOT_ROLL_NEED_SELF"] = {
				"You have selected Need for: %s", -- [1]
				"You have selected Need for: |cff0070dd|Hitem:27799:0:0:0:0:0:0:-1882943822|h[Vermillion Robes of the Dominant]|h|r", -- [2]
				"2.0.10.6448", -- [3]
			},
			["LOOT_ITEM_CREATED_SELF"] = {
				"You create: %s.", -- [1]
				"You create: |cffffffff|Hitem:6265:0:0:0:0:0:0:993161637|h[Soul Shard]|h|r.", -- [2]
			},
			["LOOT_ROLL_YOU_WON"] = {
				"You won: %s", -- [1]
				"You won: |cff1eff00|Hitem:25045:0:0:0:0:0:-32:-1863909355|h[Azurite Ring of Fire Protection]|h|r", -- [2]
			},
			["LOOT_ROLL_ROLLED_NEED"] = {
				"Need Roll - %d for %s by %s", -- [1]
				"Need Roll - 78 for |cff0070dd|Hitem:24024:0:0:0:0:0:0:1966834958|h[Pauldrons of Arcane Rage]|h|r by Kruztique", -- [2]
			},
			["CREATED_ITEM_MULTIPLE"] = {
				"%s creates: %sx%d.", -- [1]
				"Songstress creates: |cffffffff|Hitem:8079:0:0:0:0:0:0:869506249|h[Conjured Crystal Water]|h|rx10.", -- [2]
			},
			["LOOT_ROLL_NEED"] = {
				"%s has selected Need for: %s", -- [1]
				"Kruztique has selected Need for: |cff0070dd|Hitem:24024:0:0:0:0:0:0:1966834958|h[Pauldrons of Arcane Rage]|h|r", -- [2]
			},
			["LOOT_ITEM_SELF"] = {
				"You receive loot: %s.", -- [1]
				"You receive loot: |cffffffff|Hitem:17503:0:0:0:0:0:0:4289959|h[Frostwolf Lieutenant's Medal]|h|r.", -- [2]
			},
			["LOOT_ROLL_GREED"] = {
				"%s has selected Greed for: %s", -- [1]
				"Nedru has selected Greed for: |cff1eff00|Hitem:24923:0:0:0:0:0:-18:475660325|h[Grimscale Legguards of Agility]|h|r", -- [2]
			},
			["LOOT_ITEM_CREATED_SELF_MULTIPLE"] = {
				"You create: %sx%d.", -- [1]
				"You create: |cff1eff00|Hitem:20560:0:0:0:0:0:0:1719621430|h[Alterac Valley Mark of Honor]|h|rx3.", -- [2]
			},
			["LOOT_ITEM_PUSHED_SELF_MULTIPLE"] = {
				"You receive item: %sx%d.", -- [1]
				"You receive item: |cffffffff|Hitem:19307:0:0:0:0:0:0:0|h[Alterac Heavy Runecloth Bandage]|h|rx20.", -- [2]
			},
			["LOOT_ROLL_GREED_SELF"] = {
				"You have selected Greed for: %s", -- [1]
				"You have selected Greed for: |cff1eff00|Hitem:24923:0:0:0:0:0:-18:475660325|h[Grimscale Legguards of Agility]|h|r", -- [2]
			},
		},
		["CHAT_MSG_SPELL_TRADESKILLS"] = {
			["TRADESKILL_LOG_FIRSTPERSON"] = {
				"You create %s.", -- [1]
				"You create Blinding Powder.", -- [2]
			},
			["TRADESKILL_LOG_THIRDPERSON"] = {
				"%s creates %s.", -- [1]
				"Aradan creates Thorium Bar.", -- [2]
			},
			["FEEDPET_LOG_THIRDPERSON"] = {
				"%s's pet begins eating a %s.", -- [1]
				"Roidzz's pet begins eating a Moist Cornbread.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_FACTION_CHANGE"] = {
			["FACTION_STANDING_DECREASED"] = {
				"Reputation with %s decreased by %d.", -- [1]
				"Reputation with Bloodsail Buccaneers decreased by 75.", -- [2]
			},
			["FACTION_STANDING_CHANGED"] = {
				"You are now %s with %s.", -- [1]
				"You are now Friendly with Steamwheedle Cartel.", -- [2]
			},
			["FACTION_STANDING_INCREASED"] = {
				"Reputation with %s increased by %d.", -- [1]
				"Reputation with Honor Hold increased by 275.", -- [2]
			},
		},
		["CHAT_MSG_SYSTEM"] = {
			["ERR_EXHAUSTION_NORMAL"] = {
				"You feel normal.", -- [1]
				"You feel normal.", -- [2]
			},
			["ERR_RAID_MEMBER_ADDED_S"] = {
				"%s has joined the raid group", -- [1]
				"Ssugarr has joined the raid group", -- [2]
			},
			["ERR_MEETING_STONE_IN_QUEUE_S"] = {
				"You are now in the queue to join a party for %s.", -- [1]
				"You are now in the queue to join a party for Hellfire Citadel - Hellfire Ramparts.", -- [2]
			},
			["ERR_QUEST_COMPLETE_S"] = {
				"%s completed.", -- [1]
				"Divine Retribution completed.", -- [2]
			},
			["ERR_QUEST_FAILED_S"] = {
				"%s failed.", -- [1]
				"Someone Else's Hard Work Pays Off failed.", -- [2]
				"2.0.6", -- [3]
			},
			["ERR_INITIATE_TRADE_S"] = {
				"You have requested to trade with %s.", -- [1]
				"You have requested to trade with Ponnie.", -- [2]
			},
			["ERR_ZONE_EXPLORED_XP"] = {
				"Discovered %s: %d experience gained", -- [1]
				"Discovered The Cauldron: 440 experience gained", -- [2]
			},
			["ERR_NOT_LEADER"] = {
				"You are not the party leader.", -- [1]
				"You are not the party leader.", -- [2]
			},
			["ERR_RAID_YOU_JOINED"] = {
				"You have joined a raid group", -- [1]
				"You have joined a raid group", -- [2]
			},
			["ERR_QUEST_REWARD_EXP_I"] = {
				"Experience gained: %d.", -- [1]
				"Experience gained: 2400.", -- [2]
			},
			["MARKED_AFK_MESSAGE"] = {
				"You are now AFK: %s", -- [1]
				"You are now AFK: Away from Keyboard", -- [2]
			},
			["RAID_INSTANCE_WARNING_HOURS_P1"] = {
				"WARNING! %s is scheduled to reset in %d hours.", -- [1]
				"WARNING! Zul'gurub is scheduled to reset in 4 hours.", -- [2]
			},
			["ERR_QUEST_PUSH_LOG_FULL_S"] = {
				"%s's quest log is full", -- [1]
				"Kruztique's quest log is full", -- [2]
			},
			["DUEL_WINNER_KNOCKOUT"] = {
				"%1$s has defeated %2$s in a duel", -- [1]
				"Powderpuff has defeated Pwnzoors in a duel", -- [2]
			},
			["ERR_DUNGEON_DIFFICULTY_CHANGED_S"] = {
				"Dungeon difficulty set to %s (All saved instances have been reset)", -- [1]
				"Dungeon difficulty set to Heroic (All saved instances have been reset)", -- [2]
				"2.0.12.6546", -- [3]
			},
			["ERR_QUEST_ACCEPTED_S"] = {
				"Quest accepted: %s", -- [1]
				"Quest accepted: Curse These Fat Fingers", -- [2]
			},
			["ERR_PLAYER_BUSY_S"] = {
				"%s is busy right now.", -- [1]
				"Zay is busy right now.", -- [2]
			},
			["WHO_NUM_RESULTS"] = {
				"%d player total", -- [1]
				"1 player total", -- [2]
			},
			["ERR_DEATHBIND_SUCCESS_S"] = {
				"%s is now your home.", -- [1]
				"Cenarion Hold is now your home.", -- [2]
			},
			["ERR_FRIEND_SELF"] = {
				"You can't put yourself on your friend list.", -- [1]
				"You can't put yourself on your friend list.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["ERR_IGNORE_REMOVED_S"] = {
				"%s is no longer being ignored.", -- [1]
				"Afterthefall is no longer being ignored.", -- [2]
			},
			["MATCHMAKING_MATCH_S"] = {
				"You have been matched to a group for %s.", -- [1]
				"You have been matched to a group for Auchindoun - Shadow Labyrinth.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["DUEL_WINNER_RETREAT"] = {
				"%2$s has fled from %1$s in a duel", -- [1]
				"Chria has fled from Eru in a duel", -- [2]
			},
			["INSTANCE_SAVED"] = {
				"You are now saved to this instance", -- [1]
				"You are now saved to this instance", -- [2]
			},
			["ERR_RAID_LEADER_READY_CHECK_START_S"] = {
				"%s has initiated a ready check", -- [1]
				"Zaroc has initiated a ready check", -- [2]
			},
			["ERR_AUCTION_BID_PLACED"] = {
				"Bid accepted.", -- [1]
				"Bid accepted.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["ERR_IGNORE_ALREADY_S"] = {
				"%s is already being ignored.", -- [1]
				"Toppol is already being ignored.", -- [2]
			},
			["ERR_LEARN_SPELL_S"] = {
				"You have learned a new spell: %s.", -- [1]
				"You have learned a new spell: Corruption (Rank 7).", -- [2]
			},
			["WHO_LIST_FORMAT"] = {
				"|Hplayer:%s|h[%s]|h: Level %d %s %s - %s", -- [1]
				"|Hplayer:Discoverer|h[Discoverer]|h: Level 1 Night Elf Warrior - Teldrassil", -- [2]
			},
			["ERR_QUEST_PUSH_ONQUEST_S"] = {
				"%s is already on that quest", -- [1]
				"Ponnie is already on that quest", -- [2]
			},
			["WHO_NUM_RESULTS_P1"] = {
				"%d players total", -- [1]
				"2 players total", -- [2]
			},
			["ERR_LEARN_ABILITY_S"] = {
				"You have learned a new ability: %s.", -- [1]
				"You have learned a new ability: Piercing Howl.", -- [2]
			},
			["ERR_QUEST_FAILED_BAG_FULL_S"] = {
				"%s failed: Inventory is full.", -- [1]
				"Fiery Menace! failed: Inventory is full.", -- [2]
			},
			["DUEL_COUNTDOWN"] = {
				"Duel starting: %d", -- [1]
				"Duel starting: 3", -- [2]
			},
			["ERR_MATCHMAKING_MADE_LEADER"] = {
				"You are the party leader!", -- [1]
				"You are the party leader!", -- [2]
				"2.0.10.6448", -- [3]
			},
			["RANDOM_ROLL_RESULT"] = {
				"%s rolls %d (%d-%d)", -- [1]
				"Afterthefall rolls 432 (1-1000)", -- [2]
			},
			["ERR_QUEST_PUSH_SUCCESS_S"] = {
				"Sharing quest with %s...", -- [1]
				"Sharing quest with Ponnie...", -- [2]
			},
			["ERR_SET_LOOT_FREEFORALL"] = {
				"Looting changed to free-for-all.", -- [1]
				"Looting changed to free-for-all.", -- [2]
			},
			["ERR_FRIEND_ADDED_S"] = {
				"%s added to friends.", -- [1]
				"Agywen added to friends.", -- [2]
			},
			["ERR_JOINED_GROUP_S"] = {
				"%s joins the party.[ERR_JOINED_GROUP_S]", -- [1]
				"Kruztique joins the party.[ERR_JOINED_GROUP_S]", -- [2]
			},
			["ERR_QUEST_NEED_PREREQS"] = {
				"You don't meet the requirements for that quest", -- [1]
				"You don't meet the requirements for that quest", -- [2]
			},
			["ERR_NEW_LOOT_MASTER_S"] = {
				"%s is now the loot master.", -- [1]
				"Bollie is now the loot master.", -- [2]
			},
			["ERR_GROUP_DISBANDED"] = {
				"Your group has been disbanded.", -- [1]
				"Your group has been disbanded.", -- [2]
			},
			["ERR_SET_LOOT_ROUNDROBIN"] = {
				"Looting changed to round robin.", -- [1]
				"Looting changed to round robin.", -- [2]
			},
			["DRUNK_MESSAGE_OTHER1"] = {
				"%s seems to be sobering up.", -- [1]
				"Akronius seems to be sobering up.", -- [2]
			},
			["ERR_NOT_IN_RAID"] = {
				"You are not in a raid group", -- [1]
				"You are not in a raid group", -- [2]
			},
			["UNIT_PVP_NAME"] = {
				"%s %s", -- [1]
				"Welcome to the World of Warcraft!", -- [2]
			},
			["ERR_QUEST_PUSH_ACCEPTED_S"] = {
				"%s has accepted your quest", -- [1]
				"Ponnie has accepted your quest", -- [2]
			},
			["ERR_RAID_MEMBER_REMOVED_S"] = {
				"%s has left the raid group", -- [1]
				"Sspicee has left the raid group", -- [2]
			},
			["ERR_GROUP_FULL"] = {
				"Your party is full.", -- [1]
				"Your party is full.", -- [2]
			},
			["RAID_INSTANCE_WELCOME"] = {
				"Welcome to %s. This raid instance is scheduled to reset in %dd %dh %dm.", -- [1]
				"Welcome to Onyxias Lair Instance. This raid instance is scheduled to reset in 4d 21h 56m.", -- [2]
			},
			["ERR_MATCHMAKING_OTHER_MEMBER_LEFT"] = {
				"Party member has left.  Looking for a new party in the LFG matchmaking system.", -- [1]
				"Party member has left.  Looking for a new party in the LFG matchmaking system.", -- [2]
				"2.0.6", -- [3]
			},
			["ERR_BG_PLAYER_JOINED_SS"] = {
				"|Hplayer:%s|h[%s]|h has joined the battle", -- [1]
				"|Hplayer:Dangerousjoe|h[Dangerousjoe]|h has joined the battle", -- [2]
			},
			["ERR_INVITE_PLAYER_S"] = {
				"You have invited %s to join your group.", -- [1]
				"You have invited Lunarjustice to join your group.", -- [2]
			},
			["ERR_FRIEND_ALREADY_S"] = {
				"%s is already your friend.", -- [1]
				"Ruru is already your friend.", -- [2]
				"2.0.8.6403", -- [3]
			},
			["ERR_AUCTION_STARTED"] = {
				"Auction created.", -- [1]
				"Auction created.", -- [2]
			},
			["RAID_INSTANCE_INFO_HDR"] = {
				"Raid Instance Time Remaining:", -- [1]
				"Raid Instance Time Remaining:", -- [2]
			},
			["ERR_SET_LOOT_MASTER"] = {
				"Looting changed to master looter.", -- [1]
				"Looting changed to master looter.", -- [2]
			},
			["CLEARED_AFK"] = {
				"You are no longer AFK.", -- [1]
				"You are no longer AFK.", -- [2]
			},
			["IDLE_MESSAGE"] = {
				"You have been inactive for some time and will be logged out of the game. If you wish to remain logged in, hit the cancel button.", -- [1]
				"You have been inactive for some time and will be logged out of the game. If you wish to remain logged in, hit the cancel button.", -- [2]
			},
			["ERR_QUEST_PUSH_DECLINED_S"] = {
				"%s has declined your quest", -- [1]
				"Rannie has declined your quest", -- [2]
			},
			["ERR_GUILD_DEMOTE_SSS"] = {
				"%s has demoted %s to %s.", -- [1]
				"Dragonx has demoted Minie to Noob.", -- [2]
			},
			["ERR_FRIEND_OFFLINE_S"] = {
				"%s has gone offline.", -- [1]
				"Ponnie has gone offline.", -- [2]
			},
			["ERR_SET_LOOT_NBG"] = {
				"Looting set to need before greed.", -- [1]
				"Looting set to need before greed.", -- [2]
			},
			["DRUNK_MESSAGE_SELF2"] = {
				"You feel tipsy.  Whee!", -- [1]
				"You feel tipsy.  Whee!", -- [2]
			},
			["DRUNK_MESSAGE_OTHER3"] = {
				"%s looks drunk.", -- [1]
				"Akronius looks drunk.", -- [2]
			},
			["ERR_GUILD_LEAVE_S"] = {
				"%s has left the guild.", -- [1]
				"Styxson has left the guild.", -- [2]
			},
			["ERR_PLAYER_DIED_S"] = {
				"%s has died.", -- [1]
				"Ponnie has died.", -- [2]
			},
			["ERR_QUEST_PUSH_ALREADY_DONE_S"] = {
				"%s has completed that quest", -- [1]
				"Lunarjustice has completed that quest", -- [2]
			},
			["ERR_AUCTION_EXPIRED_S"] = {
				"Your auction of %s has expired.", -- [1]
				"Your auction of Runn Tum Tuber Surprise has expired.", -- [2]
			},
			["ERR_QUEST_REWARD_ITEM_S"] = {
				"Received item: %s.", -- [1]
				"Received item: |cff1eff00|Hitem:19125:0:0:0|h[Seared Mail Girdle]|h|r.", -- [2]
			},
			["ERR_FRIEND_REMOVED_S"] = {
				"%s removed from friends list.", -- [1]
				"Garohunter removed from friends list.", -- [2]
			},
			["ERR_TRADE_BLOCKED_S"] = {
				"%s has requested to trade.  You have refused.", -- [1]
				"Kruztique has requested to trade.  You have refused.", -- [2]
				"2.0.6", -- [3]
			},
			["ERR_SET_LOOT_GROUP"] = {
				"Looting changed to group loot.", -- [1]
				"Looting changed to group loot.", -- [2]
			},
			["TRANSFER_ABORT_MAX_PLAYERS"] = {
				"Transfer Aborted: instance is full", -- [1]
				"Transfer Aborted: instance is full", -- [2]
			},
			["ERR_QUEST_PUSH_TOO_FAR_S"] = {
				"%s is too far away to receive your quest", -- [1]
				"Kruztique is too far away to receive your quest", -- [2]
			},
			["ERR_LEFT_GROUP_YOU"] = {
				"You leave the group.", -- [1]
				"You leave the group.", -- [2]
			},
			["ERR_NEW_LEADER_S"] = {
				"%s is now the group leader.", -- [1]
				"Dragonx is now the group leader.", -- [2]
			},
			["ERR_MEETING_STONE_LEFT_QUEUE_S"] = {
				"You have left the queue to join a party for %s.", -- [1]
				"You have left the queue to join a party for Hellfire Citadel - Hellfire Ramparts.", -- [2]
			},
			["ERR_BG_PLAYER_LEFT_S"] = {
				"%s has left the battle", -- [1]
				"Deiliana has left the battle", -- [2]
			},
			["MARKED_DND"] = {
				"You are now DND: %s.", -- [1]
				"You are now DND: Do not Disturb.", -- [2]
			},
			["ERR_FRIEND_ONLINE_SS"] = {
				"|Hplayer:%s|h[%s]|h has come online.", -- [1]
				"|Hplayer:Inverno|h[Inverno]|h has come online.", -- [2]
			},
			["ERR_IGNORE_NOT_FOUND"] = {
				"Player not found.[ERR_IGNORE_NOT_FOUND]", -- [1]
				"Player not found.[ERR_IGNORE_NOT_FOUND]", -- [2]
			},
			["ERR_CHAT_PLAYER_NOT_FOUND_S"] = {
				"No player named '%s' is currently playing.", -- [1]
				"No player named 'say' is currently playing.", -- [2]
			},
			["ERR_QUEST_REWARD_MONEY_S"] = {
				"Received %s.", -- [1]
				"Received 70 Silver.", -- [2]
			},
			["ERR_UNINVITE_YOU"] = {
				"You have been removed from the group.", -- [1]
				"You have been removed from the group.", -- [2]
			},
			["ERR_SET_LOOT_THRESHOLD_S"] = {
				"Loot threshold set to %s", -- [1]
				"Loot threshold set to Rare", -- [2]
			},
			["DRUNK_MESSAGE_SELF1"] = {
				"You feel sober again.", -- [1]
				"You feel sober again.", -- [2]
			},
			["ERR_EXHAUSTION_RESTED"] = {
				"You feel rested.", -- [1]
				"You feel rested.", -- [2]
			},
			["ERR_LEFT_GROUP_S"] = {
				"%s leaves the party.[ERR_LEFT_GROUP_S]", -- [1]
				"Kruztique leaves the party.[ERR_LEFT_GROUP_S]", -- [2]
			},
			["ERR_DECLINE_GROUP_S"] = {
				"%s declines your group invitation.", -- [1]
				"Librabear declines your group invitation.", -- [2]
			},
			["WHO_LIST_GUILD_FORMAT"] = {
				"|Hplayer:%s|h[%s]|h: Level %d %s %s <%s> - %s", -- [1]
				"|Hplayer:Mimicat|h[Mimicat]|h: Level 60 Human Warlock <D i v i n i t y> - Ironforge", -- [2]
			},
			["ERR_IGNORE_ADDED_S"] = {
				"%s is now being ignored.", -- [1]
				"Toppol is now being ignored.", -- [2]
			},
			["CLEARED_DND"] = {
				"You are no longer marked DND.", -- [1]
				"You are no longer marked DND.", -- [2]
			},
			["ERR_GUILD_JOIN_S"] = {
				"%s has joined the guild.", -- [1]
				"Feel has joined the guild.", -- [2]
			},
			["ERR_ALREADY_IN_GROUP_S"] = {
				"%s is already in a group.", -- [1]
				"Sai is already in a group.", -- [2]
			},
			["FACTION_STANDING_CHANGED"] = {
				"You are now %s with %s.", -- [1]
				"You are now Friendly with The League of Arathor.", -- [2]
			},
			["ERR_MATCHMAKING_IN_PROGRESS"] = {
				"You are still seeking more members through the LFG matchmaking system.", -- [1]
				"You are still seeking more members through the LFG matchmaking system.", -- [2]
			},
			["ERR_FRIEND_NOT_FOUND"] = {
				"Player not found.[ERR_FRIEND_NOT_FOUND]", -- [1]
				"Player not found.[ERR_FRIEND_NOT_FOUND]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["ERR_LEARN_RECIPE_S"] = {
				"You have learned how to create a new item: %s.", -- [1]
				"You have learned how to create a new item: Brightcloth Pants.", -- [2]
			},
			["ERR_SPELL_UNLEARNED_S"] = {
				"You have unlearned %s.", -- [1]
				"You have unlearned Cold Snap.", -- [2]
			},
			["ERR_QUEST_ALREADY_ON"] = {
				"You are already on that quest", -- [1]
				"You are already on that quest", -- [2]
				"2.0.6", -- [3]
			},
			["DRUNK_MESSAGE_OTHER2"] = {
				"%s looks tipsy.", -- [1]
				"Brownee looks tipsy.", -- [2]
			},
			["ERR_QUEST_PUSH_BUSY_S"] = {
				"%s is busy", -- [1]
				"Rannie is busy", -- [2]
				"2.0.10.6448", -- [3]
			},
			["ERR_RAID_YOU_LEFT"] = {
				"You have left the raid group", -- [1]
				"You have left the raid group", -- [2]
			},
			["ERR_DUEL_REQUESTED"] = {
				"You have requested a duel.", -- [1]
				"You have requested a duel.", -- [2]
			},
			["ERR_AUCTION_WON_S"] = {
				"You won an auction for %s", -- [1]
				"You won an auction for Runed Blood Garnet", -- [2]
				"2.0.10.6448", -- [3]
			},
			["ERR_NOT_IN_GROUP"] = {
				"You aren't in a party.", -- [1]
				"You aren't in a party.", -- [2]
			},
			["ERR_INVITED_TO_GROUP_S"] = {
				"%s has invited you to join a group.", -- [1]
				"Iceangelz hat Euch in eine Gruppe eingeladen.", -- [2]
			},
			["ERR_GUILD_PROMOTE_SSS"] = {
				"%s has promoted %s to %s.", -- [1]
				"Zay has promoted Feel to Noob.", -- [2]
			},
			["ERR_QUEST_FAILED_MISSING_ITEMS"] = {
				"You don't have the required items with you.  Check storage.", -- [1]
				"You don't have the required items with you.  Check storage.", -- [2]
			},
			["DRUNK_MESSAGE_SELF3"] = {
				"You feel drunk.  Woah!", -- [1]
				"You feel drunk.  Woah!", -- [2]
			},
			["DRUNK_MESSAGE_OTHER4"] = {
				"%s looks completely smashed.", -- [1]
				"Northstorm looks completely smashed.", -- [2]
			},
			["ERR_MATCHMAKING_MEMBER_ADDED_S"] = {
				"%s has been added to the group by the LFG matchmaking system.", -- [1]
				"Meralog has been added to the group by the LFG matchmaking system.", -- [2]
			},
			["DRUNK_MESSAGE_SELF4"] = {
				"You feel completely smashed.", -- [1]
				"You feel completely smashed.", -- [2]
			},
			["ERR_NEW_LEADER_YOU"] = {
				"You are now the group leader.", -- [1]
				"You are now the group leader.", -- [2]
			},
			["ERR_QUEST_PUSH_INVALID_S"] = {
				"%s is not eligible for that quest", -- [1]
				"Sayune is not eligible for that quest", -- [2]
			},
		},
		["CHAT_MSG_SPELL_SELF_DAMAGE"] = {
			["SPELLRESISTSELFSELF"] = {
				"You resisted your %s.", -- [1]
				"You resisted your Drain Soul.", -- [2]
			},
			["SPELLIMMUNESELFSELF"] = {
				"Your %s failed.  You are immune.", -- [1]
				"Your Soulshatter failed.  You are immune.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SIMPLECASTSELFOTHER"] = {
				"You cast %s on %s.[SIMPLECASTSELFOTHER]", -- [1]
				"You cast Polymorph on Young Stranglethorn Tiger.[SIMPLECASTSELFOTHER]", -- [2]
			},
			["SPELLLOGSELFOTHER"] = {
				"Your %s hits %s for %d.", -- [1]
				"Your Hemorrhage hits Alterac Ram for 132.", -- [2]
			},
			["SPELLLOGSCHOOLSELF"] = {
				"%s hits you for %d %s damage.[SPELLLOGSCHOOLSELF]", -- [1]
				"Arcane Explosion hits you for 1432 Arcane damage.[SPELLLOGSCHOOLSELF]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLTERSE_SELF"] = {
				"You cast %s.[SPELLTERSE_SELF]", -- [1]
				"You cast Soulshatter.[SPELLTERSE_SELF]", -- [2]
				"2.0.8.6403", -- [3]
			},
			["SPELLMISSSELFOTHER"] = {
				"Your %s missed %s.", -- [1]
				"Your Hemorrhage missed Seasoned Guardian.", -- [2]
			},
			["SIMPLEPERFORMSELFOTHER"] = {
				"You perform %s on %s.[SIMPLEPERFORMSELFOTHER]", -- [1]
				"You perform Distract on Kasinoll.[SIMPLEPERFORMSELFOTHER]", -- [2]
			},
			["SPELLLOGABSORBSELFOTHER"] = {
				"Your %s is absorbed by %s.", -- [1]
				"Your Hemorrhage is absorbed by Vyxxenn.", -- [2]
			},
			["IMMUNESPELLSELFOTHER"] = {
				"%s is immune to your %s.", -- [1]
				"Lava Annihilator is immune to your Corruption.", -- [2]
			},
			["SPELLPARRIEDSELFOTHER"] = {
				"Your %s is parried by %s.", -- [1]
				"Your Hemorrhage is parried by Hillel.", -- [2]
			},
			["SPELLEVADEDSELFOTHER"] = {
				"Your %s was evaded by %s.", -- [1]
				"Your Cleave was evaded by Hatecrest Serpent Guard.", -- [2]
			},
			["SPELLLOGSCHOOLSELFOTHER"] = {
				"Your %s hits %s for %d %s damage.", -- [1]
				"Your Instant Poison VI hits Singh for 125 Nature damage.", -- [2]
			},
			["SPELLIMMUNESELFOTHER"] = {
				"Your %s failed. %s is immune.", -- [1]
				"Your Polymorph failed. Orbatron is immune.", -- [2]
			},
			["SPELLREFLECTSELFOTHER"] = {
				"Your %s is reflected back by %s.", -- [1]
				"Your Corruption is reflected back by Greater Obsidian Elemental.", -- [2]
			},
			["SPELLDODGEDSELFOTHER"] = {
				"Your %s was dodged by %s.", -- [1]
				"Your Hemorrhage was dodged by Humlae.", -- [2]
			},
			["SPELLBLOCKEDSELFOTHER"] = {
				"Your %s was blocked by %s.", -- [1]
				"Your Hamstring was blocked by Zapped Wave Strider.", -- [2]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Arcane Explosion hits Bryantia for 1427 Arcane damage.[SPELLLOGSCHOOLOTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGCRITSELFOTHER"] = {
				"Your %s crits %s for %d.", -- [1]
				"Your Hemorrhage crits Alterac Ram for 308.", -- [2]
			},
			["SPELLLOGSCHOOLSELFSELF"] = {
				"Your %s hits you for %d %s damage.", -- [1]
				"Your Shadow Bolt hits you for 763 Shadow damage.", -- [2]
			},
			["SPELLLOGABSORBSELFSELF"] = {
				"You absorb your %s.", -- [1]
				"You absorb your Plague Effect.", -- [2]
			},
			["SPELLLOGCRITSCHOOLSELFOTHER"] = {
				"Your %s crits %s for %d %s damage.", -- [1]
				"Your Smite crits Mindless Zombie for 26 Holy damage.", -- [2]
			},
			["SPELLRESISTSELFOTHER"] = {
				"Your %s was resisted by %s.", -- [1]
				"Your Cheap Shot was resisted by Yurneroo.", -- [2]
			},
			["SPELLINTERRUPTSELFOTHER"] = {
				"You interrupt %s's %s.", -- [1]
				"You interrupt Eliza's Frostbolt.", -- [2]
			},
			["SPELLLOGCRITSCHOOLSELFSELF"] = {
				"Your %s crits you for %d %s damage.", -- [1]
				"Your Shadow Bolt crits you for 1158 Shadow damage.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES"] = {
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Wildspawn Betrayer attacks. Wildspawn Shadowstalker blocks.", -- [2]
			},
			["MISSEDOTHERSELF"] = {
				"%s misses you.", -- [1]
				"Alterac Ram misses you.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Wildspawn Trickster attacks. Wildspawn Rogue dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Wildspawn Trickster attacks. Wildspawn Rogue parries.", -- [2]
			},
			["VSIMMUNEOTHERSELF"] = {
				"%s attacks but you are immune.", -- [1]
				"Nightbane Tainted One attacks but you are immune.", -- [2]
			},
			["VSPARRYOTHERSELF"] = {
				"%s attacks. You parry.", -- [1]
				"Young Panther attacks. You parry.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Wildspawn Imp attacks. Wildspawn Hellcaller absorbs all the damage.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Wildspawn Rogue misses Wildspawn Rogue.", -- [2]
			},
			["VSABSORBOTHERSELF"] = {
				"%s attacks. You absorb all the damage.", -- [1]
				"Eliza's Guard attacks. You absorb all the damage.", -- [2]
			},
			["VSDODGEOTHERSELF"] = {
				"%s attacks. You dodge.", -- [1]
				"Alterac Ram attacks. You dodge.", -- [2]
			},
			["SPELLMISSOTHERSELF"] = {
				"%s's %s misses you.", -- [1]
				"Hukku's Voidwalker misses you.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF"] = {
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Wildspawn Satyr's Battle Shout fails. Wildspawn Betrayer is immune.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Captain Balinda Stonehearth casts Dispel Magic on Greethun.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Garr fails to dispel Typhoonsfury's Greater Blessing of Wisdom.", -- [2]
			},
			["SPELLTERSEPERFORM_OTHER"] = {
				"%s performs %s.[SPELLTERSEPERFORM_OTHER]", -- [1]
				"Honor Hold Archer performs Shoot Bow.[SPELLTERSEPERFORM_OTHER]", -- [2]
			},
			["HEALEDOTHEROTHER"] = {
				"%s's %s heals %s for %d.", -- [1]
				"Zevrim Thornhoof's Sacrifice heals Zevrim Thornhoof for 300.", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Jerick gains 16 Mana from Aleoso's Vampiric Touch.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Fel Cannon MKI's Fel Cannon Blast was resisted by Juckus.", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLEXTRAATTACKSOTHER"] = {
				"%s gains %d extra attacks through %s.", -- [1]
				"Stormpike Owl gains 2 extra attacks through Thrash.", -- [2]
			},
			["HEALEDOTHER"] = {
				"%s heals %s for %d.", -- [1]
				"Negaton Field heals Negaton Warp-Master for 1000.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Irondeep Shaman casts Earthbind Totem.[SPELLTERSE_OTHER]", -- [2]
			},
			["PROCRESISTOTHEROTHER"] = {
				"%s resists %s's %s.", -- [1]
				"Beautifuldoc resists Dust Stormer's Lightning Shield.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Woodpaw Mystic begins to cast Healing Wave.", -- [2]
			},
			["HEALEDCRITOTHEROTHER"] = {
				"%s's %s critically heals %s for %d.", -- [1]
				"Aleoso's Vampiric Embrace critically heals Jerick for 470.", -- [2]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Scholomance Dark Summoner begins to perform Summon Risen Lackey.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS"] = {
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Sludge's Thorns was resisted by Bloodrage.", -- [2]
			},
			["DAMAGESHIELDOTHEROTHER"] = {
				"%s reflects %d %s damage to %s.", -- [1]
				"Grizzly reflects 18 Nature damage to Jagnus.", -- [2]
			},
			["SPELLRESISTOTHERSELF"] = {
				"%s's %s was resisted.", -- [1]
				"Diokles's Thorns was resisted.", -- [2]
			},
			["DAMAGESHIELDOTHERSELF"] = {
				"%s reflects %d %s damage to you.", -- [1]
				"Plethora reflects 15 Nature damage to you.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PARTY_BUFF"] = {
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Ilyena's Weakened Soul fails. Akronius is immune.", -- [2]
			},
			["HEALEDOTHEROTHER"] = {
				"%s's %s heals %s for %d.", -- [1]
				"Minimonty's Holy Light heals Huntzor for 2030.", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Kruztique's Dispel Magic is reflected back by Mageslayer.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Sruufenn fails to dispel Aladinsane's Demon Armor.", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.", -- [1]
				"Thookun casts Devour Magic on you.", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Woft's Teleport to Player was evaded by Onyxian Whelp.", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Icehammer gains 60 Mana from Morisen's Rejuvenation.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Steam Tonk casts Mortar.[SPELLTERSE_OTHER]", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Lionkingz's Zulian Slice missed Lava Reaver.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Ponnie's Transmogrify! was resisted by Deep Strider.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Lionkingz's Zulian Slice was parried by Molten Giant.", -- [2]
			},
			["PROCRESISTOTHEROTHER"] = {
				"%s resists %s's %s.", -- [1]
				"Qiraji Gladiator resists Sejet's Blessing of Sanctuary.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Kruztique casts Dispel Magic on Grimbow.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["HEALEDCRITOTHEROTHER"] = {
				"%s's %s critically heals %s for %d.", -- [1]
				"Minimonty's Flash of Light critically heals Kiraa for 806.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Lionkingz's Zulian Slice was dodged by Molten Giant.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS"] = {
			["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
				"%s suffers %d points of fire damage.", -- [1]
				"Unknown Entity suffers 13 points of fire damage.", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_FALLING_OTHER"] = {
				"%s falls and loses %d health.", -- [1]
				"Cleatus falls and loses 256 health.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Gromlick's Auto Shot crits Hiroru for 660.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Edorinn's Shoot hits Gromlick for 67 Fire damage. (67 resisted)", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Kruztique's Shoot crits Wing Commander Mulverick for 185 Arcane damage.", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_DROWNING_OTHER"] = {
				"%s is drowning and loses %d health.", -- [1]
				"Carsh is drowning and loses 120 health.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Shadowfiend hits Rijak for 82 Shadow damage.[COMBATHITSCHOOLOTHEROTHER] (27 resisted)", -- [2]
				"2.0.10.6448", -- [3]
			},
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Adeillis hits Syntaks for 240.[COMBATHITOTHEROTHER]", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Potshot's Auto Shot hits Nitayes for 455.", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Adeillis crits Syntaks for 227.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_LAVA_OTHER"] = {
				"%s loses %d health for swimming in lava.", -- [1]
				"Windlore loses 603 health for swimming in lava.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS"] = {
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Onyxia's Elite Guard hits Highlord Bolvar Fordragon for 405.[COMBATHITOTHEROTHER]", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
				"%s suffers %d points of fire damage.", -- [1]
				"Ironforge Brigade Rifleman suffers 14 points of fire damage.", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHEROTHER"] = {
				"%s crits %s for %d %s damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [1]
				"Blistering Rot crits Hephaiston for 263 Nature damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [2]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Infernal Siegebreaker hits Stormwind Soldier for 1874 Fire damage.[COMBATHITSCHOOLOTHEROTHER]", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Voljaka's Auto Shot crits Softhard for 761.", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Irondeep Miner crits Irondeep Skullthumper for 56.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Irondeep Trogg hits Irondeep Miner for 32.[COMBATHITOTHEROTHER]", -- [2]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"] = {
			["SPELLPOWERLEECHOTHERSELF"] = {
				"%s's %s drains %d %s from you. %s gains %d %s.", -- [1]
				"Obsidian Eradicator's Drain Mana drains 250 Mana from you. Obsidian Eradicator gains 500 Mana.", -- [2]
			},
			["SIMPLEPERFORMOTHERSELF"] = {
				"%s performs %s on you.SIMPLEPERFORMOTHERSELF", -- [1]
				"Hatecrest Serpent Guard performs Dazed on you.SIMPLEPERFORMOTHERSELF", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Firewing Defender's Mana Tap drains 1270 Mana from Haaroon.", -- [2]
				"2.0.8.6403", -- [3]
			},
			["SPELLLOGSCHOOLSELF"] = {
				"%s hits you for %d %s damage.[SPELLLOGSCHOOLSELF]", -- [1]
				"Flame Wave hits you for 275 Fire damage.[SPELLLOGSCHOOLSELF]", -- [2]
			},
			["SPELLINTERRUPTOTHERSELF"] = {
				"%s interrupts your %s.", -- [1]
				"Molten Destroyer interrupts your Shadow Bolt.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Wildspawn Rogue's Sinister Strike was parried by Wildspawn Rogue.", -- [2]
			},
			["SPELLDODGEDOTHERSELF"] = {
				"%s's %s was dodged.", -- [1]
				"Hatecrest Warrior's Disarm was dodged.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Mo'arg Forgefiend's Slime Spray fails. Battle Chicken is immune.", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLRESISTSELF"] = {
				"%s was resisted.", -- [1]
				"Warp Storm was resisted.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLSPLITDAMAGEOTHEROTHER"] = {
				"%s's %s causes %s %d damage.", -- [1]
				"Kirin'Var Ghost's Soulbind causes Bryantia 153 damage.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Wildspawn Imp's Fire Blast is absorbed by Wildspawn Hellcaller.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Black Widow Hatchling's Infected Bite missed Khuunam.", -- [2]
			},
			["SPELLLOGOTHERSELF"] = {
				"%s's %s hits you for %d.", -- [1]
				"Unknown Entity's Ravage hits you for 718.", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.", -- [1]
				"Epoch Hunter casts Disrupt Magic on you.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLMISSOTHERSELF"] = {
				"%s's %s misses you.", -- [1]
				"Bluegill Raider's Throw misses you.", -- [2]
			},
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"Skithian Dreadhawk's Wing Clip was blocked by Haaroon.", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLLOGABSORBSELF"] = {
				"You absorb %s.", -- [1]
				"You absorb Flame Wave.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Blackhand Veteran interrupts Bryantia's Seduction.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Infernal is immune to Warbringer Arix'Amal's Fel Fire.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Redark's Ambush crits Khuunam for 1392.", -- [2]
			},
			["SPELLLOGCRITOTHERSELF"] = {
				"%s's %s crits you for %d.", -- [1]
				"Unknown Entity's Ravage crits you for 695.", -- [2]
			},
			["SPELLRESISTOTHER"] = {
				"%s was resisted by %s.", -- [1]
				"Frostbite was resisted by Haaroon.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Unknown Entity's Attack hits you for 49 Fire damage.", -- [2]
			},
			["SPELLRESISTOTHERSELF"] = {
				"%s's %s was resisted.", -- [1]
				"Skeletal Raider's Slowing Poison was resisted.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Flame Wave is absorbed by Bryantia.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Wildspawn Rogue's Rupture was dodged by Wildspawn Rogue.", -- [2]
			},
			["SPELLPARRIEDOTHERSELF"] = {
				"%s's %s was parried.", -- [1]
				"Southsea Dock Worker's Head Crack was parried.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Epoch Hunter casts Disrupt Magic on Yazlop.[SIMPLECASTOTHEROTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Wildspawn Imp's Fire Blast hits Wildspawn Hellcaller for 210 Fire damage. (210 resisted)", -- [2]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Flame Wave hits Bryantia for 259 Fire damage.[SPELLLOGSCHOOLOTHER]", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Wildspawn Rogue's Sinister Strike hits Wildspawn Rogue for 232.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHERSELF"] = {
				"%s's %s crits you for %d %s damage.", -- [1]
				"Magma Totem's Magma Totem crits you for 31 Fire damage. (7 resisted)", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Frostwolf Legionnaire performs Dazed on Khuunam.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Wildspawn Rogue's Poison was resisted by Wildspawn Rogue.", -- [2]
			},
			["SPELLIMMUNEOTHER"] = {
				"%s fails. %s is immune.", -- [1]
				"Flame Wave fails. Infernal is immune.", -- [2]
			},
			["SPELLLOGABSORBOTHERSELF"] = {
				"You absorb %s's %s.", -- [1]
				"You absorb Wildspawn Hellcaller's Fire Shield.", -- [2]
			},
			["SPELLPOWERDRAINOTHERSELF"] = {
				"%s's %s drains %d %s from you.", -- [1]
				"Firewing Defender's Mana Tap drains 1270 Mana from you.", -- [2]
				"2.0.8.6403", -- [3]
			},
			["SPELLSPLITDAMAGEOTHERSELF"] = {
				"%s's %s causes you %d damage.", -- [1]
				"Kirin'Var Ghost's Soulbind causes you 105 damage.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE"] = {
			["SIMPLEPERFORMOTHERSELF"] = {
				"%s performs %s on you.SIMPLEPERFORMOTHERSELF", -- [1]
				"Topballer performs Distract on you.SIMPLEPERFORMOTHERSELF", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Jezzable's Mana Drain drains 8 Mana from Wadee.", -- [2]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Vyxxenn begins to perform Shoot.", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Nhazgrez performs Shield Slam on Mkxfrost.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLIMMUNEOTHERSELF"] = {
				"%s's %s failed. You are immune.", -- [1]
				"Oxyox's Taunt failed. You are immune.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHER"] = {
				"%s crits %s for %d %s damage.[SPELLLOGCRITSCHOOLOTHER]", -- [1]
				"Arcane Explosion crits Norty for 1647 Arcane damage.[SPELLLOGCRITSCHOOLOTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Morike's Frost Nova crits Jagnus for 175 Frost damage.", -- [2]
			},
			["SPELLINTERRUPTOTHERSELF"] = {
				"%s interrupts your %s.", -- [1]
				"Lemper interrupts your Fear.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Yurneroo's Hamstring was parried by Proxor.", -- [2]
			},
			["SPELLDODGEDOTHERSELF"] = {
				"%s's %s was dodged.", -- [1]
				"Hannibal's Claw was dodged.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Vyxxenn's Psychic Scream fails. Cleatus is immune.", -- [2]
			},
			["SPELLSPLITDAMAGEOTHEROTHER"] = {
				"%s's %s causes %s %d damage.", -- [1]
				"Zhangyi's Soul Link causes Nazlia 359 damage.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Althion fails to dispel Althion's Drain Mana.", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Rienne's Auto Shot was evaded by Champion Guardsman.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Thermopolis's Thunder Clap is absorbed by Proxor.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Chevr's Multi-Shot missed Chickenlady.", -- [2]
			},
			["SPELLLOGOTHERSELF"] = {
				"%s's %s hits you for %d.", -- [1]
				"Yurneroo's Intercept Stun hits you for 51.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Frucheman casts Judgement of Command.[SPELLTERSE_OTHER]", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.SIMPLECASTOTHERSELF", -- [1]
				"Narwen casts Polymorph on you.SIMPLECASTOTHERSELF", -- [2]
			},
			["SPELLMISSOTHERSELF"] = {
				"%s's %s misses you.", -- [1]
				"Rhak's Multi-Shot misses you.", -- [2]
			},
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"Turbo's Claw was blocked by Stormpike Defender.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHERSELF"] = {
				"%s's %s crits you for %d %s damage.", -- [1]
				"Morike's Cone of Cold crits you for 840 Frost damage.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Jaybaz interrupts Ponnie's Holy Light.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Bleinmeis is immune to Madsniper's Thorns.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Yurneroo's Hamstring crits Sapo for 72.", -- [2]
			},
			["SPELLLOGCRITOTHERSELF"] = {
				"%s's %s crits you for %d.", -- [1]
				"Yurneroo's Whirlwind crits you for 797.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"fuzzbat casts Growl on BeMyFriend.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["INSTAKILLOTHER"] = {
				"%s is killed by %s.", -- [1]
				"Phanthang is killed by Sacrifice.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Vyxxenn's Touch of Weakness hits you for 59 Shadow damage.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Thermopolis's Demoralizing Shout was resisted by Accalonia.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Morike begins to cast Arcane Explosion.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Arcane Explosion is absorbed by Kruztique.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Sludge's Mortal Strike was dodged by Sharrakor.", -- [2]
			},
			["SPELLPARRIEDOTHERSELF"] = {
				"%s's %s was parried.", -- [1]
				"Fiasco's Claw was parried.", -- [2]
			},
			["SPELLRESISTOTHERSELF"] = {
				"%s's %s was resisted.", -- [1]
				"Vyxxenn's Shoot was resisted.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Vyxxenn's Touch of Weakness hits Cleatus for 65 Shadow damage.", -- [2]
			},
			["SPELLPOWERDRAINOTHERSELF"] = {
				"%s's %s drains %d %s from you.", -- [1]
				"Jezzable's Mana Drain drains 8 Mana from you.", -- [2]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Spore Explosion hits Iamvj for 617 Nature damage.[SPELLLOGSCHOOLOTHER] (685 resisted)", -- [2]
			},
			["DISPELFAILEDOTHERSELF"] = {
				"%s fails to dispel your %s.", -- [1]
				"Alinas fails to dispel your Ancient Dread.", -- [2]
			},
			["SPELLLOGSCHOOLSELF"] = {
				"%s hits you for %d %s damage.[SPELLLOGSCHOOLSELF]", -- [1]
				"Arcane Explosion hits you for 857 Arcane damage.[SPELLLOGSCHOOLSELF]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Yurneroo's Whirlwind hits Sapito for 236.", -- [2]
			},
			["SPELLEXTRAATTACKSOTHER_SINGULAR"] = {
				"%s gains %d extra attack through %s.", -- [1]
				"Datexy gains 1 extra attack through Stormstrike.", -- [2]
			},
			["SPELLLOGABSORBOTHERSELF"] = {
				"You absorb %s's %s.", -- [1]
				"You absorb Dasbean's Immolate.", -- [2]
			},
			["SPELLLOGABSORBSELF"] = {
				"You absorb %s.", -- [1]
				"You absorb Arcane Explosion.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Whuzed's Earth Shock is reflected back by Mageslayer.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF"] = {
			["PROCRESISTOTHERSELF"] = {
				"You resist %s's %s.", -- [1]
				"You resist Winterfall Shaman's Lightning Shield.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Mo'arg Warp-Master's Steal Weapon was dodged by Gan'arg Warp-Tinker.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Haaroon gains 20 Mana from Arcane Vortex's Arcane Surge.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Legion Fel Cannon's Fel Cannon Blast was resisted by Haaroon.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Gan'arg Warp-Tinker's Steal Weapon was parried by Gan'arg Warp-Tinker.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["PROCRESISTOTHEROTHER"] = {
				"%s resists %s's %s.", -- [1]
				"Khuunam resists Winterfall Shaman's Lightning Shield.", -- [2]
			},
			["POWERGAINOTHERSELF"] = {
				"You gain %d %s from %s's %s.", -- [1]
				"You gain 20 Mana from Arcane Vortex's Arcane Surge.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.SIMPLECASTOTHERSELF", -- [1]
				"Chained Spirit casts Revive on you.SIMPLECASTOTHERSELF", -- [2]
			},
			["HEALEDOTHERSELF"] = {
				"%s's %s heals you for %d.[HEALEDOTHERSELF]", -- [1]
				"Kruztique's Greater Heal heals you for 2824.[HEALEDOTHERSELF]", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SKILL"] = {
			["ERR_SKILL_UP_SI"] = {
				"Your skill in %s has increased to %d.[ERR_SKILL_UP_SI]", -- [1]
				"Your skill in Riding has increased to 150.[ERR_SKILL_UP_SI]", -- [2]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = {
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"Blackhand Veteran's Shield Bash was blocked by Hang.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Molten Destroyer interrupts Narwen's Frostbolt.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Damnh is immune to Buru the Gorger's Creeping Plague.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Unknown Entity's Ambush crits Darkvillian for 1322.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Epoch Hunter casts Disrupt Magic on Thrall.[SIMPLECASTOTHEROTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Unknown's Lash of Pain crits Treka for 110 Shadow damage.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Slim's Friend's Poison was resisted by Gilman.", -- [2]
			},
			["SPELLDURABILITYDAMAGEOTHEROTHER"] = {
				"%s casts %s on %s: %s damaged.", -- [1]
				"Ragnaros casts Melt Weapon on Dragonx: Bloodlord's Defender damaged.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Prairie Wolf begins to cast Threatening Growl.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Southsea Pirate's Strike was parried by Thimtamuya.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Flamewaker's Fist of Ragnaros fails. Librabear is immune.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Obsidian Eradicator's Drain Mana drains 250 Mana from Dizdk. Obsidian Eradicator gains 500 Mana.", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Irondeep Trogg performs Dazed on Irondeep Miner.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Alliance Sentinel's Cleave was dodged by Tric.", -- [2]
			},
			["SPELLSPLITDAMAGEOTHEROTHER"] = {
				"%s's %s causes %s %d damage.", -- [1]
				"Dreghood Drudge's Shared Bonds causes Dreghood Drudge 71 damage.", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Liquid Fire's Blaze was evaded by Champion Defender.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Stormpike Mountaineer's Explosive Shot hits Zunk for 215 Fire damage.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Stormpike Mountaineer's Shoot is absorbed by Maulive.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Seasoned Guardian's Revenge hits Cleatus for 71.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Stormpike Mountaineer's Shoot missed Zunk.", -- [2]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Flame Wave hits Dreamcatcher for 255 Fire damage.[SPELLLOGSCHOOLOTHER]", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Arazzius the Cruel casts Inferno.[SPELLTERSE_OTHER]", -- [2]
			},
			["INSTAKILLOTHER"] = {
				"%s is killed by %s.", -- [1]
				"Gan'arg Sapper is killed by Power Burn.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Firewing Warlock's Mana Tap drains 1270 Mana from Tyranno.", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Stormpike Mountaineer begins to perform Shoot.", -- [2]
			},
			["SPELLTERSEPERFORM_OTHER"] = {
				"%s performs %s.[SPELLTERSEPERFORM_OTHER]", -- [1]
				"Entropic Eye performs Chaos Breath.[SPELLTERSEPERFORM_OTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"] = {
			["PERIODICAURAHEALSELFOTHER"] = {
				"%s gains %d health from your %s.", -- [1]
				"Wildspawn Rogue gains 153 health from your Health Funnel.", -- [2]
			},
			["POWERGAINSELFSELF"] = {
				"You gain %d %s from %s.[POWERGAINSELFSELF]", -- [1]
				"You gain 144 Mana from Fel Energy.[POWERGAINSELFSELF]", -- [2]
			},
			["AURAADDEDSELFHELPFUL"] = {
				"You gain %s.", -- [1]
				"You gain Sprint.", -- [2]
			},
			["PERIODICAURAHEALOTHEROTHER"] = {
				"%s gains %d health from %s's %s.", -- [1]
				"Wildspawn Hellcaller gains 223 health from Kruztique's Renew.", -- [2]
			},
			["AURAAPPLICATIONADDEDSELFHELPFUL"] = {
				"You gain %s (%d).", -- [1]
				"You gain Lifebloom (2).", -- [2]
			},
			["AURAADDEDOTHERHELPFUL"] = {
				"%s gains %s.", -- [1]
				"Khuunam gains Master Demonologist.", -- [2]
			},
			["PERIODICAURAHEALSELFSELF"] = {
				"You gain %d health from %s.[PERIODICAURAHEALSELFSELF]", -- [1]
				"You gain 250 health from First Aid.[PERIODICAURAHEALSELFSELF]", -- [2]
			},
			["PERIODICAURAHEALOTHERSELF"] = {
				"You gain %d health from %s's %s.", -- [1]
				"You gain 223 health from Kruztique's Renew.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHELPFUL"] = {
				"%s gains %s (%d).", -- [1]
				"Haaroon gains Demonic Frenzy (2).", -- [2]
			},
		},
		["CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF"] = {
			["DAMAGESHIELDSELFOTHER"] = {
				"You reflect %d %s damage to %s.", -- [1]
				"You reflect 15 Nature damage to Southsea Freebooter.", -- [2]
			},
			["SPELLRESISTSELFOTHER"] = {
				"Your %s was resisted by %s.", -- [1]
				"Your Thorns was resisted by Southsea Swashbuckler.", -- [2]
			},
			["DAMAGESHIELDOTHEROTHER"] = {
				"%s reflects %d %s damage to %s.", -- [1]
				"Deranged Helboar reflects 25 Fire damage to Deranged Helboar.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Deranged Helboar's Burning Spikes was resisted by Deranged Helboar.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"] = {
			["SPELLEXTRAATTACKSOTHER_SINGULAR"] = {
				"%s gains %d extra attack through %s.", -- [1]
				"Sludge gains 1 extra attack through Hand of Justice.", -- [2]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Shammycow begins to perform Skinning.", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Lokris performs Vanish on Lokris.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLIMMUNEOTHERSELF"] = {
				"%s's %s failed. You are immune.", -- [1]
				"Ponnie's First Aid failed. You are immune.", -- [2]
			},
			["SPELLTERSEPERFORM_OTHER"] = {
				"%s performs %s.[SPELLTERSEPERFORM_OTHER]", -- [1]
				"Colding performs Cannibalize.[SPELLTERSEPERFORM_OTHER]", -- [2]
			},
			["ITEMENCHANTMENTADDOTHEROTHER"] = {
				"%s casts %s on %s's %s.", -- [1]
				"Zay casts +15 Fire Resistance on Cleatus's Onyxia Scale Cloak.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Fzuufenn's Devour Magic was resisted by Ponnie.", -- [2]
			},
			["SPELLEXTRAATTACKSOTHER"] = {
				"%s gains %d extra attacks through %s.", -- [1]
				"Petergibbons gains 2 extra attacks through Windfury Attack.", -- [2]
			},
			["HEALEDOTHERSELF"] = {
				"%s's %s heals you for %d.[HEALEDOTHERSELF]", -- [1]
				"Kruztique's Flash Heal heals you for 1176.[HEALEDOTHERSELF]", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Amantar begins to cast Greater Heal.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Kruztique's Weakened Soul fails. Narwen is immune.", -- [2]
			},
			["POWERGAINOTHERSELF"] = {
				"You gain %d %s from %s's %s.", -- [1]
				"You gain 60 Mana from Morisen's Rejuvenation.", -- [2]
			},
			["HEALEDCRITOTHEROTHER"] = {
				"%s's %s critically heals %s for %d.", -- [1]
				"Evelgest's Flash Heal critically heals Neckrataal for 1597.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Magosko's Dark Pact drains 250 Mana from Unknown Entity. Magosko gains 250 Mana.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Khuudom fails to dispel Boonie's Demon Armor.", -- [2]
			},
			["OPEN_LOCK_OTHER"] = {
				"%s performs %s on %s.[OPEN_LOCK_OTHER]", -- [1]
				"Kruztique performs Herb Gathering on Dreamfoil.[OPEN_LOCK_OTHER]", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Yurneroo gains 15 Rage from Yurneroo's Charge.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Bakmoi casts Dispel Magic on Frucheman.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["DISPELFAILEDOTHERSELF"] = {
				"%s fails to dispel your %s.", -- [1]
				"Poyayan fails to dispel your Power Word: Fortitude.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Lionkingz's Zulian Slice missed Cleatus.", -- [2]
			},
			["HEALEDOTHEROTHER"] = {
				"%s's %s heals %s for %d.", -- [1]
				"Vyxxenn's Devouring Plague heals Vyxxenn for 106.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Zryan casts Mana Spring Totem.[SPELLTERSE_OTHER]", -- [2]
			},
			["SPELLRESISTOTHERSELF"] = {
				"%s's %s was resisted.", -- [1]
				"Khuudom's Devour Magic was resisted.", -- [2]
			},
			["HEALEDCRITOTHERSELF"] = {
				"%s's %s critically heals you for %d.", -- [1]
				"Kruztique's Greater Heal critically heals you for 3183.", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.SIMPLECASTOTHERSELF", -- [1]
				"Ponnie casts Cleanse on you.SIMPLECASTOTHERSELF", -- [2]
			},
			["ITEMENCHANTMENTADDOTHERSELF"] = {
				"%s casts %s on your %s.", -- [1]
				"Erato casts +26 Attack Power on your Marshal's Leather Handgrips.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES"] = {
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Rokugo attacks. Cleatus blocks.", -- [2]
			},
			["MISSEDOTHERSELF"] = {
				"%s misses you.", -- [1]
				"Himta misses you.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Hannibal attacks. Euthanatos dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Sludge attacks. Sharrakor parries.", -- [2]
			},
			["VSIMMUNEOTHERSELF"] = {
				"%s attacks but you are immune.", -- [1]
				"Plethora attacks but you are immune.", -- [2]
			},
			["VSPARRYOTHERSELF"] = {
				"%s attacks. You parry.", -- [1]
				"Zibana attacks. You parry.", -- [2]
			},
			["VSEVADEOTHEROTHER"] = {
				"%s attacks. %s evades.", -- [1]
				"Irenala attacks. Champion Guardsman evades.", -- [2]
			},
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Snackpak attacks but Minimonty is immune.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Blaymord misses Sharrakor.", -- [2]
			},
			["VSABSORBOTHERSELF"] = {
				"%s attacks. You absorb all the damage.", -- [1]
				"Stupifier attacks. You absorb all the damage.", -- [2]
			},
			["VSDODGEOTHERSELF"] = {
				"%s attacks. You dodge.", -- [1]
				"Fiasco attacks. You dodge.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Thermopolis attacks. Proxor absorbs all the damage.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_MISC_INFO"] = {
			["DURABILITYDAMAGE_DEATH"] = {
				"Your equipped items suffer a 10%% durability loss.", -- [1]
				"Your equipped items suffer a 10% durability loss.", -- [2]
			},
			["SPELLDISMISSPETOTHER"] = {
				"%s's %s is dismissed.", -- [1]
				"Zay's Kay is dismissed.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_PARTY_MISSES"] = {
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Cat attacks. Althion absorbs all the damage.", -- [2]
			},
			["MISSEDOTHERSELF"] = {
				"%s misses you.", -- [1]
				"Treant misses you.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Kruztique attacks. Wildspawn Trickster dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Kruztique attacks. Whip Lasher parries.", -- [2]
			},
			["VSEVADEOTHEROTHER"] = {
				"%s attacks. %s evades.", -- [1]
				"Ponnie attacks. Zukk'ash Stinger evades.", -- [2]
			},
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Styxson attacks but Anvilrage Officer is immune.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Pete misses Petergibbons.", -- [2]
			},
			["VSDODGEOTHERSELF"] = {
				"%s attacks. You dodge.", -- [1]
				"Treant attacks. You dodge.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Kruztique attacks. Hydrospawn blocks.", -- [2]
			},
		},
		["CHAT_MSG_MONEY"] = {
			["LOOT_MONEY_SPLIT"] = {
				"Your share of the loot is %s.", -- [1]
				"Your share of the loot is 22 Copper.", -- [2]
			},
			["YOU_LOOT_MONEY"] = {
				"You loot %s[YOU_LOOT_MONEY]", -- [1]
				"You loot 2 Silver, 31 Copper[YOU_LOOT_MONEY]", -- [2]
				"2.0.6", -- [3]
			},
		},
		["CHAT_MSG_COMBAT_SELF_MISSES"] = {
			["VSPARRYSELFOTHER"] = {
				"You attack. %s parries.", -- [1]
				"You attack. Zakarum parries.", -- [2]
			},
			["VSEVADESELFOTHER"] = {
				"You attack. %s evades.", -- [1]
				"You attack. Zukk'ash Stinger evades.", -- [2]
			},
			["MISSEDSELFOTHER"] = {
				"You miss %s.", -- [1]
				"You miss Alterac Ram.", -- [2]
			},
			["VSIMMUNESELFOTHER"] = {
				"You attack but %s is immune.", -- [1]
				"You attack but Wildspawn Shadowstalker is immune.", -- [2]
			},
			["VSBLOCKSELFOTHER"] = {
				"You attack. %s blocks.", -- [1]
				"You attack. Flamekin Rager blocks.", -- [2]
			},
			["VSDODGESELFOTHER"] = {
				"You attack. %s dodges.", -- [1]
				"You attack. Vyxxenn dodges.", -- [2]
			},
			["VSABSORBSELFOTHER"] = {
				"You attack. %s absorbs all the damage.", -- [1]
				"You attack. Vyxxenn absorbs all the damage.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PET_DAMAGE"] = {
			["SIMPLEPERFORMOTHERSELF"] = {
				"%s performs %s on you.SIMPLEPERFORMOTHERSELF", -- [1]
				"Wildspawn Shadowstalker performs Dazed on you.SIMPLEPERFORMOTHERSELF", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Khuunam interrupts Althion's Mind Blast.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Wildspawn Shadowstalker is immune to Wildspawn Rogue's Poison.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Wildspawn Satyr's Strike crits Fel Lash for 1046.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHER"] = {
				"%s crits %s for %d %s damage.[SPELLLOGCRITSCHOOLOTHER]", -- [1]
				"Spore Explosion crits Haaroon for 2684 Nature damage.[SPELLLOGCRITSCHOOLOTHER]", -- [2]
			},
			["INSTAKILLOTHER"] = {
				"%s is killed by %s.", -- [1]
				"Khuunam is killed by Demonic Sacrifice.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Wildspawn Hellcaller's Fire Shield hits you for 67 Fire damage.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Wildspawn Rogue's Poison was resisted by Wildspawn Rogue.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Wildspawn Rogue's Rupture was parried by Wildspawn Rogue.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Wildspawn Hellcaller's Fire Shield crits Wildspawn Imp for 76 Fire damage. (17 resisted)", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Bryantia begins to cast Seduction.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Flame Wave is absorbed by Kruztique.", -- [2]
			},
			["SPELLLOGSCHOOLSELF"] = {
				"%s hits you for %d %s damage.[SPELLLOGSCHOOLSELF]", -- [1]
				"Flame Wave hits you for 275 Fire damage.[SPELLLOGSCHOOLSELF]", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Wildspawn Shadowstalker's Slowing Poison fails. Fel Lash is immune.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Haaroon casts Anguish on Unyielding Footman.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Khuunam's Tainted Blood Effect was evaded by Wing Commander Guse.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Wildspawn Rogue's Sinister Strike was dodged by Wildspawn Trickster.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Khuunam fails to dispel Gibbles's Corruption.", -- [2]
			},
			["DISPELFAILEDOTHERSELF"] = {
				"%s fails to dispel your %s.", -- [1]
				"Khuunam fails to dispel your Corruption.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Wildspawn Hellcaller's Fire Shield hits Wildspawn Imp for 51 Fire damage. (17 resisted)", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Wildspawn Shadowstalker's Backstab is absorbed by Wildspawn Felsworn.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Wildspawn Rogue's Sinister Strike hits Wildspawn Rogue for 238.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Wildspawn Rogue's Sinister Strike missed Wildspawn Trickster.", -- [2]
			},
			["SPELLLOGOTHERSELF"] = {
				"%s's %s hits you for %d.", -- [1]
				"Doomsaw's Doomsaw hits you for 344.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Flame Wave hits Wrathguard for 255 Fire damage.[SPELLLOGSCHOOLOTHER]", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Phantaz's Torment is reflected back by Greater Obsidian Elemental.", -- [2]
			},
			["SPELLLOGABSORBOTHERSELF"] = {
				"You absorb %s's %s.", -- [1]
				"You absorb Fel Imp's Firebolt.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGABSORBSELF"] = {
				"You absorb %s.", -- [1]
				"You absorb Arcane Explosion.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Nethervine Inciter begins to perform Deadly Poison.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SPELL_PARTY_DAMAGE"] = {
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"feedsontroll's Bite was blocked by Dark Iron Sentry.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Bigpotato interrupts Scholomance Neophyte's Shadow Bolt.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Phase Lasher is immune to Kruztique's Shadow Word: Pain.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Mos's Auto Shot crits Sorcer for 172. (570 absorbed)", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Nino casts Righteous Defense on Frostwolf Guardian.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Mos's Arcane Shot crits Chevr for 439 Arcane damage.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Arcanite Dragonling's Flame Breath hits you for 180 Fire damage. (75 resisted) (45 absorbed)", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Minimonty's Hammer of Justice was resisted by Xeranuus.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Ponnie's Seal of Command was parried by Hatecrest Screamer.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Arcanite Dragonling begins to cast Flame Buffet.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Mos's Auto Shot fails. Moiranna is immune.", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Narwen's Frostbolt is reflected back by Flamewaker Elite.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Kruztique fails to dispel Trixaria's Soul Burn.", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Ponnie's Judgement was evaded by Zukk'ash Stinger.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Dragonx's Intercept Stun is absorbed by Narwen.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Mos's Auto Shot hits Chevr for 242.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Mos's Scatter Shot missed Petergibbons.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Mos's Arcane Shot hits Neckrataal for 187 Arcane damage.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Ponnie's Seal of Command was dodged by Hatecrest Warrior.", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Librabear performs Taunt on West Frostwolf Warmaster.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
		},
		["CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE"] = {
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"Aurean's Auto Shot was blocked by Groghole.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Fuzzboy's Mana Drain drains 8 Mana from Djiaar.", -- [2]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Sapo begins to perform Auto Shot.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Sekaikaze's Mortal Strike crits Alterac Ram for 531.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"BeMyFriend casts Growl on fuzzbat.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["INSTAKILLOTHER"] = {
				"%s is killed by %s.", -- [1]
				"Yanglt is killed by Divine Intervention.", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Gateli's Plague Effect hits you for 593 Nature damage.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Cleatus's Charge Stun was resisted by Yurneroo.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Sapito's Claw was parried by Yurneroo.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Haihachi begins to cast Pyroblast.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Bibliography's Pyroblast fails. Evilsoul is immune.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Euthanatos interrupts Victron's Lesser Healing Wave.", -- [2]
			},
			["SPELLDURABILITYDAMAGEOTHEROTHER"] = {
				"%s casts %s on %s: %s damaged.", -- [1]
				"Damnh casts Force Reactive Disk on Damnh: Force Reactive Disk damaged.", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Trixaria's Polymorph is reflected back by Flamewaker Healer.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Fimbulstran fails to dispel Librabear's Gehennas' Curse.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Cleatus's Execute was dodged by Yurneroo.", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Mistick's Taunt was evaded by Lava Annihilator.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Sapo's Wing Clip is absorbed by Yurneroo.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Sekaikaze's Mortal Strike hits Alterac Ram for 243.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Jeebes's Hemorrhage missed Seasoned Guardian.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Haihachi's Frost Nova hits Vyxxenn for 88 Frost damage.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Kimbeatina casts Judgement of Command.[SPELLTERSE_OTHER]", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Bz performs Distract on Emianich.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLSPLITDAMAGEOTHEROTHER"] = {
				"%s's %s causes %s %d damage.", -- [1]
				"Tarlic's Soul Link causes Khaajhom 28 damage.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Onyxia is immune to Dragonx's Fire Shield.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Accalonia's Searing Pain crits Hoofarted for 498 Fire damage.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_ITEM_ENCHANTMENTS"] = {
			["ITEMENCHANTMENTADDOTHERSELF"] = {
				"%s casts %s on your %s.", -- [1]
				"Narwen casts Brilliant Wizard Oil on your Sageclaw.", -- [2]
			},
			["ITEMENCHANTMENTADDOTHEROTHER"] = {
				"%s casts %s on %s's %s.", -- [1]
				"Shammycow casts Rockbiter 7 on Shammycow's Lord Alexander's Battle Axe.", -- [2]
			},
			["ITEMENCHANTMENTADDSELFOTHER"] = {
				"You cast %s on %s's %s.", -- [1]
				"You cast Wizard Oil on Kruztique's Benediction.", -- [2]
			},
			["ITEMENCHANTMENTADDSELFSELF"] = {
				"You cast %s on your %s.", -- [1]
				"You cast Crippling Poison on your Stormstrike Hammer.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_SELF_HITS"] = {
			["COMBATHITSELFOTHER"] = {
				"You hit %s for %d.", -- [1]
				"You hit Alterac Ram for 164.", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_FALLING_SELF"] = {
				"You fall and lose %d health.", -- [1]
				"You fall and lose 843 health.", -- [2]
			},
			["COMBATHITCRITSELFOTHER"] = {
				"You crit %s for %d.", -- [1]
				"You crit Vyxxenn for 152.", -- [2]
			},
			["SPELLLOGSELFOTHER"] = {
				"Your %s hits %s for %d.", -- [1]
				"Your Shoot Crossbow hits Rat for 277.", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_DROWNING_SELF"] = {
				"You are drowning and lose %d health.", -- [1]
				"You are drowning and lose 958 health.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGCRITSCHOOLSELFOTHER"] = {
				"Your %s crits %s for %d %s damage.", -- [1]
				"Your Shoot crits Edilio for 99 Shadow damage.", -- [2]
			},
			["SPELLLOGCRITSELFOTHER"] = {
				"Your %s crits %s for %d.", -- [1]
				"Your Throw crits Shattered Hand Berserker for 247.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSENVIRONMENTALDAMAGE_LAVA_SELF"] = {
				"You lose %d health for swimming in lava.", -- [1]
				"You lose 603 health for swimming in lava.", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_FIRE_SELF"] = {
				"You suffer %d points of fire damage.", -- [1]
				"You suffer 13 points of fire damage.", -- [2]
			},
			["SPELLLOGSCHOOLSELFOTHER"] = {
				"Your %s hits %s for %d %s damage.", -- [1]
				"Your Shoot hits Edilio for 82 Shadow damage.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_PET_HITS"] = {
			["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
				"%s suffers %d points of fire damage.", -- [1]
				"Wildspawn Hellcaller suffers 12 points of fire damage.", -- [2]
			},
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Khuunam hits Irondeep Skullthumper for 154.[COMBATHITOTHEROTHER]", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Khuunam crits Irondeep Skullthumper for 206.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["COMBATHITOTHERSELF"] = {
				"%s hits you for %d.[COMBATHITOTHERSELF]", -- [1]
				"Nethervine Reaper hits you for 1308.[COMBATHITOTHERSELF]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSENVIRONMENTALDAMAGE_LAVA_OTHER"] = {
				"%s loses %d health for swimming in lava.", -- [1]
				"Khuunam loses 1087 health for swimming in lava. (362 resisted)", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PET_BUFF"] = {
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Khuunam's Devour Magic fails. Grounding Totem is immune.", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Khuunam's Devour Magic is reflected back by Iamvj.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Khuunam fails to dispel Horrobull's Lightning Shield.", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Phantaz gains 46 Mana from Phantaz's Judgement of Wisdom.", -- [2]
			},
			["HEALEDOTHEROTHER"] = {
				"%s's %s heals %s for %d.", -- [1]
				"Khuunam's Judgement of Light heals Khuunam for 61.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Khuunam's Devour Magic was resisted by Althion.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Wrathguard casts Flame Wave.[SPELLTERSE_OTHER]", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.SIMPLECASTOTHERSELF", -- [1]
				"Khuunam casts Devour Magic on you.SIMPLECASTOTHERSELF", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Hound of Culuthas begins to cast Double Breath.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["HEALEDCRITOTHEROTHER"] = {
				"%s's %s critically heals %s for %d.", -- [1]
				"Bryantia's Improved Leader of the Pack critically heals Bryantia for 174.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Khuunam casts Devour Magic on Vooy.[SIMPLECASTOTHEROTHER]", -- [2]
			},
		},
		["CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF"] = {
			["SPELLEXTRAATTACKSOTHER_SINGULAR"] = {
				"%s gains %d extra attack through %s.", -- [1]
				"Cleatus gains 1 extra attack through Sword Specialization.", -- [2]
			},
			["SPELLPERFORMOTHERSTART"] = {
				"%s begins to perform %s.", -- [1]
				"Aradan begins to perform Smelt Thorium.", -- [2]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Adeillis performs Vanish on Adeillis.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLTERSEPERFORM_OTHER"] = {
				"%s performs %s.[SPELLTERSEPERFORM_OTHER]", -- [1]
				"Illik performs Preparation.[SPELLTERSEPERFORM_OTHER]", -- [2]
			},
			["ITEMENCHANTMENTADDOTHEROTHER"] = {
				"%s casts %s on %s's %s.", -- [1]
				"Hrotngar casts Scope (+7 Damage) on Hrotngar's Precisely Calibrated Boomstick.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Pryyfun's Devour Magic was resisted by Darigaaz.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Lionkingz's Zulian Slice was parried by Flamewaker.", -- [2]
			},
			["PROCRESISTOTHEROTHER"] = {
				"%s resists %s's %s.", -- [1]
				"Anubisath Sentinel resists Sejet's Greater Blessing of Sanctuary.", -- [2]
			},
			["SPELLCASTOTHERSTART"] = {
				"%s begins to cast %s.", -- [1]
				"Greil begins to cast Summon Charger.", -- [2]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Loughlenn's Dispel Magic fails. Moiranna is immune.", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Sikate's Zulian Slice was dodged by Firewalker.", -- [2]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Pameli fails to dispel Cleatus's Poisonous Blood.", -- [2]
			},
			["OPEN_LOCK_OTHER"] = {
				"%s performs %s on %s.[OPEN_LOCK_OTHER]", -- [1]
				"Dalimar performs Pick Lock on Wicker Chest.[OPEN_LOCK_OTHER]", -- [2]
			},
			["SPELLEVADEDOTHEROTHER"] = {
				"%s's %s was evaded by %s.", -- [1]
				"Nedru's Teleport to Player was evaded by Onyxian Whelp.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Magosko's Dark Pact drains 250 Mana from Bizmir. Magosko gains 250 Mana.", -- [2]
			},
			["SIMPLECASTOTHERSELF"] = {
				"%s casts %s on you.SIMPLECASTOTHERSELF", -- [1]
				"Slooghon casts Devour Magic on you.SIMPLECASTOTHERSELF", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Sikate's Zulian Slice missed Lava Spawn.", -- [2]
			},
			["HEALEDOTHEROTHER"] = {
				"%s's %s heals %s for %d.", -- [1]
				"Jeebes's Holy Strength heals Jeebes for 107.", -- [2]
			},
			["SPELLTERSE_OTHER"] = {
				"%s casts %s.[SPELLTERSE_OTHER]", -- [1]
				"Kadom casts Life Tap.[SPELLTERSE_OTHER]", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Fluxx casts Dispel Magic on Fluxx.[SIMPLECASTOTHEROTHER]", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Sekaikaze gains 1 Rage from Sekaikaze's Unbridled Wrath.", -- [2]
			},
			["HEALEDCRITOTHEROTHER"] = {
				"%s's %s critically heals %s for %d.", -- [1]
				"Xolkar's Holy Light critically heals Skopey for 2987.", -- [2]
			},
			["SPELLEXTRAATTACKSOTHER"] = {
				"%s gains %d extra attacks through %s.", -- [1]
				"Yukimoto gains 2 extra attacks through Windfury Attack.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_FRIENDLY_DEATH"] = {
			["PARTYKILLOTHER"] = {
				"%s is slain by %s!", -- [1]
				"Singh is slain by Mos!", -- [2]
			},
			["SELFKILLOTHER"] = {
				"You have slain %s!", -- [1]
				"You have slain Phantaz!", -- [2]
			},
			["UNITDIESSELF"] = {
				"You die.", -- [1]
				"You die.", -- [2]
			},
			["UNITDESTROYEDOTHER"] = {
				"%s is destroyed.", -- [1]
				"Grounding Totem is destroyed.", -- [2]
			},
			["UNITDIESOTHER"] = {
				"%s dies.", -- [1]
				"Sapo dies.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_FAILED_LOCALPLAYER"] = {
			["ERR_TARGET_NOT_IN_GROUP_S"] = {
				"%s is not in your party.", -- [1]
				"You fail to cast Ritual of Summoning: Target is not in your party.", -- [2]
			},
			["SPELLFAILCASTSELF"] = {
				"You fail to cast %s: %s.", -- [1]
				"You fail to cast Immune Charm/Fear/Polymorph: Item is not ready yet.", -- [2]
			},
			["SPELLFAILPERFORMSELF"] = {
				"You fail to perform %s: %s.", -- [1]
				"You fail to perform Hemorrhage: Not yet recovered.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS"] = {
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Hukku's Voidwalker hits Cornholyo for 25.", -- [2]
			},
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Alterac Ram hits Kruztique for 88.[COMBATHITOTHEROTHER]", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHEROTHER"] = {
				"%s crits %s for %d %s damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [1]
				"Blistering Oozeling crits Kruztique for 40 Nature damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [2]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Blistering Rot hits Kruztique for 156 Nature damage.[COMBATHITSCHOOLOTHEROTHER]", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Atal'ai Deathwalker's Spirit crits Ponnie for 467.", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Frostwolf crits Kruztique for 184.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Frayer Protector's Shoot Thorns hits Kruztique for 962 Nature damage.", -- [2]
				"2.0.10.6448", -- [3]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"] = {
			["SPELLLOGABSORBSELF"] = {
				"You absorb %s.", -- [1]
				"You absorb Flame Wave.", -- [2]
			},
			["PERIODICAURADAMAGEOTHER"] = {
				"%s suffers %d %s damage from %s.", -- [1]
				"Wrathguard suffers 259 Fire damage from Flame Wave.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Flame Wave is absorbed by Bryantia.", -- [2]
			},
			["PERIODICAURADAMAGESELFSELF"] = {
				"You suffer %d %s damage from your %s.", -- [1]
				"You suffer 215 Fire damage from your Hellfire.", -- [2]
			},
			["PERIODICAURADAMAGEOTHEROTHER"] = {
				"%s suffers %d %s damage from %s's %s.", -- [1]
				"Wildspawn Rogue suffers 100 Physical damage from Wildspawn Rogue's Rupture.", -- [2]
			},
			["SPELLLOGABSORBSELFSELF"] = {
				"You absorb your %s.", -- [1]
				"You absorb your Hellfire.", -- [2]
			},
			["PERIODICAURADAMAGESELFOTHER"] = {
				"%s suffers %d %s damage from your %s.", -- [1]
				"Doomguard suffers 283 Shadow damage from your Corruption.", -- [2]
			},
			["SPELLPOWERDRAINSELFOTHER"] = {
				"Your %s drains %d %s from %s.", -- [1]
				"Your Viper Sting drains 154 Mana from Skeletal Mage.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Wildspawn Felsworn's Shadow Word: Pain is absorbed by Wildspawn Shadowstalker.", -- [2]
			},
			["SPELLPOWERLEECHSELFOTHER"] = {
				"Your %s drains %d %s from %s. You gain %d %s.", -- [1]
				"Your Drain Mana drains 140 Mana from Althion. You gain 140 Mana.", -- [2]
			},
			["AURAADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s.", -- [1]
				"Wildspawn Rogue is afflicted by Enslave Demon.", -- [2]
			},
			["PERIODICAURADAMAGEOTHERSELF"] = {
				"You suffer %d %s damage from %s's %s.", -- [1]
				"You suffer 26 Physical damage from Alterac Ram's Rend.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s (%d).", -- [1]
				"Wildspawn Hellcaller is afflicted by Submersion (2).", -- [2]
			},
			["AURAAPPLICATIONADDEDSELFHARMFUL"] = {
				"You are afflicted by %s (%d).", -- [1]
				"You are afflicted by Shadow Vulnerability (2).", -- [2]
			},
			["SPELLLOGABSORBOTHERSELF"] = {
				"You absorb %s's %s.", -- [1]
				"You absorb Wildspawn Hellcaller's Rain of Fire.", -- [2]
			},
			["PERIODICAURADAMAGESELF"] = {
				"You suffer %d %s damage from %s.", -- [1]
				"You suffer 275 Fire damage from Flame Wave.", -- [2]
			},
			["AURAADDEDSELFHARMFUL"] = {
				"You are afflicted by %s.", -- [1]
				"You are afflicted by Rend.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE"] = {
			["SPELLBLOCKEDOTHEROTHER"] = {
				"%s's %s was blocked by %s.", -- [1]
				"Blackhand Iron Guard's Shield Slam was blocked by Cleatus.", -- [2]
			},
			["SPELLINTERRUPTOTHEROTHER"] = {
				"%s interrupts %s's %s.", -- [1]
				"Molten Destroyer interrupts Souldreamer's Holy Light.", -- [2]
			},
			["IMMUNESPELLOTHEROTHER"] = {
				"%s is immune to %s's %s.", -- [1]
				"Athenna is immune to Buru the Gorger's Creeping Plague.", -- [2]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Unknown Entity's Ambush crits Ponnie for 1090.", -- [2]
			},
			["SPELLRESISTOTHER"] = {
				"%s was resisted by %s.", -- [1]
				"Frostbite was resisted by Kruztique.", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Unknown's Firebolt crits Bleinmeis for 170 Fire damage.", -- [2]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Wildspawn Trickster's Curse of Weakness was resisted by Kruztique.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Obsidian Eradicator's Drain Mana drains 250 Mana from Bapakloe. Obsidian Eradicator gains 500 Mana.", -- [2]
			},
			["SPELLLOGABSORBOTHER"] = {
				"%s is absorbed by %s.", -- [1]
				"Flame Wave is absorbed by Kruztique.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Gehennas's Shadow Bolt fails. Souldreamer is immune.", -- [2]
			},
			["SIMPLECASTOTHEROTHER"] = {
				"%s casts %s on %s.[SIMPLECASTOTHEROTHER]", -- [1]
				"Epoch Hunter casts Disrupt Magic on Shair.[SIMPLECASTOTHEROTHER]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLSPLITDAMAGEOTHEROTHER"] = {
				"%s's %s causes %s %d damage.", -- [1]
				"Kirin'Var Ghost's Soulbind causes Alanfoster 159 damage.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["DISPELFAILEDOTHEROTHER"] = {
				"%s fails to dispel %s's %s.", -- [1]
				"Epoch Hunter fails to dispel Dartanion's Fire Shield.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGSCHOOLOTHER"] = {
				"%s hits %s for %d %s damage.[SPELLLOGSCHOOLOTHER]", -- [1]
				"Flame Wave hits Kruztique for 275 Fire damage.[SPELLLOGSCHOOLOTHER]", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Eliza's Frostbolt hits Aubrie for 120 Frost damage.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Wildspawn Rogue's Sinister Strike is absorbed by Kruztique.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Wildspawn Rogue's Sinister Strike hits Kruztique for 331.", -- [2]
			},
			["SPELLMISSOTHEROTHER"] = {
				"%s's %s missed %s.", -- [1]
				"Hatecrest Warrior's Disarm missed Ponnie.", -- [2]
			},
			["SPELLDURABILITYDAMAGEOTHEROTHER"] = {
				"%s casts %s on %s: %s damaged.", -- [1]
				"Ragnaros casts Melt Weapon on Guntlien: Silent Fang damaged.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Southsea Pirate's Strike was parried by Ponnie.", -- [2]
			},
			["SPELLREFLECTOTHEROTHER"] = {
				"%s's %s is reflected back by %s.", -- [1]
				"Shadowmoon Warlock's Shadow Bolt is reflected back by Iamvj.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Firewing Bloodwarder's Mana Tap drains 1290 Mana from Kruztique.", -- [2]
				"2.0.6", -- [3]
			},
			["SIMPLEPERFORMOTHEROTHER"] = {
				"%s performs %s on %s.[SIMPLEPERFORMOTHEROTHER]", -- [1]
				"Commander Louis Philips performs Dazed on Kruztique.[SIMPLEPERFORMOTHEROTHER]", -- [2]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Hatecrest Warrior's Disarm was dodged by Ponnie.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_HONOR_GAIN"] = {
			["COMBATLOG_HONORAWARD"] = {
				"You have been awarded %d honor points.", -- [1]
				"You have been awarded 198 honor points.", -- [2]
			},
			["COMBATLOG_HONORGAIN"] = {
				"%s dies, honorable kill Rank: %s (Estimated Honor Points: %d)", -- [1]
				"Vyxxenn dies, honorable kill Rank: Stone Guard (Estimated Honor Points: 80)", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS"] = {
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Irondeep Trogg hits Khuunam for 30.[COMBATHITOTHEROTHER]", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHEROTHER"] = {
				"%s crits %s for %d %s damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [1]
				"Blistering Rot crits Haaroon for 197 Nature damage.[COMBATHITCRITSCHOOLOTHEROTHER] (39 resisted)", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Irondeep Trogg crits Khuunam for 70.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["COMBATHITSCHOOLOTHERSELF"] = {
				"%s hits you for %d %s damage.[COMBATHITSCHOOLOTHERSELF]", -- [1]
				"Blistering Oozeling hits you for 21 Nature damage.[COMBATHITSCHOOLOTHERSELF]", -- [2]
			},
			["SPELLLOGSCHOOLOTHERSELF"] = {
				"%s's %s hits you for %d %s damage.", -- [1]
				"Frayer Protector's Shoot Thorns hits you for 955 Nature damage. (239 absorbed)", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLLOGOTHERSELF"] = {
				"%s's %s hits you for %d.", -- [1]
				"Hukku's Voidwalker hits you for 23.", -- [2]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Blistering Rot hits Terrorfiend for 149 Nature damage.[COMBATHITSCHOOLOTHEROTHER]", -- [2]
			},
			["COMBATHITCRITOTHERSELF"] = {
				"%s crits you for %d.[COMBATHITCRITOTHERSELF]", -- [1]
				"Irondeep Shaman crits you for 68.[COMBATHITCRITOTHERSELF] (17 absorbed)", -- [2]
			},
			["COMBATHITOTHERSELF"] = {
				"%s hits you for %d.[COMBATHITOTHERSELF]", -- [1]
				"Irondeep Trogg hits you for 26.[COMBATHITOTHERSELF] (7 absorbed)", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHERSELF"] = {
				"%s crits you for %d %s damage.[COMBATHITCRITSCHOOLOTHERSELF]", -- [1]
				"Nexus Terror crits you for 772 Shadow damage.[COMBATHITCRITSCHOOLOTHERSELF] (482 resisted) (193 absorbed)", -- [2]
				"2.0.6", -- [3]
			},
		},
		["CHAT_MSG_COMBAT_PET_MISSES"] = {
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"Phantaz attacks. Risen Guard blocks.", -- [2]
			},
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Wildspawn Rogue attacks but Wildspawn Rogue is immune.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Khuunam attacks. Althion absorbs all the damage.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Wildspawn Rogue misses Wildspawn Trickster.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Wildspawn Rogue attacks. Wildspawn Trickster dodges.", -- [2]
			},
			["VSDODGEOTHERSELF"] = {
				"%s attacks. You dodge.", -- [1]
				"Wrathbringer attacks. You dodge.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Wildspawn Rogue attacks. Wildspawn Trickster parries.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF"] = {
			["SPELLIMMUNEOTHEROTHER"] = {
				"%s's %s fails. %s is immune.", -- [1]
				"Arcatraz Sentinel's Energy Discharge fails. Nino is immune.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLRESISTOTHEROTHER"] = {
				"%s's %s was resisted by %s.", -- [1]
				"Arcatraz Sentinel's Energy Discharge was resisted by Nedru.", -- [2]
				"2.0.10.6448", -- [3]
			},
			["SPELLDODGEDOTHEROTHER"] = {
				"%s's %s was dodged by %s.", -- [1]
				"Sethekk Ravenguard's Bloodthirst was dodged by Shair.", -- [2]
				"2.0.12.6546", -- [3]
			},
			["PROCRESISTOTHEROTHER"] = {
				"%s resists %s's %s.", -- [1]
				"Librabear resists Winterfall Shaman's Lightning Shield.", -- [2]
			},
			["SPELLPARRIEDOTHEROTHER"] = {
				"%s's %s was parried by %s.", -- [1]
				"Shattered Hand Heathen's Bloodthirst was parried by Roond.", -- [2]
				"2.0.12.6546", -- [3]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Kruztique gains 280 Mana from Shadowfiend's Mana Leech.", -- [2]
				"2.0.6", -- [3]
			},
		},
		["CHAT_MSG_SPELL_AURA_GONE_PARTY"] = {
			["AURAREMOVEDOTHER"] = {
				"%s fades from %s.", -- [1]
				"Detect Greater Invisibility fades from Kruztique.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"] = {
			["PERIODICAURADAMAGEOTHEROTHER"] = {
				"%s suffers %d %s damage from %s's %s.", -- [1]
				"Sekaikaze suffers 26 Physical damage from Alterac Ram's Rend.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Sapo's Viper Sting drains 277 Mana from Vyxxenn.", -- [2]
			},
			["SPELLLOGABSORBOTHEROTHER"] = {
				"%s's %s is absorbed by %s.", -- [1]
				"Yurneroo's Deep Wound is absorbed by Proxor.", -- [2]
			},
			["AURAADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s.", -- [1]
				"Sekaikaze is afflicted by Rend.", -- [2]
			},
			["SPELLPOWERLEECHOTHEROTHER"] = {
				"%s's %s drains %d %s from %s. %s gains %d %s.", -- [1]
				"Regnier's Drain Mana drains 140 Mana from Darigaaz. Regnier gains 140 Mana.", -- [2]
			},
			["PERIODICAURADAMAGEOTHER"] = {
				"%s suffers %d %s damage from %s.", -- [1]
				"Nyctrico suffers 259 Fire damage from Flame Wave.", -- [2]
			},
			["SPELLLOGABSORBSELFOTHER"] = {
				"Your %s is absorbed by %s.", -- [1]
				"Your Corruption is absorbed by Sansetsu.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHARMFUL"] = {
				"%s is afflicted by %s (%d).", -- [1]
				"Loradam is afflicted by Shadow Vulnerability (2).", -- [2]
			},
			["PERIODICAURADAMAGESELFOTHER"] = {
				"%s suffers %d %s damage from your %s.", -- [1]
				"Dreamstriker suffers 158 Shadow damage from your Corruption.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_AURA_GONE_OTHER"] = {
			["AURAREMOVEDOTHER"] = {
				"%s fades from %s.", -- [1]
				"Cheap Shot fades from Alterac Ram.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_HOSTILE_DEATH"] = {
			["SELFKILLOTHER"] = {
				"You have slain %s!", -- [1]
				"You have slain Forest Spider!", -- [2]
			},
			["UNITDIESOTHER"] = {
				"%s dies.", -- [1]
				"Alterac Ram dies.", -- [2]
			},
			["UNITDESTROYEDOTHER"] = {
				"%s is destroyed.", -- [1]
				"Magma Totem IV is destroyed.", -- [2]
			},
			["PARTYKILLOTHER"] = {
				"%s is slain by %s!", -- [1]
				"Chevr is slain by Mos!", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_PARTY_HITS"] = {
			["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
				"%s suffers %d points of fire damage.", -- [1]
				"Nimbus suffers 15 points of fire damage.", -- [2]
			},
			["COMBATHITCRITSCHOOLOTHEROTHER"] = {
				"%s crits %s for %d %s damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [1]
				"Shadowfiend crits Ethereal Scavenger for 232 Shadow damage.[COMBATHITCRITSCHOOLOTHEROTHER]", -- [2]
				"2.0.6", -- [3]
			},
			["SPELLLOGCRITOTHEROTHER"] = {
				"%s's %s crits %s for %d.", -- [1]
				"Chula's Auto Shot crits Treant for 360.", -- [2]
			},
			["COMBATHITCRITOTHEROTHER"] = {
				"%s crits %s for %d.[COMBATHITCRITOTHEROTHER]", -- [1]
				"Sherbs crits Ludachriz for 206.[COMBATHITCRITOTHEROTHER]", -- [2]
			},
			["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
				"%s's %s crits %s for %d %s damage.", -- [1]
				"Kruztique's Shoot crits Earthbind Totem for 135 Arcane damage.", -- [2]
			},
			["SPELLLOGSCHOOLOTHEROTHER"] = {
				"%s's %s hits %s for %d %s damage.", -- [1]
				"Riane's Shoot hits Mana Spring Totem IV for 111 Shadow damage.", -- [2]
			},
			["SPELLLOGOTHEROTHER"] = {
				"%s's %s hits %s for %d.", -- [1]
				"Chula's Auto Shot hits Commander Louis Philips for 219.", -- [2]
			},
			["COMBATHITSCHOOLOTHEROTHER"] = {
				"%s hits %s for %d %s damage.[COMBATHITSCHOOLOTHEROTHER]", -- [1]
				"Unknown hits Bonelasher for 111 Shadow damage.[COMBATHITSCHOOLOTHEROTHER]", -- [2]
				"2.0.6", -- [3]
			},
			["COMBATHITOTHEROTHER"] = {
				"%s hits %s for %d.[COMBATHITOTHEROTHER]", -- [1]
				"Frucheman hits Nauxinc for 441.[COMBATHITOTHEROTHER]", -- [2]
			},
			["COMBATHITCRITOTHERSELF"] = {
				"%s crits you for %d.[COMBATHITCRITOTHERSELF]", -- [1]
				"Treant crits you for 321.[COMBATHITCRITOTHERSELF]", -- [2]
				"2.0.10.6448", -- [3]
			},
			["COMBATHITOTHERSELF"] = {
				"%s hits you for %d.[COMBATHITOTHERSELF]", -- [1]
				"Bonechewer Hungerer hits you for 211.[COMBATHITOTHERSELF] (53 absorbed)", -- [2]
			},
			["VSENVIRONMENTALDAMAGE_LAVA_OTHER"] = {
				"%s loses %d health for swimming in lava.", -- [1]
				"Kal'los loses 1446 health for swimming in lava.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS"] = {
			["PERIODICAURAHEALSELFOTHER"] = {
				"%s gains %d health from your %s.", -- [1]
				"Rokugo gains 250 health from your First Aid.", -- [2]
			},
			["AURAADDEDOTHERHELPFUL"] = {
				"%s gains %s.", -- [1]
				"Haihachi gains Obsidian Insight.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Icebringer's Flee drains 517 Mana from Icebringer.", -- [2]
			},
			["POWERGAINOTHERSELF"] = {
				"You gain %d %s from %s's %s.", -- [1]
				"You gain 10 Mana from Aubrie's Blessing of Wisdom.", -- [2]
			},
			["PERIODICAURAHEALOTHEROTHER"] = {
				"%s gains %d health from %s's %s.", -- [1]
				"Loradam gains 250 health from Loradam's First Aid.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHELPFUL"] = {
				"%s gains %s (%d).", -- [1]
				"Felmas gains Unstable Power (8).", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Chickenlady gains 1 Rage from Chickenlady's Bloodrage.", -- [2]
			},
		},
		["CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS"] = {
			["PERIODICAURAHEALSELFOTHER"] = {
				"%s gains %d health from your %s.", -- [1]
				"Shair gains 100 health from your First Aid.", -- [2]
			},
			["AURAADDEDOTHERHELPFUL"] = {
				"%s gains %s.", -- [1]
				"Gjonnydanger gains Devotion Aura.", -- [2]
			},
			["SPELLPOWERDRAINOTHEROTHER"] = {
				"%s's %s drains %d %s from %s.", -- [1]
				"Styxson's Flee drains 485 Mana from Styxson.", -- [2]
			},
			["POWERGAINOTHERSELF"] = {
				"You gain %d %s from %s's %s.", -- [1]
				"You gain 10 Mana from Aubrie's Blessing of Wisdom.", -- [2]
			},
			["AURAAPPLICATIONADDEDOTHERHELPFUL"] = {
				"%s gains %s (%d).", -- [1]
				"Narwen gains Unstable Power (8).", -- [2]
			},
			["PERIODICAURAHEALOTHEROTHER"] = {
				"%s gains %d health from %s's %s.", -- [1]
				"Minimonty gains 249 health from Aneptios's Renew.", -- [2]
			},
			["POWERGAINOTHEROTHER"] = {
				"%s gains %d %s from %s's %s.", -- [1]
				"Minimonty gains 33 Mana from Minimonty's Blessing of Wisdom.", -- [2]
			},
		},
		["CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES"] = {
			["VSEVADEOTHEROTHER"] = {
				"%s attacks. %s evades.", -- [1]
				"Mistick attacks. Lava Annihilator evades.", -- [2]
			},
			["VSIMMUNEOTHEROTHER"] = {
				"%s attacks but %s is immune.", -- [1]
				"Sekaikaze attacks but Morike is immune.", -- [2]
			},
			["VSABSORBOTHEROTHER"] = {
				"%s attacks. %s absorbs all the damage.", -- [1]
				"Sapito attacks. Yurneroo absorbs all the damage.", -- [2]
			},
			["MISSEDOTHEROTHER"] = {
				"%s misses %s.", -- [1]
				"Jeebes misses Seasoned Guardian.", -- [2]
			},
			["VSDODGEOTHEROTHER"] = {
				"%s attacks. %s dodges.", -- [1]
				"Sekaikaze attacks. Alterac Ram dodges.", -- [2]
			},
			["VSPARRYOTHEROTHER"] = {
				"%s attacks. %s parries.", -- [1]
				"Sekaikaze attacks. Alterac Ram parries.", -- [2]
			},
			["VSBLOCKOTHEROTHER"] = {
				"%s attacks. %s blocks.", -- [1]
				"maide attacks. Thermopolis blocks.", -- [2]
			},
		},
	},
	["tooShort"] = {
		["FOLLOW"] = "Follow",
		["CLOSE"] = "Close",
		["HOURS_ABBR_P1"] = "Hrs",
		["ALL"] = "All",
		["SPELL_TARGET_TYPE8_DESC"] = "pet",
		["LOGOUT"] = "Logout",
		["RAID_LEADER_TOKEN"] = "(L)",
		["LFG_TYPE_ZONE"] = "Zone",
		["SUBMIT"] = "Submit",
		["PETS"] = "Pets",
		["BOSS"] = "Boss",
		["CHAT_MSG_YELL"] = "Yell",
		["LAUGH_WORD7"] = "haha",
		["XPBAR_LABEL"] = "XP Bar",
		["LOOT"] = "Loot",
		["CHAT_COMBAT_CREATURE_VS_CREATURE_MISSES_GET"] = "",
		["CHAT_SPELL_DAMAGESHIELDS_ON_OTHERS_GET"] = "",
		["NONE_CAPS"] = "NONE",
		["LAUGH_WORD6"] = "haha",
		["SPELL_SCHOOLALL"] = "all",
		["YELL_MESSAGE"] = "Yell",
		["MP"] = "MP",
		["CHAT_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE_GET"] = "",
		["SPELL_TARGET_CREATURE_TYPE1_DESC"] = "%s",
		["LAUGH_WORD8"] = "haha",
		["CHAT_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS_GET"] = "",
		["XP"] = "XP",
		["ENERGY"] = "Energy",
		["ERR_NOAMMO_S"] = "%s",
		["CHAT_SPELL_FRIENDLYPLAYER_DAMAGE_GET"] = "",
		["PET_FOLLOW"] = "Follow",
		["DAYS_ABBR"] = "Day",
		["DAMAGE_SCHOOL5"] = "Frost",
		["ATTACK_POWER_COLON"] = "Power:",
		["WHO_TAG_CLASS"] = "c-",
		["HP"] = "HP",
		["FOCUS_POINTS"] = "Focus",
		["SOCIAL_BUTTON"] = "Social",
		["YELLOW_GEM"] = "Yellow",
		["LOCKED"] = "Locked",
		["SPELL_SCHOOL4_CAP"] = "Frost",
		["INT_SPELL_DURATION_SEC"] = "%d sec",
		["HONOR_TODAY"] = "Today",
		["NOT_APPLICABLE"] = "N/A",
		["SPELL_TARGET_TYPE0_DESC"] = "caster",
		["SEND_LABEL"] = "Send",
		["AUCTION_TIME_LEFT1"] = "Short",
		["WHO_TAG_NAME"] = "n-",
		["PET_HAPPINESS3"] = "Happy",
		["NEXT"] = "Next",
		["HOURS_P1"] = "Hours",
		["CAMERA_LOCKED"] = "Locked",
		["TASKS_COLON"] = "Tasks:",
		["META_GEM"] = "Meta",
		["COD"] = "C.O.D.",
		["NEVER"] = "Never",
		["PROC_EVENT1_DESC"] = "on hit",
		["DEMOTE"] = "Demote",
		["DUEL"] = "Duel",
		["CHAT_SPELL_ITEM_ENCHANTMENTS_GET"] = "",
		["GOLD"] = "Gold",
		["WAISTSLOT"] = "Waist",
		["ZONE"] = "Zone",
		["CORPSE"] = "Corpse",
		["HEALTH"] = "Health",
		["HONOR_THIS_SESSION"] = "Today",
		["SECOND_ONELETTER_ABBR"] = "%d s",
		["LAUGH_WORD9"] = "rofl",
		["TEAM"] = "Team",
		["HERTZ"] = "Hz",
		["CHAT_SPELL_AURA_GONE_PARTY_GET"] = "",
		["DAMAGE"] = "Damage",
		["CHAT_COMBAT_FRIENDLYPLAYER_HITS_GET"] = "",
		["FOREIGN_SERVER_LABEL"] = " (*)",
		["WHO_TAG_ZONE"] = "z-",
		["PARTY"] = "Party",
		["STARTUP_TEXT_LINE4"] = "",
		["PASS"] = "Pass",
		["SPELL_SCHOOL1_CAP"] = "Holy",
		["ELITE"] = "Elite",
		["BACKSLOT"] = "Back",
		["English"] = "",
		["CHAT_MSG_SYSTEM"] = "System",
		["WHO_TAG_GUILD"] = "g-",
		["CHAT_SPELL_PARTY_DAMAGE_GET"] = "",
		["LOW"] = "Low",
		["DEATHS"] = "Deaths",
		["FEMALE"] = "Female",
		["AUCTION_CREATOR"] = "Seller",
		["PLAYED"] = "Played",
		["CHAT_SPELL_PET_BUFF_GET"] = "",
		["SPELL_SCHOOL3_CAP"] = "Nature",
		["SECONDS_ABBR_P1"] = "Secs",
		["BUYOUT"] = "Buyout",
		["ERR_SPELL_FAILED_EQUIPPED_ITEM_CLASS_S"] = "%s",
		["MOTD_COLON"] = "MOTD:",
		["PARENS_TEMPLATE"] = "(%s)",
		["HOURS"] = "Hour",
		["PLAYERSTAT_RANGED_COMBAT"] = "Ranged",
		["PET_ACTION_ATTACK"] = "Attack",
		["CASH_ON_DELIVERY"] = "C.O.D.",
		["DAMAGE_SCHOOL3"] = "Fire",
		["CHAT_COMBAT_FRIENDLYPLAYER_MISSES_GET"] = "",
		["LASTONLINE_DAYS"] = "%d day",
		["CHAT_SPELL_HOSTILEPLAYER_DAMAGE_GET"] = "",
		["CHAT_COMBAT_CREATURE_VS_SELF_HITS_GET"] = "",
		["GAMES"] = "Games",
		["DELETE_ITEM_CONFIRM_STRING"] = "DELETE",
		["RESIST"] = "Resist",
		["CHAT_SPELL_PERIODIC_PARTY_BUFFS_GET"] = "",
		["DUNGEON_DIFFICULTY3"] = "Epic",
		["TRAIN"] = "Train",
		["ARENA_RATED"] = "Battle",
		["WIDESCREEN_TAG"] = "(Wide)",
		["RANK_COLON"] = "Rank:",
		["RAID_TARGET_1"] = "Star",
		["HIDE"] = "Hide",
		["MONEY"] = "Money",
		["SOLO"] = "Solo",
		["NOTE_COLON"] = "Note:",
		["WHO"] = "Who",
		["SPELL_TARGET_TYPE1_DESC"] = "any",
		["GAMMA"] = "Gamma",
		["CHAT_MSG_AFK"] = "AFK",
		["CHAT_COMBAT_CREATURE_VS_PARTY_HITS_GET"] = "",
		["MILLISECONDS_ABBR"] = "ms",
		["RACE"] = "Race",
		["ARMOR"] = "Armor",
		["FINGER0SLOT"] = "Finger",
		["LAUGH_WORD2"] = "rofl",
		["HOURS_ABBR"] = "Hr",
		["BACK"] = "Back",
		["UNIT_PVP_NAME"] = "%s %s",
		["DODGE"] = "Dodge",
		["LAUGH_WORD5"] = "haha",
		["TABARDVENDORCOST"] = "Cost:",
		["CAMERA_ALWAYS"] = "Always",
		["RANK"] = "Rank",
		["BROWSE"] = "Browse",
		["FILTER"] = "Filter",
		["NONE"] = "None",
		["YES"] = "Yes",
		["CHAT_SPELL_HOSTILEPLAYER_BUFF_GET"] = "",
		["BUFFER_DOUBLE"] = "Double",
		["CHAT_SPELL_TRADESKILLS_GET"] = "",
		["BIDS"] = "Bids",
		["COLOR"] = "Color",
		["LAUGH_WORD1"] = "lol",
		["INPUT_JAPANESE"] = "JP",
		["MAIL_RETURN"] = "Return",
		["YOU"] = "You",
		["EMBLEM_SYMBOL"] = "Icon",
		["CHAT_MSG_COMBAT_LOG_MISC_INFO"] = "Misc",
		["CHAT_SPELL_DAMAGESHIELDS_ON_SELF_GET"] = "",
		["ENABLE"] = "Enable",
		["MANA"] = "Mana",
		["SPELL_TARGET_TYPE15_DESC"] = "master",
		["MAIL_TO_LABEL"] = "To:",
		["MANA_POINTS"] = "Mana",
		["INPUT_CHINESE"] = "CH",
		["MANA_COLON"] = "Mana:",
		["LEVEL_ABBR"] = "Lvl",
		["DAYS"] = "Day",
		["SPELL_SCHOOL2_CAP"] = "Fire",
		["NEW"] = "New",
		["CHAT_SPELL_CREATURE_VS_CREATURE_DAMAGE_GET"] = "",
		["CHAT_COMBAT_HOSTILE_DEATH_GET"] = "",
		["FOCUS"] = "Focus",
		["HK"] = "HK",
		["BASIC_LABEL"] = "Basic",
		["DAY_ONELETTER_ABBR"] = "%d d",
		["SPELL_TARGET_TYPE3_DESC"] = "enemy",
		["FACTION_STANDING_LABEL1"] = "Hated",
		["CHAT_SPELL_PERIODIC_CREATURE_BUFFS_GET"] = "",
		["MINUTES_ABBR"] = "Min",
		["CHAT_COMBAT_PET_MISSES_GET"] = "",
		["CHAT_SPELL_AURA_GONE_OTHER_GET"] = "",
		["PET"] = "Pet",
		["FRFR"] = "French",
		["FEETSLOT"] = "Feet",
		["DK"] = "DK",
		["PET_ACTION_FOLLOW"] = "Follow",
		["PARRY"] = "Parry",
		["COPPER"] = "Copper",
		["SAVE"] = "Save",
		["CHAT_YELL_SEND"] = "Yell: ",
		["TRADE"] = "Trade",
		["RAID_ASSISTANT_TOKEN"] = "(A)",
		["STARTUP_TEXT_LINE3"] = "",
		["SPELL_SCHOOL2_NAME"] = "fire",
		["STARTUP_TEXT_LINE2"] = "",
		["FROM"] = "From:",
		["HONOR_CONTRIBUTION_POINTS"] = "Honor",
		["IMMUNE"] = "Immune",
		["CHAT_COMBAT_MISC_INFO_GET"] = "",
		["CANCEL"] = "Cancel",
		["NECKSLOT"] = "Neck",
		["DELETE"] = "Delete",
		["PET_RENAME"] = "Rename",
		["CHAT_SPELL_PET_DAMAGE_GET"] = "",
		["CHAT_MSG_GUILD"] = "Guild",
		["DAMAGE_SCHOOL6"] = "Shadow",
		["SPELL_STAT5_NAME"] = "Spirit",
		["INPUT_KOREAN"] = "KO",
		["CHAT_LABEL"] = "Chat",
		["MAIL_REPLY_PREFIX"] = "RE:",
		["WEAPON_SPEED"] = "Speed",
		["SPELL_TARGET_CREATURE_TYPE8_DESC"] = "%s pet",
		["EXIT"] = "Exit",
		["SPEAKERMODE_STEREO"] = "Stereo",
		["CHAT_SPELL_PERIODIC_CREATURE_DAMAGE_GET"] = "",
		["OUTBID"] = "Outbid",
		["PERCENT_SYMBOL"] = "%%",
		["DUNGEON_DIFFICULTY2"] = "Heroic",
		["CAMERA_NEVER"] = "Never",
		["ENERGY_POINTS"] = "Energy",
		["CHAT_COMBAT_CREATURE_VS_PARTY_MISSES_GET"] = "",
		["CHAT_SAY_SEND"] = "Say: ",
		["CHAT_MSG_SKILL"] = "Skill",
		["HONOR"] = "Honor",
		["NEED"] = "Need",
		["PREV"] = "Prev",
		["BAGSLOT"] = "Bag",
		["OKAY"] = "Okay",
		["RAID_TARGET_2"] = "Circle",
		["RAID_TARGET_7"] = "Cross",
		["ZONE_COLON"] = "Zone:",
		["ERROR_CAPS"] = "ERROR",
		["CHAT_SPELL_FRIENDLYPLAYER_BUFF_GET"] = "",
		["RAID_TARGET_5"] = "Moon",
		["SPELLS"] = "Spells",
		["CHAT_COMBAT_CREATURE_VS_CREATURE_HITS_GET"] = "",
		["RAID_MESSAGE"] = "Raid",
		["COSTS_LABEL"] = "Cost:",
		["MINUTES"] = "Minute",
		["SPELL_SCHOOL5_NAME"] = "shadow",
		["LOCK"] = "Lock",
		["CHAT_COMBAT_ERROR_GET"] = "",
		["REPLY_MESSAGE"] = "Reply",
		["AUCTION_TIME_LEFT2"] = "Medium",
		["WHO_TAG_RACE"] = "r-",
		["CHAT_SPELL_PERIODIC_PARTY_DAMAGE_GET"] = "",
		["DEDE"] = "German",
		["INT_SPELL_DURATION_MIN"] = "%d min",
		["CHAT_SPELL_SELF_DAMAGE_GET"] = "",
		["PLAYERSTAT_SPELL_COMBAT"] = "Spell",
		["CHAT_SPELL_PARTY_BUFF_GET"] = "",
		["EMPTY"] = "Empty",
		["PET_ATTACK"] = "Attack",
		["RELICSLOT"] = "Relic",
		["SECONDS_ABBR"] = "Sec",
		["SERVER_MESSAGE_COLON"] = "Alert:",
		["SPELL_TARGET_TYPE7_DESC"] = "object",
		["DAMAGE_SCHOOL4"] = "Nature",
		["CHAT_SPELL_CREATURE_VS_CREATURE_BUFF_GET"] = "",
		["CHAT_MSG_COMBAT_LOG_ERROR"] = "Error",
		["MISS"] = "Miss",
		["SPELL_SCHOOL6_NAME"] = "arcane",
		["ARMOR_COLON"] = "Armor:",
		["HOUR_ONELETTER_ABBR"] = "%d h",
		["CHESTSLOT"] = "Chest",
		["SECONDS"] = "Second",
		["USE"] = "Use",
		["CLASS"] = "Class",
		["SKILL"] = "Skill",
		["CAMERA_LABEL"] = "Camera",
		["SKILLS"] = "Skills",
		["CHAT_SPELL_CREATURE_VS_SELF_BUFF_GET"] = "",
		["UNITNAME_TITLE"] = "%s",
		["DAMAGE_SCHOOL2"] = "Holy",
		["LEVEL"] = "Level",
		["INPUT_ROMAN"] = "A",
		["DUNGEON_DIFFICULTY1"] = "Normal",
		["RATING"] = "Rating",
		["HIGH"] = "High",
		["SEARCH"] = "Search",
		["CHAT_SPELL_SELF_BUFF_GET"] = "",
		["ACCEPT"] = "Accept",
		["SPELL_SCHOOL4_NAME"] = "frost",
		["CHAT_COMBAT_LOG_ERROR_GET"] = "",
		["MERCHANT_STOCK"] = "(%d)",
		["EVADE"] = "Evade",
		["PLAYERSTAT_MELEE_COMBAT"] = "Melee",
		["ADDON_BANNED"] = "Banned",
		["AUCTION_TIME_LEFT3"] = "Long",
		["CHAT_SPELL_AURA_GONE_SELF_GET"] = "",
		["ALLIED"] = "Allied",
		["RAID"] = "Raid",
		["KILLS"] = "Kills",
		["GROUP"] = "Group",
		["LFG_TYPE_NONE"] = "None",
		["QUIT"] = "Quit",
		["CHAT_SPELL_CREATURE_VS_PARTY_BUFF_GET"] = "",
		["CHAT_COMBAT_SELF_MISSES_GET"] = "",
		["SILVER"] = "Silver",
		["NAME"] = "Name",
		["INT_SPELL_DURATION_HOURS_P1"] = "%d hrs",
		["BUYOUT_COST"] = "Buyout",
		["SPEED"] = "Speed",
		["FLAG_COUNT_TEMPLATE"] = "x %d",
		["AT_WAR"] = "At War",
		["FACTION_STANDING_LABEL1_FEMALE"] = "Hated",
		["CHAT_MSG_SAY"] = "Say",
		["RAGE_POINTS"] = "Rage",
		["TRADE_SKILL_TITLE"] = "%s",
		["SPELL_TARGET_TYPE12_DESC"] = "all",
		["RARITY"] = "Rarity",
		["QUEST_HARD"] = "(Hard)",
		["CHAT_SPELL_CREATURE_VS_PARTY_DAMAGE_GET"] = "",
		["CHAT_COMBAT_PARTY_HITS_GET"] = "",
		["CHAT_COMBAT_HOSTILEPLAYER_HITS_GET"] = "",
		["DONE"] = "Done",
		["CHAT_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS_GET"] = "",
		["VICTORY_TEXT_ARENA_DRAW"] = "Draw",
		["LAUGH_WORD3"] = "hehe",
		["WRISTSLOT"] = "Wrist",
		["CHAT_COMBAT_LOG_MISC_INFO_GET"] = "",
		["FONT_SIZE_TEMPLATE"] = "%d pt",
		["PET_ACTION_WAIT"] = "Stay",
		["BLOCK"] = "Block",
		["RAGE"] = "Rage",
		["SPELL_SCHOOL3_NAME"] = "nature",
		["SPELL_SCHOOL6_CAP"] = "Arcane",
		["MINUTE_ONELETTER_ABBR"] = "%d m",
		["ERR_SPELL_FAILED_S"] = "%s",
		["MINUTES_ABBR_P1"] = "Mins",
		["CHAT_MSG_DND"] = "DND",
		["SPELL_TARGET_TYPE11_DESC"] = "party",
		["SHIRTSLOT"] = "Shirt",
		["TICKET_TYPE4"] = "Bug",
		["CHAT_MSG_PARTY"] = "Party",
		["IGNORE"] = "Ignore",
		["STUN"] = "Stun",
		["PET_WAIT"] = "Stay",
		["DAYS_P1"] = "Days",
		["BID"] = "Bid",
		["FRAMERATE_LABEL"] = "FPS:",
		["ID"] = "ID",
		["SAY"] = "Say",
		["KOKR"] = "Korean",
		["TARGET"] = "Target",
		["CHAT_SPELL_PERIODIC_SELF_BUFFS_GET"] = "",
		["PET_TYPE_DEMON"] = "Demon",
		["MACROS"] = "Macros",
		["FAILED"] = "Failed",
		["TICKET_TYPE3"] = "Stuck",
		["LFG_TYPE_RAID"] = "Raid",
		["MAIL_LABEL"] = "Mail",
		["SPELL_TARGET_CREATURE_TYPE12_DESC"] = "all %s",
		["DAYS_ABBR_P1"] = "Days",
		["GROUPS"] = "Groups",
		["BREATH_LABEL"] = "Breath",
		["ABSORB"] = "Absorb",
		["ERR_SPELL_FAILED_TOTEMS"] = "%s",
		["CHAT_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE_GET"] = "",
		["RAID_TARGET_8"] = "Skull",
		["NONE_KEY"] = "None",
		["DAMAGE_SCHOOL7"] = "Arcane",
		["TYPE"] = "Type",
		["MACRO"] = "Macro",
		["FINGER1SLOT"] = "Finger",
		["EMBLEM_BORDER"] = "Border",
		["HOME"] = "Home",
		["SPELL_SCHOOL1_NAME"] = "holy",
		["ERR_SPELL_FAILED_SHAPESHIFT_FORM_S"] = "%s",
		["RAID_TARGET_6"] = "Square",
		["CHAT_COMBAT_SELF_HITS_GET"] = "",
		["CREATE"] = "Create",
		["TRAINER_LIST_SP"] = "%d SP",
		["ITEMS"] = "Items",
		["PARTY_INVITE"] = "Invite",
		["SAY_MESSAGE"] = "Say",
		["STUN_CAPS"] = "STUN",
		["CHAT_SPELL_BREAK_AURA_GET"] = "",
		["SPELL_TARGET_TYPE_DEAD1_DESC"] = "dead",
		["RED_GEM"] = "Red",
		["CHAT_SPELL_PERIODIC_SELF_DAMAGE_GET"] = "",
		["SHIELDSLOT"] = "Shield",
		["REMOVE"] = "Remove",
		["ENCHANT_CONDITION_AND"] = " and ",
		["CHAT_MSG_EMOTE"] = "Emote",
		["INT_GENERAL_DURATION_DAYS"] = "%d day",
		["ENCHSLOT_WEAPON"] = "Weapon",
		["BLUE_GEM"] = "Blue",
		["CHAT_COMBAT_PARTY_MISSES_GET"] = "",
		["CHAT_COMBAT_PET_HITS_GET"] = "",
		["ERR_TAME_FAILED"] = "%s.",
		["SPELL_TARGET_TYPE5_DESC"] = "item",
		["GREED"] = "Greed",
		["RANGEDSLOT"] = "Ranged",
		["CHAT_GUILD_DEMOTE_SEND"] = "Demote",
		["PLAYER"] = "Player",
		["TRAINER_LIST_TP"] = "%d TP",
		["CHAT_COMBAT_HOSTILEPLAYER_MISSES_GET"] = "",
		["STATS_LABEL"] = "Stats:",
		["LABEL_NOTE"] = "Note",
		["SPELL_SCHOOL5_CAP"] = "Shadow",
		["CHAT_COMBAT_FRIENDLY_DEATH_GET"] = "",
		["RESET"] = "Reset",
		["CHAT_RAID_BOSS_EMOTE_GET"] = "",
		["LEGSSLOT"] = "Legs",
		["INBOX"] = "Inbox",
		["DEAD"] = "Dead",
		["SPELL_TARGET_CENTER_CASTER"] = "caster",
		["HANDSSLOT"] = "Hands",
		["CHAT_COMBAT_CREATURE_VS_SELF_MISSES_GET"] = "",
		["ALWAYS"] = "Always",
		["ERR_SPELL_FAILED_REAGENTS"] = "%s",
		["CHAT_MSG_RAID"] = "Raid",
		["CAMERA_SMART"] = "Smart",
		["LAUGH_WORD4"] = "haha",
		["JOIN"] = "Join",
		["NO"] = "No",
		["TABARDSLOT"] = "Tabard",
		["AMMOSLOT"] = "Ammo",
		["MALE"] = "Male",
		["CHAT_SPELL_CREATURE_VS_SELF_DAMAGE_GET"] = "",
		["PET_TYPE_PET"] = "Pet",
		["CHAT_RAID_SEND"] = "Raid: ",
		["HEADSLOT"] = "Head",
		["ATTACK"] = "Attack",
	},
	["trailers"] = {
		["COMBATHITCRITSCHOOLOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Firelord crits Cleatus for 1594 Fire damage. (295 resisted)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Firelord crits Dragonx for 1143 Fire damage. (322 resisted) (593 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["COMBATHITCRITSELFOTHER"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You crit Elfenlied for 104. (26 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGSCHOOLSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Warp Storm hits you for 109 Arcane damage.[SPELLLOGSCHOOLSELF] (136 resisted) (27 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Frostbite hits you for 1782 Frost damage.[SPELLLOGSCHOOLSELF] (445 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["COMBATHITSCHOOLOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Searing Elemental hits you for 118 Fire damage.[COMBATHITSCHOOLOTHERSELF] (49 resisted) (30 absorbed)", -- [2]
				2, -- [3]
			},
			["CRUSHING_TRAILER"] = {
				" (crushing)", -- [1]
				"Sea Elemental hits you for 158 Frost damage. (crushing)", -- [2]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Hydrospawn hits you for 126 Frost damage. (163 resisted) (365 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGCRITSCHOOLOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Sabarr's Arcane Explosion crits Denerce for 73 Arcane damage. (207 resisted) (31 absorbed)", -- [2]
				2, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Kaysta's Arcane Shot crits Flamewaker Elite for 616 Arcane damage. (+47 vulnerability bonus)", -- [2]
				1, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Kaysta's Arcane Shot crits Lava Annihilator for 118 Arcane damage. (92 resisted) (45 blocked)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Kracc's Fire Blast crits Zacharias for 422 Fire damage. (351 resisted) (106 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["COMBATHITSCHOOLOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Greater Fire Elemental hits Boldman for 123 Fire damage.[COMBATHITSCHOOLOTHEROTHER] (51 resisted) (31 absorbed)", -- [2]
				2, -- [3]
			},
			["CRUSHING_TRAILER"] = {
				" (crushing)", -- [1]
				"Son of Flame hits Maevistia for 1049 Fire damage. (crushing) (699 resisted)", -- [2]
				2, -- [3]
			},
			["GLANCING_TRAILER"] = {
				" (glancing)", -- [1]
				"Shadowfiend hits Coilfang Engineer for 128 Shadow damage.[COMBATHITSCHOOLOTHEROTHER] (glancing)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Son of Flame hits Maevistia for 1503 Fire damage. (crushing) (389 resisted) (249 absorbed)", -- [2]
				3, -- [3]
			},
		},
		["COMBATHITOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Mils hits you for 15. (6 resisted) (4 absorbed)", -- [2]
				1, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Nightmare Whelp hits you for 33. (39 blocked)", -- [2]
				1, -- [3]
			},
			["CRUSHING_TRAILER"] = {
				" (crushing)", -- [1]
				"Lava Reaver hits you for 2386. (crushing)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Mils hits you for 15. (6 resisted) (4 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["PERIODICAURADAMAGESELFSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"You suffer 181 Shadow damage from your Corruption. (75 resisted) (45 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You suffer 116 Shadow damage from your Curse of Agony. (48 resisted) (29 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["PERIODICAURADAMAGEOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Denerce suffers 24 Fire damage from Nakanu's Flame Shock. (33 resisted) (10 absorbed)", -- [2]
				2, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Firelord suffers 225 Frost damage from Afterthefall's Blizzard. (+41 vulnerability bonus)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Wildspawn Felsworn suffers 23 Shadow damage from Kruztique's Shadow Word: Pain. (111 resisted) (15 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["COMBATHITCRITOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Mornordus crits Molten Giant for 282. (1 resisted)", -- [2]
				1, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Mornordus crits Firelord for 333. (+1 vulnerability bonus)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Eiladilia crits Everetteri for 242. (104 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGCRITSELFOTHER"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Overpower crits Threllhouse for 233. (353 absorbed)", -- [2]
				1, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Your Hemorrhage crits Wrekt Slave for 241. (45 blocked) (240 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGOTHERSELF"] = {
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Nightmare Wanderer's Strike hits you for 164. (40 blocked)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Discordant Surge's Mighty Blow hits you for 106. (45 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGSCHOOLSELFSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Your Curse of Burning Shadows hits you for 122 Shadow damage. (152 resisted) (30 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Shadow Bolt hits you for 214 Shadow damage. (802 resisted) (54 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["VSENVIRONMENTALDAMAGE_FIRE_SELF"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You suffer 11 points of fire damage. (4 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["VSENVIRONMENTALDAMAGE_LAVA_OTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Kerinne loses 151 health for swimming in lava. (452 resisted)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Cewek loses 388 health for swimming in lava. (151 resisted) (64 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["COMBATHITOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Mornordus hits Lava Reaver for 70. (glancing) (2 resisted)", -- [2]
				2, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Warmaul Champion hits Iamvj for 791.[COMBATHITOTHEROTHER] (233 blocked) (336 absorbed)", -- [2]
				2, -- [3]
			},
			["CRUSHING_TRAILER"] = {
				" (crushing)", -- [1]
				"Expedition Warden hits Icebanana for 312.[COMBATHITOTHEROTHER] (crushing) (570 absorbed)", -- [2]
				2, -- [3]
			},
			["GLANCING_TRAILER"] = {
				" (glancing)", -- [1]
				"Rannie hits Wrekt Slave for 42.[COMBATHITOTHEROTHER] (glancing) (42 absorbed)", -- [2]
				2, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Mornordus hits Lava Spawn for 115. (glancing) (+1 vulnerability bonus)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Molten Giant hits Lionkingz for 208. (51 blocked) (406 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGCRITSCHOOLOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Azif's Arcane Shot crits you for 870 Arcane damage. (156 resisted) (217 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Lemper's Fire Blast crits you for 537 Fire damage. (170 resisted) (230 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGSELFOTHER"] = {
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Your Whirlwind hits Ironfur Patriarch for 103. (31 blocked)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Hemorrhage hits Pembokat for 118. (61 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGCRITOTHEROTHER"] = {
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Traya 's Multi-Shot crits Infinite Slayer for 821. (49 blocked) (465 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Sllypher's Auto Shot crits Drpepperz for 141. (426 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGCRITOTHERSELF"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Rokugo's Hamstring crits you for 71. (31 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGSCHOOLOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Razaani Nexus Stalker's Arcane Explosion hits you for 278 Arcane damage. (115 resisted) (69 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Flameguard's Fire Shield hits you for 87 Fire damage. (125 resisted) (38 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["PERIODICAURADAMAGESELFOTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Magosko suffers 47 Shadow damage from your Curse of Agony. (59 resisted) (12 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Regnier suffers 59 Shadow damage from your Corruption. (84 resisted) (26 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["COMBATHITSELFOTHER"] = {
			["GLANCING_TRAILER"] = {
				" (glancing)", -- [1]
				"You hit Stonescythe Whelp for 144. (glancing) (52 absorbed)", -- [2]
				2, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"You hit Arith for 39. (60 blocked)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You hit Threllhouse for 214. (95 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGCRITSCHOOLSELFSELF"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Immolate crits you for 824 Fire damage. (206 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["COMBATHITCRITOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Mils crits you for 34. (7 resisted) (8 absorbed)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Mils crits you for 34. (7 resisted) (8 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["PERIODICAURADAMAGESELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"You suffer 54 Nature damage from Toxic Fumes. (23 resisted) (14 absorbed)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You suffer 54 Nature damage from Toxic Fumes. (23 resisted) (14 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGSCHOOLOTHEROTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Blackhand Dreadweaver's Shadow Bolt hits Olire for 276 Shadow damage. (131 resisted) (116 absorbed)", -- [2]
				2, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Lionkingz's Zulian Slice hits Flamewaker Elite for 71 Nature damage. (+38 vulnerability bonus) (44 blocked)", -- [2]
				2, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Wolfwalker's Arcane Shot hits Tower Point Warmaster for 264 Arcane damage. (94 resisted) (43 blocked)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Flamewaker Priest's Dark Strike hits Librabear for 347 Shadow damage. (405 resisted) (50 blocked) (702 absorbed)", -- [2]
				3, -- [3]
			},
		},
		["PERIODICAURADAMAGEOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"You suffer 57 Fire damage from Firewing Warlock's Immolate. (23 resisted) (14 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You suffer 22 Nature damage from Rock Stalker's Poison. (10 resisted) (9 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGOTHEROTHER"] = {
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Mutate Fleshlasher's Vicious Bite hits Beas for 931. (188 blocked) (138 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"High Priestess Jeklik's Swoop hits Woft for 490. (49 blocked) (342 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGCRITSCHOOLSELFOTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Your Shadow Bolt crits Molten Destroyer for 931 Shadow damage. (188 resisted)", -- [2]
				1, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Your Shadow Bolt crits Flamewaker Elite for 1508 Shadow damage. (+183 vulnerability bonus)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Shadow Bolt crits Maxermus for 419 Shadow damage. (399 resisted) (180 absorbed)", -- [2]
				2, -- [3]
			},
			["BLOCK_TRAILER"] = {
				" (%d blocked)", -- [1]
				"Your Envenom crits Bogstrok for 1725 Nature damage. (45 blocked)", -- [2]
				1, -- [3]
			},
		},
		["COMBATHITCRITSCHOOLOTHERSELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Raging Fire-Soul crits you for 445 Fire damage.[COMBATHITCRITSCHOOLOTHERSELF] (93 resisted) (111 absorbed)", -- [2]
				2, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Azure Templar crits you for 162 Frost damage. (116 resisted) (70 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["PERIODICAURADAMAGEOTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Dreamcatcher suffers 128 Fire damage from Flame Wave. (127 resisted)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Kruztique suffers 81 Fire damage from Flame Wave. (138 resisted) (57 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["SPELLLOGSCHOOLOTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Spore Explosion hits Iamvj for 617 Nature damage.[SPELLLOGSCHOOLOTHER] (685 resisted)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Flame Wave hits Kruztique for 58 Fire damage.[SPELLLOGSCHOOLOTHER] (196 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["VSENVIRONMENTALDAMAGE_LAVA_SELF"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"You lose 316 health for swimming in lava. (151 resisted) (136 absorbed)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"You lose 316 health for swimming in lava. (151 resisted) (136 absorbed)", -- [2]
				2, -- [3]
			},
		},
		["VSENVIRONMENTALDAMAGE_FIRE_OTHER"] = {
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Ilyena suffers 721 points of fire damage. (31 absorbed)", -- [2]
				1, -- [3]
			},
		},
		["SPELLLOGSCHOOLSELFOTHER"] = {
			["RESIST_TRAILER"] = {
				" (%d resisted)", -- [1]
				"Your Immolate hits Rage Talon Dragonspawn for 255 Fire damage. (85 resisted)", -- [2]
				1, -- [3]
			},
			["VULNERABLE_TRAILER"] = {
				" (+%d vulnerability bonus)", -- [1]
				"Your Shadow Bolt hits Flamewaker Elite for 1020 Shadow damage. (+186 vulnerability bonus)", -- [2]
				1, -- [3]
			},
			["ABSORB_TRAILER"] = {
				" (%d absorbed)", -- [1]
				"Your Shadow Bolt hits Wildspawn Felsworn for 109 Shadow damage. (182 resisted) (493 absorbed)", -- [2]
				2, -- [3]
			},
		},
	},
	["logTrailer"] = true,
	["ambiguous"] = {
		"SPELLLOGSELF", -- [1]
		"COMBATHITOTHERSELF", -- [2]
		"COMBATHITOTHEROTHER", -- [3]
		"SPELLPERFORMGOOTHERTARGETTED", -- [4]
		"OPEN_LOCK_OTHER", -- [5]
		"SPELLLOGCRITOTHER", -- [6]
		"COMBATHITCRITOTHEROTHER", -- [7]
		"SPELLCASTGOOTHER", -- [8]
		"SIMPLEPERFORMOTHEROTHER", -- [9]
		"SPELLTERSE_OTHER", -- [10]
		"SPELLTERSE_SELF", -- [11]
		"POWERGAINSELF", -- [12]
		"POWERGAINSELFOTHER", -- [13]
		"POWERGAINSELFSELF", -- [14]
		"SIMPLECASTOTHEROTHER", -- [15]
		"HEALEDOTHERSELF", -- [16]
		"SPELLPERFORMGOOTHER", -- [17]
		"SPELLLOGCRITSELF", -- [18]
		"SPELLTERSEPERFORM_OTHER", -- [19]
		"COMBATHITCRITOTHERSELF", -- [20]
		"PERIODICAURAHEALSELF", -- [21]
		"PERIODICAURAHEALSELFSELF", -- [22]
		"JOINED_PARTY", -- [23]
		"ERR_JOINED_GROUP_S", -- [24]
		"ERR_LEFT_GROUP_S", -- [25]
		"SPELLCASTGOSELFTARGETTED", -- [26]
		"ERR_IGNORE_NOT_FOUND", -- [27]
		"SIMPLECASTSELFOTHER", -- [28]
		"SKILL_RANK_UP", -- [29]
		"OPEN_LOCK_SELF", -- [30]
		"SPELLPERFORMGOSELFTARGETTED", -- [31]
		"ERR_SKILL_UP_SI", -- [32]
		"SPELLPERFORMGOSELF", -- [33]
		"SIMPLEPERFORMSELFOTHER", -- [34]
		"SPELLTERSEPERFORM_SELF", -- [35]
		"SIMPLEPERFORMSELFSELF", -- [36]
		"SPELLCASTGOOTHERTARGETTED", -- [37]
		"SPELLLOGOTHER", -- [38]
		"HEALEDSELF", -- [39]
		"LEFT_PARTY", -- [40]
		"SPELLCASTGOSELF", -- [41]
		"SIMPLECASTSELFSELF", -- [42]
		"POWERGAINOTHER", -- [43]
		"COMBATLOG_XPGAIN_EXHAUSTION1", -- [44]
		"COMBATHITSCHOOLOTHEROTHER", -- [45]
		"SPELLLOGSCHOOLOTHER", -- [46]
		"COMBATHITSCHOOLOTHERSELF", -- [47]
		"SPELLLOGSCHOOLSELF", -- [48]
		"COMBATLOG_XPGAIN_EXHAUSTION1_GROUP", -- [49]
		"SPELLLOGCRITSCHOOLOTHER", -- [50]
		"COMBATHITCRITSCHOOLOTHEROTHER", -- [51]
		"SPELLLOGCRITSCHOOLSELF", -- [52]
		"COMBATHITCRITSCHOOLOTHERSELF", -- [53]
		"ERR_FRIEND_NOT_FOUND", -- [54]
		"YOU_LOOT_MONEY", -- [55]
	},
	["ignored"] = {
		["VOICEMACRO_20_Sc_6_FEMALE"] = "Ah, doornails.",
		["TUTORIAL_TITLE7"] = "Looting",
		["VOICEMACRO_8_Dw_1"] = "Tend me wounds!",
		["VOICEMACRO_3_Or_1"] = "Run!",
		["GMSURVEY_TITLE"] = "Game Master (GM) Customer Service Survey",
		["EMOTE55_CMD1"] = "/happy",
		["VOICEMACRO_19_Gn_3"] = "Hey, nice apparatus.",
		["VOICEMACRO_14_Or_0"] = "D'abu.",
		["SPELL_CAST_TIME_SEC"] = "%.3g sec cast",
		["MELEE_CRIT_CHANCE"] = "Crit Chance",
		["SLASH_YELL3"] = "/sh",
		["VOICEMACRO_7_Ni_0"] = "Remain here.",
		["VOICEMACRO_8_Ni_1_FEMALE"] = "I need healing!",
		["OPTION_TOOLTIP_ANISOTROPIC"] = "Increases texture sharpness, particularly for textures in the distance.  Decrease to improve performance.",
		["BINDING_NAME_CAMERAZOOMIN"] = "Zoom In",
		["VOICEMACRO_17_Tr_2"] = "You scratch my back, I scratch yours.",
		["CONFIRM_XP_LOSS_AGAIN"] = "Remember, if you find your corpse there is no penalty.  Are you sure you want to incur %s of Resurrection Sickness and have all your items take 25%% durability damage?",
		["PVP_RANK_16_1_FEMALE"] = "Marshal",
		["VOICEMACRO_16_Hu_1_FEMALE"] = "How generous.",
		["COMBAT_TEXT_HONOR_GAINED"] = "Honor %s",
		["SLASH_MACRO4"] = "/macro",
		["ITEM_CLASSES_ALLOWED"] = "Classes: %s",
		["SLASH_STOPMACRO2"] = "/stopmacro",
		["EMOTE60_CMD2"] = "/kneel",
		["VOICEMACRO_0_Ta_2"] = "Aid me!",
		["EMOTE82_CMD4"] = "/rear",
		["VOICEMACRO_12_Ta_2_FEMALE"] = "How are you?",
		["BINDING_NAME_NEXTVIEW"] = "Next View",
		["HELPFRAME_QUEST_BULLET_TITLE2"] = "The following are NOT considered Quest/Quest NPC issues:",
		["VOICEMACRO_3_Gn_1_FEMALE"] = "Let's get outta here!",
		["VOICEMACRO_10_Or_2_FEMALE"] = "Shoot!",
		["EMOTE100_CMD1"] = "/tired",
		["ITEM_ENCHANT_TIME_LEFT_DAYS_P1"] = "%s (%d days)",
		["CHAT_MONSTER_EMOTE_GET"] = "",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_MANA"] = "Shows all instant gains of mana, rage, and energy.",
		["VOICEMACRO_20_Ni_3_FEMALE"] = "I think that guys just use the Emerald Dream as an excuse to avoid calling me back.",
		["NEWBIE_TOOLTIP_MANABAR0"] = "The amount of mana you currently have. Players require mana in order to cast spells. Mana automatically regenerates if you have not cast a spell in the past five seconds.",
		["OPTION_TOOLTIP_WATER_COLLISION"] = "Set the camera to be above water when your character is above water, and below water when your character is below water.",
		["TUTORIAL_TITLE5"] = "Combat Mode",
		["ITEM_MOD_CRIT_SPELL_RATING"] = "Improves spell critical strike rating by %d.",
		["BINDING_NAME_ACTIONPAGE1"] = "Action Page 1",
		["TUTORIAL41"] = "You have accepted an elite quest. Such quests are best undertaken in a group, for they will take you into areas inhabited by elite creatures. These creatures are significantly tougher than normal monsters; however, they are worth more experience. You can tell an elite creature by the golden dragon border around its portrait.",
		["BUG_SUBMIT_FAILED"] = "Bug submission failed",
		["VOICEMACRO_20_Hu_2_FEMALE"] = "Sometimes, I have trouble CONTROLLING THE VOLUME OF MY VOICE!",
		["VOICEMACRO_4_Sc_1_FEMALE"] = "Help me attack!",
		["EMOTE44_CMD3"] = "/gasp",
		["BINDING_NAME_TOGGLEABILITYBOOK"] = "Toggle Abilities",
		["VOICEMACRO_10_Dw_0"] = "Open fire!",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON6"] = "Right Action Button 6",
		["ITEM_SPELL_KNOWN"] = "Already known",
		["EMOTE138_CMD1"] = "/tease",
		["SLASH_TEAM_DEMOTE1"] = "/teamdemote",
		["SLASH_YELL2"] = "/yell",
		["SLASH_STOPATTACK1"] = "/stopattack",
		["VOICEMACRO_6_Sc_0"] = "This way.",
		["EMOTE130_CMD2"] = "/pest",
		["SLASH_HELP3"] = "/?",
		["TUTORIAL_TITLE35"] = "Travel",
		["EMOTE37_CMD1"] = "/drool",
		["SLASH_DISMOUNT2"] = "/dismount",
		["VOICEMACRO_5_Dw_0_FEMALE"] = "I've got no mana!",
		["TUTORIAL12"] = "You can drink to regain your mana faster.  Click on the drink icon in the action bar across the bottom left of your screen.  The mana regeneration will stop if you do any other ability or get in combat.",
		["VOICEMACRO_LABEL_FOLLOW1"] = "followme",
		["NEWBIE_TOOLTIP_QUESTLOG"] = "A list of all the active quests you currently have. You can have up to 25 active quests at one time.",
		["ADDMEMBER"] = "Add Member",
		["GUILD_HELP_TEXT_LINE2"] = "'/ginfo' gives some basic information about your guild",
		["GUILD_OFFICERNOTES_LABEL"] = "Officer's Notes",
		["EMOTE3_CMD1"] = "/angry",
		["VOICEMACRO_18_Dw_0_FEMALE"] = "Congratulations.",
		["SLASH_PET_FOLLOW2"] = "/petfollow",
		["NEWBIE_TOOLTIP_DEMOTE"] = "Demotes the selected player one rank lower.",
		["BINDING_NAME_RAIDTARGET4"] = "Assign Triangle to Target",
		["ERR_ABILITY_COOLDOWN"] = "Ability is not ready yet.",
		["VOICEMACRO_2_Tr_0"] = "For Zul'jin!",
		["TUTORIAL28"] = "Swimming is much like walking, except you can steer upwards and downwards by holding down the right mouse button and looking in the direction you want to go.",
		["PVP_RANK_6_1_FEMALE"] = "Corporal",
		["VOICEMACRO_1_Ta_1"] = "On your guard!",
		["EMOTE152_CMD1"] = "/love",
		["SLASH_FOLLOW3"] = "/fol",
		["VOICEMACRO_7_Gn_0_FEMALE"] = "Stay here for a moment.",
		["ITEM_TEXT_FROM"] = "From,",
		["SLASH_TEAM_CAPTAIN4"] = "/tcaptain",
		["VOICEMACRO_0_Dw_0_FEMALE"] = "Help me!",
		["COMBAT_TEXT_FLOAT_MODE_LABEL"] = "Combat Text Float Mode",
		["EMOTE96_CMD3"] = "/talkq",
		["EMOTE149_CMD1"] = "/pity",
		["BINDING_NAME_TARGETPARTYMEMBER1"] = "Target Party Member 1",
		["EMOTE99_CMD2"] = "/doom",
		["VOICEMACRO_14_Ta_2_FEMALE"] = "Of course.",
		["VOICEMACRO_3_Tr_0_FEMALE"] = "Run for the hills!",
		["VOICEMACRO_7_Dw_0"] = "Wait here.",
		["OPTION_TOOLTIP_AUTO_SELF_CAST_CTRL_KEY"] = "Use the \"CTRL\" key to cast friendly target spells on yourself even if an enemy is targeted, or there is no target.",
		["RESISTANCE_FAIR"] = "Fair",
		["TUTORIAL22"] = "If there is another player you have enjoyed working with, add them to your friends list!   Click on the social button and add them to your list of friends.",
		["EMOTE99_CMD4"] = "/wrath",
		["ERR_COMMAND_NEEDS_TARGET"] = "You must specify a target: /<command> <target's name>",
		["SLASH_TIME1"] = "/time",
		["VOICEMACRO_2_Ta_2"] = "Charge!",
		["VOICEMACRO_4_Sc_1"] = "Help me attack!",
		["SPELL_FAILED_ALREADY_BEING_TAMED"] = "That creature is already being tamed",
		["KEY_MOUSEWHEELUP"] = "Mouse Wheel Up",
		["EMOTE69_CMD2"] = "/pick",
		["CONFIRM_BINDER"] = "Do you want to make %s your new home?",
		["RESISTANCE_EXCELLENT"] = "Excellent",
		["SLASH_RANDOM7"] = "/roll",
		["EMOTE63_CMD2"] = "/massage",
		["VOICEMACRO_19_Gn_1_FEMALE"] = "At this time I think you should purchase me an alcoholic beverage and engage in diminutive conversation with me in hopes of establishing a rapport.",
		["ITEM_ENCHANT_TIME_LEFT_MIN"] = "%s (%d min)",
		["SLASH_REMOVEFRIEND4"] = "/remfriend",
		["BINDING_NAME_NEXTACTIONPAGE"] = "Next Action Bar",
		["OPTION_TOOLTIP_SHOW_MULTIBAR3"] = "Toggles an optional actionbar on the right side of the screen.",
		["BINDING_NAME_TARGETNEARESTENEMY"] = "Target Nearest Enemy",
		["VOICEMACRO_19_Ta_4_FEMALE"] = "Wanna see some good clog dancing?",
		["SLASH_GUILD_ROSTER3"] = "/groster",
		["VOICEMACRO_LABEL_HEALME2"] = "healme",
		["OPTION_TOOLTIP_TARGETOFTARGET_PARTY"] = "Sets Target of Target to display when you are in a party.",
		["VOICEMACRO_3_Hu_1"] = "Retreat!",
		["EMOTE99_CMD1"] = "/threaten",
		["RESISTANCE1_NAME"] = "Holy Resistance",
		["SPELL_FAILED_UNKNOWN"] = "Unknown reason",
		["VOICEMACRO_4_Or_1_FEMALE"] = "Shed blood with me!",
		["SLASH_COMBATLOG1"] = "/combatlog",
		["EMOTE8_CMD1"] = "/beg",
		["GUILD_OFFICER_NOTE"] = "Guild Officer Note",
		["PVP_RANK_5_1_FEMALE"] = "Private",
		["OPTION_TOOLTIP_TARGETOFTARGET2"] = "Sets Target of Target to display when you are in a party.",
		["BINDING_NAME_FOLLOWTARGET"] = "Follow Target",
		["VOICEMACRO_12_Ni_0_FEMALE"] = "Hello.",
		["HELPFRAME_NONQUEST_BULLET1"] = "Creeps permanently evading",
		["VOICEMACRO_19_Gn_4_FEMALE"] = "I don't feel that the 1 to 10 scale is fine enough to capture subtle details of compatibility.  I'd prefer a 12 dimensional compatibility scale with additional parameters for mechanical aptitude and torque.",
		["EMOTE101_CMD"] = "/victory",
		["VOICEMACRO_17_Hu_1"] = "Nothing you wouldn't have done for me.",
		["EMOTE4_CMD3"] = "/apologize",
		["VOICEMACRO_4_Or_1"] = "Attack with me!",
		["VOICEMACRO_18_Sc_3_FEMALE"] = "Today certainly is your day.",
		["EMOTE43_CMD5"] = "/disappointed",
		["SLASH_SAY4"] = "/say",
		["SLASH_TARGET_NEAREST_PARTY1"] = "/targetparty",
		["EMOTE58_CMD5"] = "/pizza",
		["VOICEMACRO_18_Dw_3"] = "Well done.",
		["EMOTE65_CMD2"] = "/moon",
		["HELPFRAME_SUGGESTION_BUTTON_DESCRIPTION"] = "All general suggestions and feedback about the game",
		["VOICEMACRO_3_Gn_0_FEMALE"] = "Run!",
		["OPTION_TOOLTIP_ENABLE_EMOTE_SOUNDS"] = "Toggles emote sounds on and off.",
		["VOICEMACRO_14_Gn_1"] = "Affirmative.",
		["VOICEMACRO_16_Ni_0_FEMALE"] = "Thank you.",
		["VOICEMACRO_19_Sc_5"] = "Don't mind the drool.  It's just embalming fluid.",
		["TRAINER_REQ_ABILITY"] = "|cffffffff%s|r",
		["OPTION_TOOLTIP_CAMERA3"] = "Set the camera to stay where set, and never auto adjust.",
		["VOICEMACRO_14_Gn_0_FEMALE"] = "Certainly.",
		["PVP_OPTIONS"] = "Player vs. Player",
		["HELPFRAME_ACCOUNT_BULLET1"] = "Help setting up new accounts or making changes to existing accounts",
		["BINDING_NAME_TOGGLEBAG5"] = "Toggle Bag 5",
		["EMOTE58_CMD4"] = "/food",
		["NEWBIE_TOOLTIP_UNIT_TRADE"] = "Initiates a trade with the selected player.",
		["VOICEMACRO_18_Ni_1"] = "You are worthy.",
		["BINDING_NAME_ACTIONBUTTON4"] = "Action Button 4",
		["RESISTANCE_VERYGOOD"] = "Very Good",
		["VOICEMACRO_19_Or_1"] = "This is true love.  Do you think this happens every day?",
		["SPELL_FAILED_TARGET_NOT_PLAYER"] = "Target is not a player",
		["VOICEMACRO_13_Ni_2"] = "I wish you well.",
		["SPELL_FAILED_TARGET_NOT_IN_PARTY"] = "Target is not in your party",
		["EMOTE74_CMD1"] = "/poke",
		["CHAT_EMOTE_GET"] = "%s ",
		["ERR_PASSIVE_ABILITY"] = "You can't put a passive ability in the action bar.",
		["VOICEMACRO_5_Dw_1_FEMALE"] = "I need more mana!",
		["VOICEMACRO_15_Dw_3"] = "Not on your life.",
		["PVP_RANK_5_0"] = "Scout",
		["VOICEMACRO_5_Ni_1_FEMALE"] = "My mana is nearly gone!",
		["EMOTE90_CMD2"] = "/spit",
		["VOICEMACRO_19_Sc_5_FEMALE"] = "I don't need to get funky.  I'm already there.",
		["VOICEMACRO_15_Tr_3"] = "Uh uh.",
		["BINDING_NAME_TOGGLETALENTS"] = "Toggle Talent Pane",
		["EMOTE77_CMD1"] = "/rofl",
		["VOICEMACRO_13_Ta_0"] = "Good journey.",
		["SLASH_GUILD_LEAVE3"] = "/gquit",
		["HELPFRAME_NONQUEST_BULLET2"] = "NPC is not pathing correctly",
		["VOICEMACRO_19_Tr_2"] = "You look pretty.  Pretty tasty.",
		["BINDING_NAME_ATTACKTARGET"] = "Attack Target",
		["BINDING_NAME_ACTIONBUTTON9"] = "Action Button 9",
		["BUG_CATEGORY10"] = "Sound",
		["EMOTE47_CMD1"] = "/glare",
		["EMOTE26_CMD5"] = "/congrats",
		["BIND_KEY_TO_COMMAND"] = "Press Key to Bind to Command -> %s",
		["COMBAT_RATING_NAME10"] = "Crit Rating",
		["EMOTE85_CMD2"] = "/shy",
		["INVTYPE_SHOULDER"] = "Shoulder",
		["EMOTE140_CMD2"] = "/veto",
		["VOICEMACRO_18_Ni_1_FEMALE"] = "Well done.",
		["VOICEMACRO_15_Ta_2"] = "Never.",
		["VOICEMACRO_19_Sc_3"] = "Once you go dead, you never go back.",
		["SLASH_TEAM_CAPTAIN1"] = "/teamcaptain",
		["NEWBIE_TOOLTIP_UNIT_PET_DISMISS"] = "Dismisses your controlled minion.",
		["VOICEMACRO_19_Or_0_FEMALE"] = "You had me at zug zug.",
		["HELP_TICKET_ABANDON"] = "Abandon My Ticket",
		["OPTION_TOOLTIP_ENABLE_GROUP_SPEECH"] = "Enables speech from groupmates.",
		["SLASH_CANCELAURA2"] = "/cancelaura",
		["VOICEMACRO_2_Gn_1_FEMALE"] = "Charge forth!",
		["SLASH_CLICK1"] = "/click",
		["SPELL_FAILED_NOT_HERE"] = "You can't use that here",
		["VOICEMACRO_14_Dw_1_FEMALE"] = "Damn straight.",
		["EMOTE101_CMD3"] = "/victory",
		["VOICEMACRO_4_Gn_0_FEMALE"] = "Can I get some help over here?",
		["KEY_DELETE_MAC"] = "Del",
		["BINDING_NAME_TARGETPARTYPET4"] = "Target Party Pet 4",
		["TUTORIAL_TITLE13"] = "Learning Talents",
		["VOICEMACRO_4_Ni_1_FEMALE"] = "Over here!",
		["ITEM_SOCKET_BONUS"] = "Socket Bonus: %s",
		["HELPFRAME_GM_BUTTON_DESCRIPTION"] = "Contact a GM for personal assistance",
		["KEY_BACKSPACE_MAC"] = "Delete",
		["SPELL_FAILED_WRONG_WEATHER"] = "The weather isn't right for that",
		["OPTION_TOOLTIP_CLICK_TO_MOVE"] = "Use mouse clicks to move your character to destinations.",
		["SLASH_FRIENDS1"] = "/friends",
		["HELPFRAME_NONQUEST_BULLET_TITLE2"] = "The following are NOT considered Non-quest NPC/Creep issues:",
		["SLASH_IGNORE1"] = "/ignore",
		["COMBAT_RATING_NAME7"] = "Hit Rating",
		["HELPFRAME_ITEM_BULLET5"] = "Item accidentally sold to a vendor and was not able to repurchase",
		["EMOTE96_CMD1"] = "/talkq",
		["SLASH_GUILD_HELP2"] = "/guildhelp",
		["EMOTE49_CMD4"] = "/greetings",
		["ITEM_MOD_HIT_TAKEN_MELEE_RATING"] = "Improves melee hit avoidance rating by %d.",
		["SLASH_PROMOTE3"] = "/pr",
		["EMOTE13_CMD1"] = "/bonk",
		["SPELL_FAILED_TARGET_ENEMY"] = "Target is hostile",
		["COMBAT_RATING_NAME15"] = "Resilience",
		["ITEM_LEVEL"] = "Level %d",
		["SLASH_CAST2"] = "/spell",
		["VOICEMACRO_LABEL_YOUREWELCOME2"] = "welc",
		["VOICEMACRO_12_Dw_3"] = "How are you?",
		["BINDING_HEADER_RAID_TARGET"] = "Raid Targeting",
		["SLASH_GUILD_DEMOTE2"] = "/guilddemote",
		["VOICEMACRO_19_Tr_0_FEMALE"] = "I know.  My natural beauty is intimidating.",
		["PVP_RANK_9_1"] = "Sergeant Major",
		["TUTORIAL_TITLE30"] = "Resting",
		["EMOTE5_CMD2"] = "/bravo",
		["BINDING_NAME_MOVEFORWARD"] = "Move Forward",
		["VOICEMACRO_10_Sc_1"] = "Open fire!",
		["EMOTE156_CMD1"] = "/helpme",
		["ITEM_SOLD_COLON"] = "Item Sold:",
		["VOICEMACRO_3_Dw_1"] = "Let's run!",
		["VOICEMACRO_17_Or_0"] = "I would expect the same.",
		["SLASH_BATTLEGROUND1"] = "/bg",
		["SLASH_MACRO1"] = "/macro",
		["SLASH_TARGET_NEAREST_FRIEND2"] = "/targetfriend",
		["EMOTE110_CMD2"] = "/cold",
		["GUILD_CHARTER_PURCHASE"] = "Purchase a Guild Charter",
		["OPTION_TOOLTIP_ENABLE_HARDWARE"] = "Enables the use of hardware sound acceleration.  This will affect performance.",
		["BINDING_NAME_TARGETPARTYMEMBER4"] = "Target Party Member 4",
		["TUTORIAL49"] = "You are now eligible to join battle.  Click \"Join Battle\" in the dialog or right click the battleground icon on the minimap.",
		["VOICEMACRO_4_Gn_1"] = "Help me attack over here!",
		["VOICEMACRO_13_Ta_1"] = "May our paths cross again.",
		["EMOTE18_CMD1"] = "/burp",
		["EMOTE151_CMD1"] = "/flop",
		["VOICEMACRO_18_Gn_2"] = "Good job.",
		["EMOTE92_CMD2"] = "/surprised",
		["KEY_APOSTROPHE"] = "'",
		["VOICEMACRO_18_Dw_0"] = "Congratulations.",
		["SLASH_DUEL_CANCEL4"] = "/yield",
		["EMOTE50_CMD4"] = "/grin",
		["VOICEMACRO_3_Tr_1_FEMALE"] = "Get outta here!",
		["KEY_ENTER"] = "Enter",
		["PVP_RANK_13_0_FEMALE"] = "Centurion",
		["FACTION_ALLIANCE"] = "Alliance",
		["EMOTE125_CMD2"] = "/puzzled",
		["VOICEMACRO_17_Sc_2_FEMALE"] = "This doesn't mean I like you.",
		["SLASH_DUEL_CANCEL5"] = "/concede",
		["HELPFRAME_GENERAL_BUTTON_DESCRIPTION"] = "Basic game play questions/information",
		["NEWBIE_TOOLTIP_UNIT_INVITE"] = "Invites the selected player to join a group.",
		["SLASH_GUILD_WHO5"] = "/gwho",
		["SPELL_FAILED_UNIT_NOT_INFRONT"] = "Target needs to be in front of you",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON7"] = "BottomRight Action Button 7",
		["PVP_RANK_10_0_FEMALE"] = "Stone Guard",
		["SPELL_FAILED_CANT_DUEL_WHILE_STEALTHED"] = "You can't start a duel while stealthed",
		["VOICEMACRO_6_Hu_1"] = "I'll lead the way.",
		["SPELL_FAILED_TARGET_NOT_IN_SANCTUARY"] = "Target is not in a sanctuary",
		["BINDING_NAME_TOGGLECHARACTER0"] = "Toggle Character Pane",
		["EMOTE98_CMD3"] = "/ty",
		["SPELL_FAILED_CANT_DUEL_WHILE_INVISIBLE"] = "You can't start a duel while invisible",
		["SLASH_JOIN5"] = "/join",
		["VOICEMACRO_4_Dw_1"] = "Attack this one!",
		["BINDING_NAME_TOGGLEBACKPACK"] = "Toggle Backpack",
		["GUILD_REGISTRAR_PURCHASE_TEXT"] = "To create a guild you must purchase this charter, get 9 unique player signatures, and return the charter to me.  Please enter the desired name for your guild.",
		["EMOTE150_CMD1"] = "/scared",
		["EMOTE137_CMD2"] = "/taunt",
		["OPTION_TOOLTIP_SHOW_TIPOFTHEDAY"] = "Uncheck this to hide the tip of the day in the load screens.",
		["VOICEMACRO_20_Sc_3"] = "Hey diddle diddle, the mucus and the spittle, the corpse sank in the lagoon.  The murloc said, \"Ahhh...\" to see such a sight, and the Dwarf spanked the baboon.",
		["BINDING_NAME_SHAPESHIFTBUTTON4"] = "Special Action Button 4",
		["SLASH_LIST_CHANNEL4"] = "/chatlist",
		["COMBAT_TEXT_SHOW_DODGE_PARRY_MISS_TEXT"] = "Show Dodge/Parries/Misses",
		["EMOTE26_CMD3"] = "/cong",
		["VOICEMACRO_18_Ta_0_FEMALE"] = "Good job.",
		["VOICEMACRO_16_Ta_3"] = "May your ancestors forever guard your path.",
		["VOICEMACRO_4_Ni_2_FEMALE"] = "Assault my attacker!",
		["ITEM_MOD_HASTE_RANGED_RATING"] = "Improves ranged haste rating by %d.",
		["OPTION_TOOLTIP_SHOW_TARGET_CASTBAR"] = "Show the spell that your current target is casting.",
		["VOICEMACRO_0_Sc_0"] = "I need help!",
		["PVP_MEDAL1"] = "Protector of Stormwind",
		["GUILDCONTROL_ALLOWRANK"] = "Allow this rank to:",
		["HELPFRAME_CHARACTER_BULLET1"] = "Ability/Attribute loss or distortion",
		["TUTORIAL42"] = "When you encounter something new, a help button will appear in the bottom center of your screen. Click the button for a brief explanation of how to interact with that part of the world. These hints will start with the basics and then progress to more advanced topics as you gain in experience.\n\nThank you for playing, and good luck in your adventures!",
		["VOICEMACRO_15_Dw_2_FEMALE"] = "Not a chance.",
		["VOICEMACRO_12_Hu_0"] = "Hi.",
		["NEWBIE_TOOLTIP_HORDE"] = "A proud member of the Horde, opposed to members of the Alliance (Night Elves, Dwarves, Humans, Gnomes, Draenei).",
		["BINDING_NAME_TOGGLEBAG4"] = "Toggle Bag 4",
		["VOICEMACRO_19_Or_4_FEMALE"] = "Don't talk, just follow me.",
		["EMOTE27_CMD2"] = "/unused",
		["VOICEMACRO_2_Gn_0"] = "Get 'em!",
		["INVTYPE_AMMO"] = "Ammo",
		["OPTION_TOOLTIP_SHOW_PLAYER_TITLES"] = "Always display player titles in the game world.",
		["BINDING_NAME_SHAPESHIFTBUTTON10"] = "Special Action Button 10",
		["EMOTE122_CMD1"] = "/pounce",
		["CONFIRM_TEAM_KICK"] = "Really remove %s from %s?",
		["RESISTANCE_LABEL"] = "Resistance",
		["EMOTE126_CMD1"] = "/raise",
		["SLASH_GUILD_DEMOTE4"] = "/guilddemote",
		["OPTION_TOOLTIP_ENABLE_ALL_SHADERS"] = "Enables all pixel shaders.",
		["BINDING_NAME_OPENCHAT"] = "Open Chat",
		["EMOTE158_CMD1"] = "/openfire",
		["VOICEMACRO_2_Hu_0"] = "Charge!",
		["EMOTE84_CMD1"] = "/shrug",
		["TUTORIAL_TITLE23"] = "Chatting",
		["BINDING_HEADER_ACTIONBAR"] = "Action Bar Functions",
		["VOICEMACRO_0_Ta_0_FEMALE"] = "Aid me!",
		["VOICEMACRO_13_Ni_0_FEMALE"] = "Goodbye.",
		["OPTION_TOOLTIP_MOUSE_SENSITIVITY"] = "Adjust the speed at which the mouse cursor moves.",
		["HELPFRAME_HOME_TEXT2"] = "Additionally, we encourage all players to first utilize the forums and the website to pursue information about their respective issues at |cffffd200www.worldofwarcraft.com|r , and request that specific attention be paid to our game policies at |cffffd200www.worldofwarcraft.com/policy/|r .",
		["SLASH_CHAT_MUTE4"] = "/mute",
		["SLASH_USERANDOM2"] = "/userandom",
		["SLASH_GUILD_MOTD2"] = "/guildmotd",
		["BINDING_NAME_TARGETPREVIOUSFRIEND"] = "Target Previous Friend",
		["VOICEMACRO_19_Sc_0"] = "I don't smell that bad for a dead dude, do I?",
		["NEWBIE_TOOLTIP_PARTYOPTIONS"] = "If you belong to a party, you can right-click your portrait to bring up the Party Options menu. This menu will allow you to quit the party or see what looting rules the party is using. A party leader can add or remove party members, as well as change the party's looting rules.",
		["OPTION_TOOLTIP_AUTO_SELF_CAST_SHIFT_KEY"] = "Use the \"SHIFT\" key to cast friendly target spells on yourself even if an enemy is targeted, or there is no target.",
		["EMOTE136_CMD1"] = "/stink",
		["VOICEMACRO_13_Hu_1_FEMALE"] = "Till we meet again.",
		["COMBAT_TEXT_SHOW_LOW_HEALTH_MANA_TEXT"] = "Show Low Mana and Health",
		["ITEM_MOD_HIT_TAKEN_SPELL_RATING"] = "Improves spell hit avoidance rating by %d.",
		["VOICEMACRO_5_Dw_1"] = "I need more mana!",
		["VOICEMACRO_5_Ni_1"] = "My mana has waned!",
		["VOICEMACRO_19_Gn_0_FEMALE"] = "You are cute.",
		["VOICEMACRO_8_Ta_1"] = "I need healing!",
		["CHAT_CHANNEL_JOIN_GET"] = "%s joined channel.",
		["VOICEMACRO_13_Dw_1_FEMALE"] = "Goodbye.",
		["SLASH_LOOKINGFORGROUP1"] = "/lfg",
		["KEY_INSERT"] = "Insert",
		["OPTION_TOOLTIP_GUILDMEMBER_ALERT"] = "Show a message when your guild members login and logout.",
		["VOICEMACRO_19_Sc_0_FEMALE"] = "Nice butt.",
		["VOICEMACRO_20_Dw_1_FEMALE"] = "I don't like to be underground.  It reminds me of death.",
		["HELPFRAME_HARASSMENT_BUTTON_DESCRIPTION"] = "Physical or Verbal actions which cause other players distress can be considered in this option",
		["SLASH_SAY3"] = "/s",
		["GUILDNOTE_BUTTON_TOOLTIP"] = "Click to View your Guild's Message of the Day",
		["GUILD_NOT_ALLIED_S"] = "%s is not part of your alliance.",
		["EMOTE38_CMD3"] = "/feast",
		["SLASH_RANDOM1"] = "/random",
		["SLASH_CHANNEL1"] = "/c",
		["KEY_RIGHTBRACKET"] = "]",
		["EMOTE107_CMD3"] = "/yawn",
		["SLASH_JOIN6"] = "/channel",
		["EMOTE62_CMD8"] = "/lie",
		["HELPFRAME_OPENTICKET_EDITTEXT"] = "Your Current Question:",
		["VOICEMACRO_1_Ni_1"] = "Be alert!",
		["VOICEMACRO_15_Gn_1"] = "No way.",
		["SLASH_CLEAR1"] = "/clear",
		["VOICEMACRO_5_Ta_0"] = "I need more mana!",
		["ITEM_SOULBOUND"] = "Soulbound",
		["VOICEMACRO_0_Or_1"] = "Aid me!",
		["VOICEMACRO_4_Sc_0"] = "Join my fight!",
		["VOICEMACRO_20_Ni_2_FEMALE"] = "You know, Wisps are actually pretty useful for personal hygiene.",
		["VOICEMACRO_10_Tr_1"] = "Light 'em up!",
		["VOICEMACRO_3_Hu_0"] = "Run!",
		["PVP_MINIMAP"] = "Show PvP Minimap",
		["NEWBIE_TOOLTIP_GROUPINVITE"] = "Invites the selected player to join a group.",
		["NEWBIE_TOOLTIP_GUILDREMOVE"] = "Removes the selected player from the guild.",
		["PVP_RANK_18_0"] = "High Warlord",
		["INVTYPE_QUIVER"] = "Quiver",
		["VOICEMACRO_20_Tr_0_FEMALE"] = "Strong halitosis be but one of my feminine traits.",
		["SLASH_CHAT_ANNOUNCE2"] = "/ann",
		["VOICEMACRO_18_Ta_2"] = "Fate smiles upon you.",
		["SLASH_TARGET_NEAREST_ENEMY1"] = "/targetenemy",
		["VOICEMACRO_19_Dw_2"] = "Let's get on with it, then.  I've got a quest to do in fifteen minutes.",
		["SPELL_FAILED_FOOD_LOWLEVEL"] = "That food's level is not high enough for your pet",
		["CONFIRM_DELETING_CHARACTER_SPECIFIC_BINDINGS"] = "Really switch to general key bindings?  All key bindings specific to this character will be permanantly deleted.",
		["SPELL_FAILED_NOT_INFRONT"] = "You must be in front of your target",
		["HELPFRAME_CHARACTER_BULLET4"] = "Profession no longer listed",
		["BINDING_NAME_TURNLEFT"] = "Turn Left",
		["OPTION_TOOLTIP_CLEAR_AFK"] = "Automatically exit AFK mode\nupon moving or talking.",
		["SLASH_RANDOM3"] = "/rnd",
		["EMOTE16_CMD1"] = "/brb",
		["VOICEMACRO_20_Hu_2"] = "A duck walked into an apothecary and he said, \"Give me some chapstick, and put it on my bill.\"",
		["EMOTE159_CMD1"] = "/charge",
		["VOICEMACRO_17_Tr_0_FEMALE"] = "No problem.",
		["HELPFRAME_HOME_ISSUE1_HEADER"] = "Game Hints",
		["OPTION_TOOLTIP_SMART_PIVOT"] = "Lets you free look when the camera is on the ground.",
		["VOICEMACRO_16_Gn_1"] = "I am in your debt.",
		["SPELL_FAILED_CAST_NOT_HERE"] = "You can't cast that here",
		["VOICEMACRO_15_Or_1_FEMALE"] = "Not on your life.",
		["SPELL_FAILED_FLEEING"] = "Can't do that while fleeing",
		["OPTION_TOOLTIP_CAMERA_SMART"] = "Set the camera to stay where placed, except when your character is moving.  (Recommended Mode)",
		["KEY_NUMLOCK_MAC"] = "Clear",
		["GUILD_TOTAL"] = "|cffffffff%d|r Guild Member",
		["VOICEMACRO_8_Or_0"] = "Heal me!",
		["VOICEMACRO_16_Ni_1_FEMALE"] = "How generous.",
		["SLASH_YELL4"] = "/shout",
		["BINDING_NAME_TOGGLEFRIENDSTAB"] = "Toggle Friends Pane",
		["BINDING_NAME_SHAPESHIFTBUTTON9"] = "Special Action Button 9",
		["NEWBIE_TOOLTIP_IGNORETAB"] = "Allows you to modify the list of players whom you are currently ignoring.",
		["GUILDCONTROL_OPTION12"] = "Edit Officer Note",
		["VOICEMACRO_LABEL_WAITHERE2"] = "waithere",
		["VOICEMACRO_2_Gn_0_FEMALE"] = "For Gnomeregan!",
		["ITEM_MOD_HASTE_MELEE_RATING"] = "Improves melee haste rating by %d.",
		["EMOTE20_CMD1"] = "/cackle",
		["TUTORIAL27"] = "If you stray into deep and uncharted waters, you will see a Fatigue bar. If you become completely fatigued, you will begin to drown.",
		["VOICEMACRO_6_Dw_2"] = "Follow me, quick.",
		["SLASH_GUILD_LEADER1"] = "/gleader",
		["OPTION_TOOLTIP_TERRAIN_HIGHLIGHTS"] = "Enables specular highlights on terrain and water. Disabling this can sometimes improve performance.",
		["SLASH_TEAM_INVITE2"] = "/tinvite",
		["VOICEMACRO_16_Dw_3"] = "May your generosity be returned to you a hundred fold.",
		["BINDING_NAME_RESETVIEW1"] = "Reset View 1",
		["SPELL_FAILED_TARGET_UNSKINNABLE"] = "Creature is not skinnable",
		["BUG_CATEGORY15"] = "Language Translation",
		["EMOTE168_CMD1"] = "/wink",
		["SLASH_CASTSEQUENCE2"] = "/castsequence",
		["BINDING_NAME_ALLNAMEPLATES"] = "Show All Name Plates",
		["NEWBIE_TOOLTIP_ADDTEAMMEMBER"] = "Adds a new player to the team.",
		["ITEM_MOD_HIT_RANGED_RATING"] = "Improves ranged hit rating by %d.",
		["SLASH_ASSIST1"] = "/a",
		["SLASH_CLEAR2"] = "/clear",
		["KEY_LEFT"] = "Left Arrow",
		["RESISTANCE_TYPE2"] = "fire",
		["VOICEMACRO_12_Ni_1_FEMALE"] = "Greetings.",
		["OPTION_TOOLTIP_AUTO_LOOT_SHIFT_KEY"] = "Use the \"SHIFT\" key to Loot when \"Auto Loot Corpse\" is checked, and to Auto Loot when it is not.",
		["OPTION_TOOLTIP_LONG_RANGE_NAMEPLATE"] = "Turning this option on will increase the range at which name plates appear.",
		["VOICEMACRO_8_Dw_1_FEMALE"] = "Tend me wounds!",
		["ERR_MUST_REPAIR_DURABILITY"] = "You must repair that item's durability to use it.",
		["BINDING_NAME_TOGGLEAUTORUN"] = "Toggle Autorun",
		["VOICEMACRO_LABEL_CONGRATULATIONS2"] = "congrats",
		["CONFIRM_LOOT_DISTRIBUTION"] = "You wish to assign %s to %s.  Is this correct?",
		["VOICEMACRO_2_Sc_1_FEMALE"] = "For the forsaken!",
		["EMOTE61_CMD1"] = "/laugh",
		["SLASH_GUILD4"] = "/guild",
		["ITEM_PROPOSED_ENCHANT"] = "Will receive %s.",
		["VOICEMACRO_17_Gn_2_FEMALE"] = "You're welcome.",
		["VOICEMACRO_20_Dw_3_FEMALE"] = "It's like my father always used to say, \"Shut up, and get out.\"",
		["VOICEMACRO_14_Gn_1_FEMALE"] = "Of course.",
		["EMOTE45_CMD2"] = "/gaze",
		["VOICEMACRO_12_Tr_0_FEMALE"] = "Hello.",
		["VOICEMACRO_10_Ni_1"] = "Fire!",
		["VOICEMACRO_6_Tr_0_FEMALE"] = "I lead the way.",
		["VOICEMACRO_20_Gn_1_FEMALE"] = "I've discovered that getting pummeled by a blunt weapon can be quite painful.",
		["NEWBIE_TOOLTIP_HONOR_CONTRIBUTION_POINTS"] = "Honor is what you gain by making honorable kills in PvP combat.   How much honor you gain per kill is determined by how much damage you (or your group) did to the player that was killed, with more damage done equaling more honor.   This honor gain is split amongst the members of your group or raid group.   Also you will gain less honor for killing the same player over and over again in a short period of time, so after a few kills of the same player you will get little or no honor from killing them.",
		["OPTION_TOOLTIP_SHOW_OWN_NAME"] = "Shows your character's name.",
		["TUTORIAL37"] = "One of your items has broken! The paper doll below your minimap indicates the broken item in red. You can get the item repaired by a merchant in town. Until you do, you will gain no benefit from the item.",
		["EMOTE101_CMD1"] = "/victory",
		["BINDING_NAME_COMBATLOGPAGEDOWN"] = "Combat Log Page Down",
		["EMOTE66_CMD2"] = "/mourn",
		["SLASH_EMOTE4"] = "/me",
		["EMOTE110_CMD1"] = "/cold",
		["BUG_CATEGORY5"] = "User Interface",
		["PVP_RANK_10_1"] = "Knight",
		["EMOTE163_CMD2"] = "/followme",
		["VOICEMACRO_20_Gn_5"] = "I look bigger in those mirrors where things look bigger.",
		["VOICEMACRO_15_Or_0_FEMALE"] = "No.",
		["SLASH_PET_FOLLOW1"] = "/petfollow",
		["EMOTE53_CMD2"] = "/guffaw",
		["EMOTE78_CMD1"] = "/rude",
		["VOICEMACRO_5_Ni_0"] = "My mana is low!",
		["VOICEMACRO_1_Sc_1"] = "Incoming!",
		["TUTORIAL6"] = "You can cast spells and use special abilities on the enemy by clicking on the buttons in your action bar along the lower left portion of the screen.",
		["ITEM_QUALITY1_DESC"] = "Common",
		["SPELL_CRIT_CHANCE"] = "Crit Chance",
		["VOICEMACRO_1_Gn_0_FEMALE"] = "Danger approaches!",
		["VOICEMACRO_5_Or_1"] = "My mana is low!",
		["PVP_RANK_7_1"] = "Sergeant",
		["ITEM_CREATED_BY"] = "|cff00ff00<Made by %s>|r",
		["SLASH_PET_AGGRESSIVE2"] = "/petaggressive",
		["GUILD_MEMBER_TEMPLATE"] = "%s, %s",
		["OPTION_TOOLTIP_CLICK_CAMERA1"] = "Sets the camera to follow your character after a brief delay when changing direction with click-to-move. (Recommended Mode)",
		["EMOTE127_CMD3"] = "/ready",
		["EMOTE76_CMD2"] = "/roar",
		["SLASH_TEAM_QUIT3"] = "/teamquit",
		["BINDING_NAME_TARGETPARTYMEMBER2"] = "Target Party Member 2",
		["VOICEMACRO_13_Ta_2"] = "May the wind be at your back.",
		["SLASH_BATTLEGROUND2"] = "/battleground",
		["VOICEMACRO_LABEL"] = "Voice Emote",
		["HELPFRAME_NONQUEST_BULLET7"] = "Problem with Quest related NPCs or Creeps",
		["VOICEMACRO_2_Sc_0_FEMALE"] = "Rend flesh with me!",
		["VOICEMACRO_2_Dw_1_FEMALE"] = "By Muridan's beard!",
		["OPTION_TOOLTIP_PARTY_CHAT_BUBBLES"] = "Shows party chat text in speech bubbles above party members' heads.",
		["VOICEMACRO_2_Ni_1_FEMALE"] = "Attack for the goddess!",
		["VOICEMACRO_16_Tr_0_FEMALE"] = "Thanks.",
		["EMOTE4_CMD1"] = "/apologize",
		["VOICEMACRO_5_Or_0_FEMALE"] = "I need mana!",
		["VOICEMACRO_20_Tr_1_FEMALE"] = "I feel pretty, oh so pretty (spit).",
		["VOICEMACRO_13_Dw_2_FEMALE"] = "See ya.",
		["VOICEMACRO_14_Tr_1_FEMALE"] = "Dig it.",
		["GMSURVEY_SUBMITTED"] = "Your survey has been submitted",
		["ITEM_MOD_CRIT_RANGED_RATING"] = "Improves ranged critical strike rating by %d.",
		["HELPFRAME_NONQUEST_BULLET_TITLE1"] = "The following are examples of Non-Quest NPC/Creep issues:",
		["NEWBIE_TOOLTIP_SENDMESSAGE"] = "Sends a private message to the selected player.",
		["ITEM_MOD_CRIT_TAKEN_RATING"] = "Improves critical avoidance rating by %d.",
		["NEWBIE_TOOLTIP_UNIT_PET_RENAME"] = "Gives your pet a new name that you specify. A pet can only be renamed once.",
		["VOICEMACRO_LABEL_YOUREWELCOME1"] = "welcome",
		["RESISTANCE_TYPE6"] = "arcane",
		["SLASH_ASSIST4"] = "/assist",
		["VOICEMACRO_6_Dw_1"] = "Follow me.",
		["BINDING_NAME_TARGETPREVIOUSENEMY"] = "Target Previous Enemy",
		["EMOTE89_CMD1"] = "/snarl",
		["OPTION_TOOLTIP_SHOW_PARTY_PETS"] = "Show the portraits of your party members' pets.",
		["SLASH_TEAM_CAPTAIN3"] = "/teamcaptain",
		["VOICEMACRO_17_Dw_2"] = "Don't mention it.",
		["BINDING_NAME_TOGGLEFPS"] = "Toggle Framerate Display",
		["VOICEMACRO_2_Or_1_FEMALE"] = "Slay them all!",
		["VOICEMACRO_LABEL_HELPME1"] = "help",
		["VOICEMACRO_0_Ta_0"] = "Give me aid!",
		["COMBAT_TEXT_COMBO_POINTS"] = "<%d Combo Point>",
		["VOICEMACRO_19_Or_2_FEMALE"] = "I like men who aren't afraid to cry; cry uncle.",
		["GUILDCONTROL_OPTION6"] = "Demote",
		["VOICEMACRO_0_Ni_0_FEMALE"] = "Aid me!",
		["SLASH_SAY2"] = "/say",
		["NEWBIE_TOOLTIP_MANABAR3"] = "Rogues require energy in order to use their abilities. Energy constantly regenerates.",
		["VOICEMACRO_17_Tr_0"] = "No problem.",
		["SPELL_FAILED_AURA_BOUNCED"] = "A more powerful spell is already active",
		["BINDING_NAME_SAVEVIEW5"] = "Save View 5",
		["VOICEMACRO_1_Ta_0_FEMALE"] = "Danger approaches!",
		["VOICEMACRO_20_Tr_3_FEMALE"] = "The way to a man's heart be through his stomach, but I go through the rib cage.",
		["VOICEMACRO_1_Tr_1_FEMALE"] = "Bad things coming!",
		["SLASH_DUEL2"] = "/duel",
		["TUTORIAL_TITLE22"] = "Friends",
		["EMOTE28_CMD1"] = "/cough",
		["PVP_RANK_11_1_FEMALE"] = "Knight-Lieutenant",
		["VOICEMACRO_3_Hu_0_FEMALE"] = "Run!",
		["EMOTE128_CMD2"] = "/shimmy",
		["BINDING_HEADER_INTERFACE"] = "Interface Panel Functions",
		["VOICEMACRO_20_Gn_0_FEMALE"] = "I apologize profusely for any inconvenience my murderous rampage may have caused.",
		["CONFIRM_BATTLEFIELD_ENTRY"] = "You are now eligible to enter %s, choose an action:",
		["EMOTE123_CMD4"] = "/lavish",
		["PVP_MEDAL8"] = "Voodoo Boss of Sen�jin",
		["VOICEMACRO_4_Tr_0_FEMALE"] = "Strike this foe!",
		["VOICEMACRO_7_Or_1_FEMALE"] = "Wait here.",
		["INVTYPE_WRIST"] = "Wrist",
		["ITEM_ENCHANT_TIME_LEFT_SEC"] = "%s (%d sec)",
		["EMOTE115_CMD1"] = "/introduce",
		["NEWBIE_TOOLTIP_STOPIGNORE"] = "Removes the selected player from your ignore list.",
		["SPELL_FAILED_CANT_CAST_ON_TAPPED"] = "Target is tapped",
		["TUTORIAL32"] = "You are engaging in Player vs. Player combat.  While you are participating in Player vs. Player combat the symbol of your alliance will appear next to your portrait and you can be attacked by enemy players.",
		["SPELL_FAILED_TOO_CLOSE"] = "Target too close",
		["BINDING_NAME_SITORSTAND"] = "Toggle Sit/Stand",
		["EMOTE50_CMD3"] = "/wickedly",
		["NEWBIE_TOOLTIP_HELP"] = "Access the Online Knowledge Base or speak to a Game Master (GM) about a problem you are having. ",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON11"] = "BottomRight Action Button 11",
		["SLASH_INSPECT3"] = "/ins",
		["SPELL_FAILED_NOT_UNSHEATHED"] = "You must be unsheathed",
		["VOICEMACRO_18_Dw_1_FEMALE"] = "Way to go.",
		["VOICEMACRO_17_Ta_2"] = "Anything for an ally.",
		["GM_TICKET_HIGH_VOLUME"] = "We are currently experiencing a high volume of petitions.",
		["SPELL_FAILED_ROOTED"] = "You are unable to move",
		["VOICEMACRO_2_Tr_1"] = "Now, we kill!",
		["VOICEMACRO_15_Ni_1_FEMALE"] = "I don't think so.",
		["EMOTE75_CMD1"] = "/pray",
		["GMSURVEYRATING3"] = "Average",
		["GENERIC_MIN"] = "%d minute",
		["ITEM_MOD_CRIT_TAKEN_MELEE_RATING"] = "Improves melee critical avoidance rating by %d.",
		["VOICEMACRO_6_Hu_0_FEMALE"] = "Follow me.",
		["SLASH_SCRIPT4"] = "/run",
		["PVP_RANK_0_1"] = "Private",
		["SLASH_LEAVE4"] = "/leave",
		["EMOTE123_CMD3"] = "/praise",
		["VOICEMACRO_4_Hu_1_FEMALE"] = "Attack over here!",
		["VOICEMACRO_16_Sc_2"] = "Appreciated.",
		["TUTORIAL_TITLE34"] = "Quest Completion",
		["VOICEMACRO_10_Tr_0"] = "Shoot 'em!",
		["CHAT_CHANNEL_SEND"] = "[%d. %s]: ",
		["OPTION_TOOLTIP_ENABLE_BGSOUND"] = "Enable to allow sounds to play even when World of Warcraft is in the background.",
		["INVTYPE_RANGED"] = "Ranged",
		["CONFIRM_PET_UNLEARN"] = "Do you want to unlearn all of your pet's skills? The cost will increase each time you do it.",
		["SLASH_DUEL1"] = "/duel",
		["SPELL_FAILED_TRY_AGAIN"] = "Failed attempt",
		["SLASH_CHANNEL3"] = "/c",
		["TUTORIAL_TITLE36"] = "Damaged Items",
		["HELPFRAME_CHARACTER_TEXT"] = "Issues regarding abilities, professions, reputation, and talents",
		["ITEM_UNIQUE_MULTIPLE"] = "Unique (%d)",
		["VOICEMACRO_2_Ni_2_FEMALE"] = "Charge forth!",
		["HELP_TEXT_LINE8"] = "- 'v' to see nearby targets.  Also useful for target selection",
		["SPELL_FAILED_NOT_KNOWN"] = "Spell not learned",
		["NEWBIE_TOOLTIP_RAIDTAB"] = "Allows you to view or modify your raid group. Raid groups are groups of more than 5 people used to defeat very difficult challenges at high levels.",
		["SLASH_JOIN7"] = "/chan",
		["EMOTE80_CMD5"] = "/cat",
		["HELPFRAME_ITEM_BULLET2"] = "Weapon proc not activating",
		["BINDING_NAME_TOGGLESOCIAL"] = "Toggle Social Pane",
		["VOICEMACRO_14_Ni_0_FEMALE"] = "Yes.",
		["VOICEMACRO_2_Ni_1"] = "Attack!",
		["SLASH_CHAT_UNMUTE2"] = "/unsquelch",
		["OPTION_TOOLTIP_MASTER_VOLUME"] = "Adjusts the master sound volume.",
		["COMBAT_TEXT_LABEL"] = "Floating Combat Text",
		["VOICEMACRO_19_Ta_4"] = "You know, older bulls really only have one function.",
		["VOICEMACRO_5_Tr_1"] = "I be needing more mana!",
		["SLASH_OFFICER3"] = "/o",
		["VOICEMACRO_3_Gn_2_FEMALE"] = "Retreat!",
		["EMOTE124_CMD1"] = "/purr",
		["INVTYPE_RELIC"] = "Relic",
		["NEWBIE_TOOLTIP_UNIT_PET_ABANDON"] = "Abandons your pet, letting it return to the wild. Once you abandon a pet, you can never regain its companionship.",
		["VOICEMACRO_10_Sc_0_FEMALE"] = "Fire!",
		["BINDING_NAME_ACTIONBUTTON8"] = "Action Button 8",
		["EMOTE85_CMD1"] = "/shy",
		["BINDING_NAME_SHAPESHIFTBUTTON5"] = "Special Action Button 5",
		["SLASH_FRIENDS2"] = "/friend",
		["VOICEMACRO_1_Tr_1"] = "Bad things coming!",
		["SLASH_DISMOUNT1"] = "/dismount",
		["EMOTE41_CMD3"] = "/fidget",
		["EMOTE24_CMD2"] = "/clap",
		["VOICEMACRO_18_Ni_0_FEMALE"] = "Congratulations.",
		["COMBAT_RATING_NAME6"] = "Hit Rating",
		["VOICEMACRO_20_Dw_2_FEMALE"] = "I like my ale like I like my men; dark and rich.",
		["BUG_CATEGORY1"] = "Character Classes",
		["VOICEMACRO_20_Or_4_FEMALE"] = "I need to get my chest waxed again.",
		["PVP_RANK_CIVILIAN_FEMALE"] = "Civilian",
		["ITEM_DURATION_DAYS"] = "Duration: %d days",
		["OPTION_TOOLTIP_STOP_AUTO_ATTACK"] = "Stop auto attacking when you switch targets.",
		["EMOTE144_CMD2"] = "/violin",
		["PVP_RANK_13_0"] = "Centurion",
		["SLASH_TARGET3"] = "/target",
		["DURABILITY_TEMPLATE"] = "Durability %d / %d",
		["BINDING_NAME_TOGGLESOUND"] = "Toggle Sound",
		["KEY_SLASH"] = "/",
		["SPELLDURABILITYDAMAGEOTHERSELF"] = "%s casts %s on you: %s damaged.",
		["ITEM_READABLE"] = "<Right Click to Read>",
		["TUTORIAL4"] = "Left-Click selects a target and Right-Click interacts with it.",
		["SPELL_FAILED_EQUIPPED_ITEM_CLASS"] = "Must have a %s equipped",
		["BINDING_NAME_SHAPESHIFTBUTTON3"] = "Special Action Button 3",
		["VOICEMACRO_20_Tr_2"] = "I got a shrunken head.  I just came out of the pool.",
		["OPTION_TOOLTIP_WEATHER_DETAIL"] = "Controls the intensity of weather effects.  Decrease to improve performance.",
		["OPTION_TOOLTIP_SHOW_CASTABLE_BUFFS"] = "Show only Buffs the player can cast.  Only applies to raids.",
		["VOICEMACRO_12_Hu_1_FEMALE"] = "Hello.",
		["HELPFRAME_NONQUEST_BULLET3"] = "Creeps over-spawning or under-spawning",
		["VOICEMACRO_6_Ni_1"] = "Follow me.",
		["SLASH_STOPMACRO1"] = "/stopmacro",
		["NEWBIE_TOOLTIP_MANABAR4"] = "The amount of happiness your pet currently has. Content pets inflict normal damage on their enemies, whereas Happy pets inflict enhanced damage, and unhappy pets inflict reduced damage. Happiness goes down when your pet dies or as it grows hungry, while feeding your pet will increase its happiness.",
		["VOICEMACRO_LABEL_YES1"] = "yes",
		["SPELL_FAILED_DAMAGE_IMMUNE"] = "You can't do that while you are immune",
		["VOICEMACRO_19_Ta_5"] = "Are you comfortable with complicated machinery?",
		["ITEM_CONJURED"] = "Conjured Item",
		["EMOTE166_CMD1"] = "/healme",
		["SLASH_GUILD_INVITE1"] = "/ginvite",
		["SLASH_READYCHECK2"] = "/readycheck",
		["VOICEMACRO_8_Hu_0_FEMALE"] = "I need healing.",
		["VOICEMACRO_15_Or_1"] = "You must be joking.",
		["VOICEMACRO_7_Or_0_FEMALE"] = "Stay.",
		["OPTION_TOOLTIP_CHAT_LOCKED"] = "Locks all chat windows so they cannot accidentally be altered.",
		["VOICEMACRO_5_Or_0"] = "I need mana!",
		["VOICEMACRO_19_Gn_3_FEMALE"] = "I do not find you completely disagreeable.",
		["SPELL_FAILED_LINE_OF_SIGHT"] = "Target not in line of sight",
		["KEY_COMMA"] = ",",
		["NEWBIE_TOOLTIP_UNIT_DUEL"] = "Challenges the selected player to a duel. The first player to reach zero hit points loses the duel.",
		["SPELL_FAILED_TARGET_DUELING"] = "Target is currently dueling",
		["VOICEMACRO_15_Gn_0_FEMALE"] = "No way.",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY1"] = "This will show the World PVP objectives when you are in PVP zones.",
		["SPELL_FAILED_NOT_STANDING"] = "You must be standing to do that",
		["SLASH_GUILD_WHO3"] = "/whoguild",
		["OPTION_TOOLTIP_SOUND_CHANNELS"] = "Changes the number of active software sound channels.",
		["TUTORIAL_TITLE29"] = "Breath",
		["VOICEMACRO_LABEL_INCOMING1"] = "incoming",
		["KEY_MINUS"] = "-",
		["BINDING_NAME_TOGGLELFMTAB"] = "Toggle LFM Pane",
		["VOICEMACRO_0_Ni_1_FEMALE"] = "Assist me!",
		["VOICEMACRO_19_Dw_4_FEMALE"] = "Enough with your flirting.  I know you think all Dwarven women look the same.",
		["VOICEMACRO_20_Gn_3"] = "I had an idea for a device that you could put small pieces of bread in to cook, but in the end I really didn't think there would be much of a market for it.",
		["SLASH_CHAT_AFK2"] = "/afk",
		["BINDING_NAME_PITCHDOWN"] = "Pitch Down",
		["SLASH_LOOKINGFORMORE1"] = "/lfm",
		["EMOTE87_CMD1"] = "/sit",
		["SLASH_LIST_CHANNEL1"] = "/chatlist",
		["EMOTE56_CMD3"] = "/hello",
		["GUILD_HELP_TEXT_LINE1"] = "For now, to create a guild type 'guildcreate <guild name>' in the console.",
		["VOICEMACRO_13_Ni_1"] = "Goodbye.",
		["PVP_RANK_18_1"] = "Grand Marshal",
		["VOICEMACRO_16_Tr_0"] = "Thanks.",
		["KEY_PERIOD"] = ".",
		["VOICEMACRO_20_Tr_2_FEMALE"] = "I got all this and personality, too.",
		["ITEM_MOD_HIT_SPELL_RATING"] = "Improves spell hit rating by %d.",
		["CONFIRM_TEAM_LEAVE"] = "Really leave %s?",
		["SLASH_CHANGEACTIONBAR1"] = "/changeactionbar",
		["CONFIRM_GUILD_PROMOTE"] = "Really promote %s to Guildmaster?",
		["VOICEMACRO_15_Ni_2_FEMALE"] = "Absolutely not.",
		["EMOTE142_CMD2"] = "/tickle",
		["PVP_RANK_2_1_FEMALE"] = "Outlaw",
		["GUILD_TOTAL_P1"] = "|cffffffff%d|r Guild Members",
		["VOICEMACRO_4_Ni_1"] = "Smite my foe!",
		["FACTION_INACTIVE"] = "Inactive",
		["SLASH_PARTY3"] = "/p",
		["KEY_LEFTBRACKET"] = "[",
		["GM_TICKET_WAIT_TIME"] = "Approximate time remaining:\n%s",
		["VOICEMACRO_18_Ni_2"] = "Excellent.",
		["RESILIENCE"] = "Resilience",
		["SLASH_CLICK2"] = "/click",
		["COMBAT_RATING_NAME9"] = "Crit Rating",
		["HELPFRAME_CHARACTER_BULLET5"] = "Talents malfunctioning or missing",
		["EMOTE127_CMD1"] = "/ready",
		["BINDING_NAME_RAIDTARGET3"] = "Assign Diamond to Target",
		["ITEM_SPELL_CHARGES_P1"] = "%d Charges",
		["BINDING_NAME_TOGGLEMUSIC"] = "Toggle Music",
		["ITEM_MOD_RESILIENCE_RATING"] = "Improves your resilience rating by %d.",
		["GM_TICKET_ESCALATED"] = "Your ticket has been escalated.",
		["SPELL_CAST_CHANNELED"] = "Channeled",
		["HELPFRAME_ACCOUNT_BULLET_TITLE1"] = "Billing & Account services can help with these kinds of issues:",
		["EMOTE64_CMD1"] = "/moan",
		["VOICEMACRO_1_Ta_2_FEMALE"] = "Be watchful!",
		["EMOTE82_CMD3"] = "/shake",
		["RESISTANCE_TYPE4"] = "frost",
		["SLASH_GUILD_HELP5"] = "/ghelp",
		["SLASH_SAVEGUILDROSTER2"] = "/saveguildroster",
		["TUTORIAL_TITLE33"] = "Jumping",
		["BINDING_NAME_MOVEANDSTEER"] = "Move and Steer",
		["BINDING_NAME_ACTIONPAGE3"] = "Action Page 3",
		["VOICEMACRO_7_Dw_1"] = "Stay put.",
		["VOICEMACRO_13_Hu_0_FEMALE"] = "Goodbye.",
		["EMOTE38_CMD2"] = "/chew",
		["KEY_SEMICOLON"] = ";",
		["VOICEMACRO_0_Hu_0_FEMALE"] = "I need help!",
		["SPELL_FAILED_FIZZLE"] = "Fizzled",
		["BINDING_NAME_ACTIONBUTTON3"] = "Action Button 3",
		["GENERIC_SEC_P1"] = "%d seconds",
		["EMOTE115_CMD2"] = "/introduce",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY3"] = "This will turn off the World PVP objectives.",
		["VOICEMACRO_8_Sc_0"] = "Heal my flesh!",
		["PVP_RANK_12_0"] = "Legionnaire",
		["SLASH_TRADE1"] = "/tr",
		["VOICEMACRO_14_Tr_0"] = "Of course, man.",
		["SPELLDURABILITYDAMAGEALLOTHERSELF"] = "%s casts %s on you: all items damaged.",
		["EMOTE151_CMD2"] = "/flop",
		["SLASH_LOGOUT2"] = "/camp",
		["VOICEMACRO_10_Ni_0"] = "Fire at will!",
		["VOICEMACRO_12_Or_1_FEMALE"] = "Hey.",
		["EMOTE96_CMD4"] = "/question",
		["VOICEMACRO_13_Hu_2"] = "It's been fun.",
		["NEWBIE_TOOLTIP_GUILDPUBLICNOTE"] = "Click to view your public note. This is information that other players will see about you in the guild UI. If you click on the note itself, you will be able to edit it.",
		["FRIENDS_LIST_TEMPLATE"] = "%s |cffffffff- %s|r %s",
		["INVTYPE_NECK"] = "Neck",
		["VOICEMACRO_20_Dw_4_FEMALE"] = "My uncle has brass balls.  No, really!",
		["EMOTE22_CMD3"] = "/strut",
		["COMBAT_TEXT_SCROLL_DOWN_TEXT"] = "Scroll Text Down",
		["VOICEMACRO_7_Tr_1"] = "Stay put.",
		["BINDING_NAME_CAMERAZOOMOUT"] = "Zoom Out",
		["PVP_MEDAL4"] = "High Sentinel of Darnassus",
		["SLASH_CHAT_DND1"] = "/dnd",
		["CHAT_CHANNEL_LEAVE_GET"] = "%s left channel.",
		["SPELL_FAILED_STUNNED"] = "Can't do that while stunned",
		["GUILD_RANK1_DESC"] = "Officer",
		["HELPFRAME_HOME_ISSUE2_HEADER"] = "Meta-Game Hints",
		["EMOTE70_CMD1"] = "/panic",
		["SLASH_RAID3"] = "/ra",
		["EMOTE1_CMD1"] = "/agree",
		["EMOTE91_CMD2"] = "/stare",
		["SPELL_FAILED_REQUIRES_AREA"] = "You need to be in %s",
		["OPTION_TOOLTIP_LOG_PERIODIC_EFFECTS"] = "Display damage caused by periodic effects such as Rend and Shadow Word: Pain.",
		["VOICEMACRO_LABEL_CHEER1"] = "cheer",
		["VOICEMACRO_14_Or_3_FEMALE"] = "Uh huh.",
		["VOICEMACRO_19_Ta_3"] = "Hey, you work out?",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON4"] = "BottomLeft Action Button 4",
		["COMBAT_TEXT_SCROLL_DOWN"] = "Scroll Down",
		["VOICEMACRO_4_Tr_1"] = "Help me here!",
		["TUTORIAL_TITLE10"] = "Bags",
		["SPELL_FAILED_ONLY_NIGHTTIME"] = "Can only use during the night",
		["VOICEMACRO_4_Or_0"] = "Attack over here!",
		["SLASH_GUILD_INVITE2"] = "/guildinvite",
		["HELPFRAME_ITEM_BULLET1"] = "Item lost after crashing",
		["EMOTE10_CMD1"] = "/bleed",
		["VOICEMACRO_0_Gn_0"] = "Could you help, please?",
		["SPELL_FAILED_LEVEL_REQUIREMENT_PET"] = "Your pet is not high enough level",
		["VOICEMACRO_20_Tr_0"] = "Cooking's done.  Stew here.",
		["EMOTE68_CMD1"] = "/nod",
		["OPTION_TOOLTIP_AUTO_SELF_CAST_NONE_KEY"] = "Do not apply a key.",
		["OPTION_TOOLTIP_SHOW_GUILD_NAMES"] = "Always display player guild names in the game world.",
		["BINDING_NAME_TOGGLEMINIMAP"] = "Toggle Minimap",
		["VOICEMACRO_17_Sc_1_FEMALE"] = "Eh.",
		["MELEE_ATTACK_POWER_TOOLTIP"] = "Increases damage with melee weapons by %.1f damage per second.",
		["VOICEMACRO_10_Or_0_FEMALE"] = "Open fire!",
		["SLASH_GUILD_INFO4"] = "/guildinfo",
		["EMOTE6_CMD1"] = "/bashful",
		["EMOTE62_CMD1"] = "/laydown",
		["VOICEMACRO_8_Gn_0"] = "Please, heal me!",
		["PVP_RANK_3_1_FEMALE"] = "Exiled",
		["SLASH_LOOT_ROUNDROBIN2"] = "/roundrobin",
		["EMOTE72_CMD2"] = "/plead",
		["CHARACTER_BUTTON"] = "Character Info",
		["RESISTANCE_TEMPLATE"] = "%d %s",
		["KEY_RIGHT"] = "Right Arrow",
		["VOICEMACRO_12_Hu_2"] = "Hail.",
		["ITEM_COOLDOWN_TIME_MIN"] = "Cooldown remaining: %d min",
		["SPELL_FAILED_NEED_EXOTIC_AMMO"] = "Requires exotic ammo: %s",
		["OPTION_TOOLTIP_UI_SCALE"] = "Changes the size of the game’s user interface.",
		["VOICEMACRO_20_Dw_1"] = "Ah winter.  Yes, winter.",
		["EMOTE134_CMD2"] = "/snub",
		["VOICEMACRO_LABEL_OPENFIRE1"] = "fire",
		["EMOTE23_CMD2"] = "/chuckle",
		["COMMAND"] = "Command",
		["BINDING_NAME_TOGGLEUI"] = "Toggle User Interface",
		["EMOTE93_CMD1"] = "/surrender",
		["NEWBIE_TOOLTIP_UNIT_NEED_BEFORE_GREED"] = "Under need-before-greed rules, loot is distributed round-robin style.  Any items over the loot threshold can only be rolled on by group members that can use the item.",
		["EMOTE95_CMD2"] = "/excited",
		["VOICEMACRO_13_Tr_1_FEMALE"] = "So long.",
		["SPELL_FAILED_NOT_READY"] = "Not yet recovered",
		["SLASH_TARGET_NEAREST_ENEMY2"] = "/targetenemy",
		["SPELLDURABILITYDAMAGEALLOTHEROTHER"] = "%s casts %s on %s: all items damaged.",
		["ADDMEMBER_TEAM"] = "Add Member",
		["KEY_TILDE"] = "~",
		["EMOTE86_CMD2"] = "/sigh",
		["SLASH_INVITE3"] = "/invite",
		["SLASH_FOLLOW4"] = "/f",
		["VOICEMACRO_19_Ni_0_FEMALE"] = "If I wasn't purple, you'd see I was blushing.",
		["VOICEMACRO_4_Dw_1_FEMALE"] = "Attack this one!",
		["OPTION_TOOLTIP_HARDWARE_CURSOR"] = "Enable this option for the best performance unless you have cursor problems.",
		["ITEM_MOD_CRIT_RATING"] = "Improves critical strike rating by %d.",
		["EMOTE57_CMD2"] = "/hug",
		["NEWBIE_TOOLTIP_MAINMENU"] = "Modify your settings, change your hotkeys or exit the game.",
		["VOICEMACRO_20_Sc_2"] = "Roses are gray, violets are gray.  I'm dead and color blind.",
		["OPTION_TOOLTIP_AUTO_LOOT_NONE_KEY"] = "Do not apply a key.",
		["SLASH_MACRO2"] = "/m",
		["EMOTE62_CMD5"] = "/laydown",
		["HELPFRAME_QUEST_BULLET2"] = "Unable to acquire quest related items",
		["VOICEMACRO_12_Gn_2"] = "Salutations.",
		["VOICEMACRO_5_Or_1_FEMALE"] = "My mana is low!",
		["VOICEMACRO_LABEL_ATTACKMYTARGET2"] = "as",
		["FACTION_HORDE"] = "Horde",
		["VOICEMACRO_14_Tr_0_FEMALE"] = "Sure thing.",
		["OPTION_TOOLTIP_AUTO_SELF_CAST"] = "When this is enabled, friendly target spells that you cast while you have a non friendly target or no target will automatically be self cast. This function has a hotkey that can be assigned.",
		["VOICEMACRO_2_Ta_1_FEMALE"] = "Attack!",
		["TUTORIAL10"] = "You can put bags in the empty bag spaces in the lower right part of your screen next to the backpack, and then click on them to open them.",
		["VOICEMACRO_3_Tr_1"] = "Get outta here!",
		["VOICEMACRO_LABEL_RASPBERRY2"] = "raspberry",
		["ITEM_DURATION_SEC"] = "Duration: %d sec",
		["EMOTE41_CMD4"] = "/impatient",
		["VOICEMACRO_15_Ta_0"] = "No.",
		["CONFIRM_SUMMON"] = "%s wants to summon you to %s.  The spell will be cancelled in %d %s.",
		["VOICEMACRO_20_Or_4"] = "Orc smash!",
		["VOICEMACRO_4_Or_2_FEMALE"] = "Join my attack!",
		["ITEM_MOD_MANA"] = "%c%d Mana",
		["VOICEMACRO_18_Hu_1"] = "Excellent.",
		["HELP_FRAME_TITLE"] = "Customer Support",
		["ITEM_DISENCHANT_NOT_DISENCHANTABLE"] = "Cannot be disenchanted",
		["ITEM_MOD_BLOCK_RATING"] = "Increases your shield block rating by %d.",
		["TUTORIAL_TITLE24"] = "Equippable Items",
		["SLASH_GUILD_DISBAND4"] = "/guilddisband",
		["SPELL_FAILED_ITEM_NOT_READY"] = "Item is not ready yet",
		["VOICEMACRO_LABEL_SILLY1"] = "silly",
		["VOICEMACRO_4_Dw_0"] = "Join my attack!",
		["KEY_DOWN"] = "Down Arrow",
		["VOICEMACRO_18_Dw_3_FEMALE"] = "Brilliant.",
		["VOICEMACRO_20_Sc_0"] = "I can't stand the smell of Orcs.",
		["NEWBIE_TOOLTIP_FRIENDSTAB"] = "Allows you to manage a list of players you enjoy playing with. You receive notifications of friends logging on or off.",
		["VOICEMACRO_18_Sc_0"] = "Congratulations.",
		["VOICEMACRO_20_Ni_5"] = "Who wants to live forever?",
		["SLASH_TARGET_NEAREST_PARTY2"] = "/targetparty",
		["VOICEMACRO_19_Dw_2_FEMALE"] = "I'd like to see you in a kilt.",
		["SPELL_FAILED_CANT_BE_DISENCHANTED_SKILL"] = "Your Enchanting skill is not high enough to disenchant that",
		["BINDING_NAME_TOGGLERUN"] = "Toggle Run/Walk",
		["VOICEMACRO_4_Ni_0"] = "Assault my attacker!",
		["SLASH_WHISPER7"] = "/whisper",
		["HELPFRAME_QUEST_BULLET3"] = "Quest creep not dropping a required quest item",
		["OPTION_TOOLTIP_TARGETOFTARGET1"] = "Sets Target of Target to display when you are in a raid.",
		["PVP_RANK_8_1_FEMALE"] = "Master Sergeant",
		["OPTION_TOOLTIP_SHOW_PARTY_BACKGROUND"] = "Show a background behind party members.",
		["EMOTE135_CMD2"] = "/soothe",
		["SLASH_CHAT_UNMUTE4"] = "/unmute",
		["ITEM_REQ_REPUTATION"] = "Requires %s - %s",
		["VOICEMACRO_20_Or_3_FEMALE"] = "What's estrogen?  Can you eat it?",
		["VOICEMACRO_14_Ni_0"] = "Yes.",
		["OPTION_TOOLTIP_BLOCK_TRADES"] = "Block all incoming trade requests.",
		["EMOTE102_CMD1"] = "/wave",
		["VOICEMACRO_19_Tr_2_FEMALE"] = "Aren't you going to axe me out?",
		["RESISTANCE6_NAME"] = "Arcane Resistance",
		["OPTION_TOOLTIP_VERTEX_ANIMATION_SHADERS"] = "Enables the use of vertex shaders to speed animation. Enable this to maximize performance.",
		["SPELL_FAILED_CANT_BE_DISENCHANTED"] = "Item cannot be disenchanted",
		["VOICEMACRO_20_Or_2_FEMALE"] = "I feel very feminine, and I'll beat the crap out of anyone who disagrees.",
		["VOICEMACRO_8_Hu_1_FEMALE"] = "Heal me!",
		["EMOTE105_CMD2"] = "/whistle",
		["GUILD_MOTD_LABEL"] = "Guild Message Of The Day:",
		["VOICEMACRO_7_Hu_0_FEMALE"] = "Stay put.",
		["HELP_BUTTON"] = "Help Request",
		["ERR_LEARN_ABILITY_S"] = "You have learned a new ability: %s.",
		["OPTION_TOOLTIP_ANIMATION"] = "PLACE_HOLDER",
		["SLASH_LOOT_ROUNDROBIN1"] = "/roundrobin",
		["VOICEMACRO_20_Hu_0_FEMALE"] = "Why does everyone automatically assume I know tailoring and cooking?",
		["VOICEMACRO_20_Hu_0"] = "Cover for me.  I gotta whiz behind a tree.",
		["TUTORIAL3"] = "You can rotate your camera view by dragging the left mouse button in the play field.  You can rotate your character and your view at the same time by dragging the right mouse button in the play field.",
		["EMOTE80_CMD3"] = "/catty",
		["EMOTE53_CMD1"] = "/guffaw",
		["VOICEMACRO_13_Hu_0"] = "Farewell.",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_REACTIVES"] = "Shows when reactive class specific abilities and spells become available (e.g. Overpower for warriors).",
		["SPELL_FAILED_TARGET_NOT_LOOTED"] = "Creature must be looted first",
		["TUTORIAL_TITLE39"] = "Groups",
		["CONFIRM_LOSE_BINDING_CHANGES"] = "You will lose any unsaved changes if you switch between general and character specific key bindings.",
		["VOICEMACRO_10_Gn_1"] = "Shoot!",
		["SLASH_RANDOM6"] = "/rnd",
		["SPELL_FAILED_TOO_MANY_SKILLS"] = "Your pet can't learn any more skills",
		["HELPFRAME_QUEST_BULLET5"] = "Request for information that would simplify a quest",
		["VOICEMACRO_15_Dw_0"] = "No.",
		["VOICEMACRO_19_Ni_3"] = "I'm a force of nature.",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON1"] = "Right ActionBar 2 Button 1",
		["EMOTE97_CMD2"] = "/tap",
		["VOICEMACRO_17_Sc_1"] = "Eh.",
		["PVP"] = "PvP",
		["VOICEMACRO_10_Sc_1_FEMALE"] = "Open fire!",
		["VOICEMACRO_18_Ni_2_FEMALE"] = "Excellent.",
		["BINDING_NAME_BONUSACTIONBUTTON8"] = "Secondary Action Button 8",
		["COMBAT_RATING_NAME3"] = "Dodge Rating",
		["OPTION_TOOLTIP_TERRAIN_TEXTURE"] = "Sets the terrain texture detail.",
		["GUILD_HELP_TEXT_LINE7"] = "'/gpromote <player>' promotes a player one rank within your guild",
		["SLASH_DUEL_CANCEL3"] = "/forfeit",
		["EMOTE150_CMD2"] = "/scared",
		["KEY_NUMPAD2"] = "Num Pad 2",
		["PVP_RANK_16_0"] = "General",
		["VOICEMACRO_19_Hu_3"] = "What's your sign?",
		["VOICEMACRO_14_Sc_1_FEMALE"] = "Why not.",
		["SPELL_FAILED_NO_AMMO"] = "Out of ammo",
		["HELP_TEXT_LINE15"] = "- For help with the new macro UI type /macrohelp",
		["VOICEMACRO_13_Tr_1"] = "It been real.",
		["VOICEMACRO_14_Dw_2_FEMALE"] = "Of course.",
		["VOICEMACRO_8_Gn_1_FEMALE"] = "Would you please heal me?",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY_DYNAMIC"] = "This will show the World PVP objectives when you are near PVP points of interest.",
		["VOICEMACRO_6_Sc_1_FEMALE"] = "Follow.",
		["SLASH_TEAM_INVITE1"] = "/teaminvite",
		["ITEM_UNIQUE"] = "Unique",
		["BINDING_NAME_OPENALLBAGS"] = "Open All Bags",
		["BINDING_NAME_TOGGLELFGPARENT"] = "Toggle LFG/LFM Frame",
		["SLASH_HELP4"] = "/h",
		["VOICEMACRO_12_Gn_2_FEMALE"] = "Hi, there.",
		["VOICEMACRO_7_Gn_1_FEMALE"] = "Wait here, please.",
		["VOICEMACRO_7_Ni_1"] = "Wait here.",
		["ITEM_RANDOM_ENCHANT"] = "<Random enchantment>",
		["ITEM_BIND_ON_EQUIP"] = "Binds when equipped",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON5"] = "Right Action Button 5",
		["VOICEMACRO_5_Gn_1"] = "I'm short on mana!",
		["EMOTE68_CMD4"] = "/yes",
		["VOICEMACRO_8_Tr_0"] = "Cure me!",
		["KEY_DELETE"] = "Delete",
		["ITEM_COOLDOWN_TIME_SEC"] = "Cooldown remaining: %d sec",
		["OPTION_TOOLTIP_MOUSE_LOOK_SPEED"] = "Adjust the speed at which you turn the camera when using mouse look.",
		["HELPFRAME_STUCK_BUTTON_DESCRIPTION"] = "Physically stuck in an area of the map",
		["VOICEMACRO_17_Hu_0_FEMALE"] = "No problem.",
		["PVP_LABEL_HONOR"] = "HONOR:",
		["GUILD_CHARTER_TEMPLATE"] = "%s Guild Charter",
		["VOICEMACRO_6_Ni_0"] = "I'll lead the way.",
		["SLASH_UNINVITE4"] = "/uninvite",
		["EMOTE113_CMD2"] = "/duck",
		["VOICEMACRO_15_Hu_2_FEMALE"] = "I don't think so.",
		["COMBAT_TEXT_SHOW_REACTIVES_TEXT"] = "Show Reactive Spells and Abilities",
		["PVP_RANK_1_1"] = "Pariah",
		["EMOTE43_CMD6"] = "/disappointment",
		["VOICEMACRO_8_Dw_2_FEMALE"] = "Heal me!",
		["GUILD_HELP_TEXT_LINE13"] = "'/gdisband' disbands your guild",
		["SLASH_YELL5"] = "/y",
		["OPTION_TOOLTIP_HIDE_OUTDOOR_WORLD_STATE"] = "Checking this will hide the interface for tracking zone wide objectives.",
		["OPTION_TOOLTIP_ALWAYS_SHOW_MULTIBARS"] = "Check this option to always display extra actionbars.",
		["SLASH_TEAM_QUIT1"] = "/teamquit",
		["ITEM_CANT_BE_DESTROYED"] = "That item cannot be destroyed.",
		["EMOTE59_CMD1"] = "/kiss",
		["GUILDCONTROL_RANKLABEL"] = "Rank Label:",
		["EMOTE163_CMD1"] = "/followme",
		["EMOTE21_CMD1"] = "/cheer",
		["BUG_BUTTON"] = "Bugs & Suggestions",
		["ITEM_MOD_HIT_RATING"] = "Improves hit rating by %d.",
		["BINDING_NAME_PREVVIEW"] = "Previous View",
		["BINDING_NAME_FRIENDNAMEPLATES"] = "Show Friendly Name Plates",
		["CONFIRM_TALENT_WIPE"] = "Do you want to unlearn all of your talents?  The cost will increase each time you do it.",
		["BINDING_NAME_SETVIEW3"] = "Set View 3",
		["VOICEMACRO_12_Sc_2_FEMALE"] = "Hey.",
		["BINDING_HEADER_MOVEMENT"] = "Movement Keys",
		["VOICEMACRO_13_Gn_2_FEMALE"] = "It's been quite an experience.",
		["VOICEMACRO_13_Hu_1"] = "Till we meet again.",
		["SLASH_UNINVITE7"] = "/uninvite",
		["SPELL_CAST_TIME_INSTANT"] = "Instant cast",
		["EMOTE154_CMD1"] = "/commend",
		["EMOTE117_CMD2"] = "/lick",
		["SPELL_FAILED_CONFUSED"] = "Can't do that while confused",
		["EMOTE146_CMD2"] = "/rasp",
		["SLASH_BENCHMARK2"] = "/benchmark",
		["SLASH_WHISPER3"] = "/t",
		["EMOTE44_CMD2"] = "/gasp",
		["VOICEMACRO_19_Ta_0_FEMALE"] = "I'm tired of the same old bull.",
		["VOICEMACRO_5_Ta_1_FEMALE"] = "I need more mana!",
		["HELPFRAME_TECHNICAL_BULLET1"] = "Decline in game performance (game becomes slow or choppy)",
		["PVP_THISWEEK"] = "This Week",
		["VOICEMACRO_15_Ta_1_FEMALE"] = "I don't think so.",
		["NEWBIE_TOOLTIP_GUILDTAB"] = "Allows you to view information about your guild, and players in it. If you are an officer, you can also manage your guild from this tab.",
		["NEWBIE_TOOLTIP_CHATMENU"] = "Commands used for communicating with others. With the Chat menu, you can talk to people standing nearby, send a private message to one person, chat with party members, wave at a friend, or create a macro.",
		["PVP_MEDAL2"] = "Overlord of Orgrimmar",
		["EMOTE4_CMD2"] = "/sorry",
		["SPELL_FAILED_NOT_WHILE_TRADING"] = "Can't cast while trading",
		["HELPFRAME_TECHNICAL_BULLET6"] = "Crashes or error messages of any kind occurring during gameplay",
		["VOICEMACRO_20_Sc_4"] = "Anyone have any odorant?  Either \"wet dog\", \"fresh garbage\", or \"low tide\" would do.",
		["VOICEMACRO_2_Or_0"] = "Destroy them!",
		["CHAT_EMOTE_UNKNOWN"] = "makes some strange gestures.",
		["VOICEMACRO_3_Tr_0"] = "Run!",
		["EMOTE3_CMD4"] = "/mad",
		["NEWBIE_TOOLTIP_UNIT_LEAVE_PARTY"] = "Removes the player from their current party.",
		["OPTION_TOOLTIP_OBJECT_ALPHA"] = "PLACE_HOLDER",
		["SPELL_FAILED_NO_FISH"] = "There aren't any fish here",
		["EMOTE22_CMD6"] = "/strut",
		["VOICEMACRO_5_Hu_0"] = "I'm out of mana!",
		["SLASH_PARTY2"] = "/party",
		["TUTORIAL_TITLE21"] = "Quest Log",
		["PVP_RANK_CIVILIAN"] = "Civilian",
		["GM_SURVEY_NOT_APPLICABLE"] = "N/A",
		["HELPFRAME_HOME_ISSUE1"] = "When it comes to quests, Non-Player Characters (NPCs), item information, location information, or anything that would provide information about something that the player could possibly find out through exploration and/or interaction with the world, including interaction with other players.",
		["SPELL_FAILED_TARGET_NOT_GHOST"] = "Target is not a ghost",
		["VOICEMACRO_12_Tr_2_FEMALE"] = "Greetings.",
		["OPTION_TOOLTIP_ENABLE_MUSIC"] = "Enable background music.",
		["KEY_PAGEUP"] = "Page Up",
		["VOICEMACRO_20_Hu_6_FEMALE"] = "I can't wait till this quest is done, and I can look for another Garibaldi artifact.",
		["VOICEMACRO_20_Ni_4_FEMALE"] = "Oh, I'm dancing again.  I hope all your friends are enjoying the show.",
		["SPELL_FAILED_NO_MAGIC_TO_CONSUME"] = "No magic to consume",
		["PVP_DISABLED"] = "PvP Disabled",
		["KEY_NUMPADDIVIDE"] = "Num Pad /",
		["VOICEMACRO_17_Ni_0"] = "You're welcome.",
		["VOICEMACRO_5_Hu_1"] = "My mana is low!",
		["VOICEMACRO_20_Hu_5_FEMALE"] = "I can't find anywhere to get my nails done.",
		["OPTION_TOOLTIP_SCROLL_ARC"] = "Scrolls the text in arcs away from the player.",
		["VOICEMACRO_10_Hu_0_FEMALE"] = "Attack!",
		["EMOTE80_CMD6"] = "/catty",
		["GUILDCONTROL_OPTION4"] = "Officerchat Speak",
		["SPELL_FAILED_ONLY_MOUNTED"] = "Can only use while mounted",
		["VOICEMACRO_12_Gn_3"] = "Hi, there.",
		["VOICEMACRO_10_Or_0"] = "Shoot!",
		["HELPFRAME_HOME_TEXT1"] = "Game Masters are normally available to assist 24 hours a day. Game Masters will be able to assist you no matter which character you are currently playing on.  Keep in mind that there are some issues that Game Masters will |cffffd200NOT|r be able to assist you with.  They include, but are |cffffd200NOT|r limited to the following:",
		["EMOTE160_CMD2"] = "/flee",
		["INVTYPE_WEAPONMAINHAND"] = "Main Hand",
		["SLASH_LOGOUT1"] = "/logout",
		["SLASH_EMOTE8"] = "/me",
		["EMOTE69_CMD3"] = "/nosepick",
		["VOICEMACRO_13_Ni_2_FEMALE"] = "Till we meet again.",
		["SPELL_FAILED_TARGET_FREEFORALL"] = "Target is currently in free-for-all PvP combat",
		["PVP_RANK_4_0"] = "Dishonored",
		["VOICEMACRO_8_Dw_0_FEMALE"] = "I need healing!",
		["SLASH_PET_STAY1"] = "/petstay",
		["TUTORIAL21"] = "You can open your quest log to look at the quest by clicking on the gold chalice in the middle of the bar across the bottom of the screen.",
		["VOICEMACRO_0_Dw_1"] = "I need help!",
		["BINDING_NAME_TOGGLEPETBOOK"] = "Toggle Pet Book",
		["EMOTE131_CMD1"] = "/slap",
		["SLASH_CHAT_BAN2"] = "/ban",
		["NEWBIE_TOOLTIP_SOCIAL"] = "Information about other people in the game. You can use the Social window to manage your friends list and ignore list, as well as see who is online.",
		["ITEM_QUALITY6_DESC"] = "Artifact",
		["RESISTANCE2_NAME"] = "Fire Resistance",
		["SPELL_FAILED_TARGET_NO_POCKETS"] = "No pockets to pick",
		["CHAT_MONSTER_SAY_GET"] = "%s says: ",
		["ITEM_MOD_STAMINA"] = "%c%d Stamina",
		["EMOTE60_CMD1"] = "/kneel",
		["VOICEMACRO_6_Ta_0_FEMALE"] = "Come with me.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON4"] = "BottomRight Action Button 4",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON4"] = "Right ActionBar 2 Button 4",
		["SLASH_GUILD_DISBAND3"] = "/gdisband",
		["VOICEMACRO_18_Ni_0"] = "Congratulations.",
		["COMBAT_TEXT_SCROLL_ARC"] = "Arc",
		["VOICEMACRO_16_Hu_0"] = "Thank you.",
		["EMOTE33_CMD2"] = "/curious",
		["VOICEMACRO_8_Gn_0_FEMALE"] = "Please, heal me!",
		["BINDING_NAME_PREVIOUSACTIONPAGE"] = "Previous Action Bar",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON12"] = "BottomRight Action Button 12",
		["VOICEMACRO_6_Ni_1_FEMALE"] = "Follow me.",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON5"] = "Right ActionBar 2 Button 5",
		["GENERIC_MIN_P1"] = "%d minutes",
		["VOICEMACRO_8_Ta_1_FEMALE"] = "I need healing!",
		["VOICEMACRO_8_Tr_2_FEMALE"] = "Heal me!",
		["VOICEMACRO_LABEL_CHARGE1"] = "charge",
		["EMOTE120_CMD1"] = "/mock",
		["EMOTE40_CMD1"] = "/fart",
		["EMOTE9_CMD2"] = "/bite",
		["EMOTE118_CMD1"] = "/listen",
		["SLASH_TEAM_DEMOTE3"] = "/teamdemote",
		["SLASH_CHAT_OWNER1"] = "/owner",
		["EMOTE109_CMD1"] = "/calm",
		["BINDING_NAME_BONUSACTIONBUTTON6"] = "Secondary Action Button 6",
		["GUILD_NAME"] = "Guild Name",
		["SLASH_TRADE2"] = "/trade",
		["VOICEMACRO_3_Gn_2"] = "Retreat!",
		["GUILD_NAME_TEMPLATE"] = "Guild: %s",
		["SPELL_FAILED_NOT_TRADING"] = "Tried to enchant a trade item, but not trading",
		["EMOTE40_CMD2"] = "/fart",
		["BINDING_NAME_TOGGLEGUILDTAB"] = "Toggle Guild Pane",
		["VOICEMACRO_19_Hu_0_FEMALE"] = "You've got me all a flutter.",
		["BINDING_NAME_BONUSACTIONBUTTON1"] = "Secondary Action Button 1",
		["EMOTE138_CMD2"] = "/tease",
		["VOICEMACRO_13_Tr_0"] = "Catch you later.",
		["VOICEMACRO_15_Dw_1_FEMALE"] = "Get bent.",
		["ITEM_SET_NAME"] = "%s (%d/%d)",
		["VOICEMACRO_12_Dw_0_FEMALE"] = "Greetings.",
		["HELPFRAME_SUGGESTION_BUTTON_TEXT"] = "Send a Suggestion:",
		["SLASH_CHAT_KICK1"] = "/ckick",
		["VOICEMACRO_0_Gn_2_FEMALE"] = "I need help!",
		["VOICEMACRO_4_Hu_1"] = "Attack over here!",
		["VOICEMACRO_3_Ni_0"] = "Retreat!",
		["VOICEMACRO_17_Gn_0"] = "No problem.",
		["HELP_TICKET_ABANDON_CONFIRM"] = "Really abandon current GM ticket?",
		["VOICEMACRO_18_Gn_0_FEMALE"] = "Congratulations.",
		["KEY_NUMPAD7"] = "Num Pad 7",
		["VOICEMACRO_7_Hu_2"] = "Wait here.",
		["PVP_RANK_7_1_FEMALE"] = "Sergeant",
		["SLASH_YELL1"] = "/y",
		["VOICEMACRO_4_Gn_0"] = "Please, join my fight!",
		["KEY_INSERT_MAC"] = "Help",
		["VOICEMACRO_14_Dw_3"] = "Damn straight.",
		["EMOTE123_CMD2"] = "/lavish",
		["SLASH_WHISPER8"] = "/t",
		["VOICEMACRO_12_Gn_1"] = "Greetings.",
		["PVP_RANK_16_0_FEMALE"] = "General",
		["BINDING_NAME_RAIDTARGET2"] = "Assign Circle to Target",
		["VOICEMACRO_20_Ta_1"] = "Here's the beef.",
		["TUTORIAL_TITLE38"] = "Professions",
		["TUTORIAL47"] = "You are now waiting to join a group through a meeting stone. The meeting stone indicator is a bubble attached to the mini-map. You can click on that indicator to remove yourself from the meeting stone queue.",
		["GUILD_CREST_DESIGN"] = "Design a Guild Crest",
		["VOICEMACRO_19_Ni_1_FEMALE"] = "Sure I've got exotic piercings.",
		["KEY_PRINTSCREEN_MAC"] = "F13",
		["GUILD_CHARTER_REGISTER"] = "Register a Guild Charter",
		["EMOTE_STATE_KNEEL"] = "/kneel",
		["OPTION_TOOLTIP_REMOVE_CHAT_DELAY"] = "Check to show chat windows immediately upon mouseover.",
		["BINDING_NAME_SHAPESHIFTBUTTON2"] = "Special Action Button 2",
		["BINDING_NAME_TOGGLEWORLDMAP"] = "Toggle World Map Pane",
		["ITEM_SPELL_CHARGES"] = "%d Charge",
		["VOICEMACRO_19_Hu_5"] = "Your tag's showing.  It says, \"Made in heaven.\"",
		["BUG_CATEGORY3"] = "Dungeons",
		["EMOTE104_CMD2"] = "/whine",
		["SPELL_FAILED_NOT_IN_ARENA"] = "You can't do that in an arena.",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON1"] = "BottomLeft Action Button 1",
		["EMOTE32_CMD5"] = "/sob",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON6"] = "Right ActionBar 2 Button 6",
		["PVP_RANK_5_1"] = "Private",
		["COMBAT_RATING_NAME8"] = "Hit Rating",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON5"] = "BottomLeft Action Button 5",
		["EMOTE4_CMD4"] = "/sorry",
		["RESISTANCE_TOOLTIP_SUBTEXT"] = "Increases the ability to resist %s-based attacks, spells and abilities.\nResistance against level %d: |cffffffff%s|r",
		["VOICEMACRO_19_Sc_2"] = "If rot was hot, I'd be a volcano.",
		["FRIENDS"] = "Friends",
		["VOICEMACRO_12_Dw_1"] = "Hello.",
		["NEWBIE_TOOLTIP_SPELLBOOK"] = "To prepare a spell or ability for use, open the Spellbook & Abilities window, left-click the spell or ability and drag it down to your action bar.",
		["FRIENDS_LIST"] = "Friends List",
		["VOICEMACRO_20_Or_0_FEMALE"] = "Get between me and my food, and you'll lose a hand.",
		["BINDING_HEADER_BLANK"] = "  ",
		["VOICEMACRO_10_Hu_1_FEMALE"] = "Fire!",
		["EMOTE17_CMD1"] = "/bow",
		["EMOTE121_CMD1"] = "/ponder",
		["EMOTE62_CMD7"] = "/lay",
		["SLASH_REPLY1"] = "/r",
		["TUTORIAL11"] = "You can eat some food to regain your health faster.  Click on the food icon in the action bar across the bottom left of your screen.  Food will not work in combat, however.",
		["NEWBIE_TOOLTIP_LFGPARENT"] = "A tool to help you find a group to join or find additional players to complete your newly created or existing group.",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON11"] = "Right ActionBar 2 Button 11",
		["VOICEMACRO_1_Dw_1"] = "Heads up!",
		["TUTORIAL33"] = "You can press the spacebar to make your character jump. Jumping can help you past obstacles, and it can be particularly useful if you're having trouble getting out of the water and onto dry land.",
		["SLASH_CHANNEL4"] = "/csay",
		["GMSURVEYRATING2"] = "Poor",
		["GUILD_INFO_TEMPLATE"] = "Guild created %d-%d-%d, %d players, %d accounts",
		["VOICEMACRO_15_Tr_1_FEMALE"] = "No way.",
		["ITEM_QUALITY4_DESC"] = "Epic",
		["SPELL_TARGET_TEMPLATE"] = "Target %s",
		["GUILD_MOTD_LABEL2"] = "Guild Message of the Day",
		["BINDING_NAME_TOGGLEBATTLEFIELDMINIMAP"] = "Toggle Battle Map",
		["EMOTE94_CMD2"] = "/talk",
		["GUILD_PETITION_MEMBER_INSTRUCTIONS"] = "Click the <Sign Charter> button to become a charter member of this guild.",
		["VOICEMACRO_15_Tr_0_FEMALE"] = "No chance.",
		["SPELL_FAILED_ONLY_SHAPESHIFT"] = "Must be in %s",
		["SPELLDURABILITYDAMAGEALLSELFOTHER"] = "You cast %s on %s: all items damaged.",
		["EMOTE59_CMD2"] = "/blow",
		["EMOTE28_CMD2"] = "/cough",
		["BINDING_NAME_TURNRIGHT"] = "Turn Right",
		["EMOTE42_CMD1"] = "/flex",
		["VOICEMACRO_0_Tr_1_FEMALE"] = "Assist me!",
		["CHAT_FLAG_DND"] = "<DND>",
		["VOICEMACRO_0_Gn_0_FEMALE"] = "Can I get some help?",
		["OPTION_TOOLTIP_LOCK_ACTIONBAR"] = "Prevents the user from picking up/dragging spells on the action bar. This function can be bound to a function key in the keybindings interface.",
		["HELPFRAME_ITEM_BULLET7"] = "Requests for items",
		["ITEM_WRONG_CLASS"] = "That item can't be used by players of your class!",
		["TUTORIAL_TITLE46"] = "Raid Groups",
		["PVP_RANK_15_1_FEMALE"] = "Commander",
		["OPTION_TOOLTIP_GAMMA"] = "Controls the brightness of the game. Increase brightness until you can clearly see all 21 levels of gray bars to the right.",
		["VOICEMACRO_LABEL_FLEE2"] = "run",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON7"] = "Right Action Button 7",
		["SPELL_FAILED_TARGET_IN_COMBAT"] = "The target can't be in combat",
		["VOICEMACRO_LABEL_GOODBYE2"] = "bye",
		["SLASH_RAID5"] = "/ra",
		["HELPFRAME_CHARACTER_BULLET3"] = "Skill level is showing as negative",
		["VOICEMACRO_14_Or_2"] = "(grunt)",
		["PVP_ZONE_OBJECTIVES"] = "Show PvP Zone Objectives",
		["HELPFRAME_ENVIRONMENTAL_BULLET4"] = "Falling through the world",
		["EMOTE169_CMD2"] = "/pat",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON2"] = "Right Action Button 2",
		["VOICEMACRO_12_Hu_3"] = "Well met.",
		["GUILD_RANK3_DESC"] = "Member",
		["SPELL_CAST_TIME_MIN"] = "%.3g min cast",
		["VOICEMACRO_19_Gn_2_FEMALE"] = "Your ability to form a complete sentence is a plus.",
		["EMOTE157_CMD2"] = "/incoming",
		["EMOTE19_CMD5"] = "/goodbye",
		["SLASH_HELP1"] = "/h",
		["SPELL_FAILED_NO_EDIBLE_CORPSES"] = "There are no nearby corpses to eat",
		["GUILD_HELP_TEXT_LINE8"] = "'/gdemote <player>' demotes a player one rank within your guild",
		["VOICEMACRO_17_Gn_0_FEMALE"] = "Any time.",
		["VOICEMACRO_16_Sc_0_FEMALE"] = "Thank you.",
		["VOICEMACRO_19_Gn_2"] = "I like large posteriors, and I cannot prevaricate.",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON7"] = "BottomLeft Action Button 7",
		["CANT_AFFORD_ITEM"] = "You can't afford that.",
		["SLASH_WHISPER6"] = "/w",
		["SLASH_CHAT_HELP5"] = "/chathelp",
		["SLASH_PET_AUTOCASTOFF2"] = "/petautocastoff",
		["EMOTE62_CMD6"] = "/liedown",
		["EMOTE68_CMD2"] = "/yes",
		["GMSURVEYRATING4"] = "Good",
		["VOICEMACRO_17_Gn_1_FEMALE"] = "Anything for a friend.",
		["SPELL_FAILED_TRAINING_POINTS"] = "Not enough training points",
		["TUTORIAL15"] = "You can move spells and abilities to your action bar by opening the abilities page with the button in the bottom center of the screen and then dragging the ability icon to your action bar.  You can also use a spell or ability from the abilities page by clicking on it.",
		["VOICEMACRO_18_Or_0_FEMALE"] = "Skillfully done.",
		["TUTORIAL_TITLE11"] = "Food",
		["SLASH_RAID_WARNING2"] = "/rw",
		["VOICEMACRO_3_Dw_0_FEMALE"] = "Run away!",
		["EMOTE124_CMD2"] = "/purr",
		["HELPFRAME_NONQUEST_TEXT"] = "Issues that deal with NPCs and Creeps functioning or interacting incorrectly",
		["PVP_RATING"] = "Rating:",
		["COMBAT_RATING_NAME2"] = "Defense Rating",
		["EMOTE108_CMD2"] = "/boggle",
		["HELPFRAME_TECHNICAL_TEXT"] = "Our Technical Support team is available to help you with any technical issues that occur while you are using World of Warcraft.",
		["VOICEMACRO_12_Or_0_FEMALE"] = "Thram-ka.",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON12"] = "Right Action Button 12",
		["COMBAT_TEXT_SHOW_AURAS_TEXT"] = "Show Auras",
		["SLASH_TEAM_QUIT2"] = "/tquit",
		["CHAT_FLAG_GM"] = "<GM>",
		["VOICEMACRO_1_Hu_1_FEMALE"] = "On your guard!",
		["EMOTE52_CMD2"] = "/peon",
		["SLASH_CHAT_MODERATOR3"] = "/mod",
		["EMOTE44_CMD1"] = "/gasp",
		["SLASH_EMOTE5"] = "/e",
		["SPELL_FAILED_REQUIRES_SPELL_FOCUS"] = "Requires %s",
		["VOICEMACRO_14_Or_1"] = "Zug zug.",
		["EMOTE60_CMD3"] = "/kneel",
		["VOICEMACRO_12_Gn_0"] = "Hello.",
		["VOICEMACRO_18_Tr_2"] = "They will speak of your exploits for generations.",
		["EMOTE98_CMD4"] = "/thank",
		["SPELL_FAILED_NOPATH"] = "No path available",
		["INVTYPE_RANGEDRIGHT"] = "Ranged",
		["VOICEMACRO_0_Gn_1_FEMALE"] = "Please, help me!",
		["VOICEMACRO_20_Ta_1_FEMALE"] = "I once laughed so hard, I milked all over the floor.",
		["INVTYPE_TABARD"] = "Tabard",
		["EMOTE146_CMD1"] = "/rasp",
		["PVP_RANK_5_0_FEMALE"] = "Scout",
		["BINDING_NAME_ITUNES_PLAYPAUSE"] = "iTunes Play/Pause",
		["VOICEMACRO_20_Or_0"] = "I will crush and destroy and... ooo... shiny...",
		["VOICEMACRO_1_Ni_1_FEMALE"] = "Be alert!",
		["VOICEMACRO_16_Ni_0"] = "Thank you.",
		["BINDING_NAME_TOGGLEKEYRING"] = "Toggle Keyring",
		["EMOTE11_CMD2"] = "/blink",
		["VOICEMACRO_4_Tr_1_FEMALE"] = "This the one to fight!",
		["VOICEMACRO_5_Tr_0_FEMALE"] = "Me mana running low!",
		["NEWBIE_TOOLTIP_UNIT_PET_PAPERDOLL"] = "Information about your pet, including its statistics, spell resistances, and diet.",
		["ITEM_ENCHANT_DISCLAIMER"] = "Item will not be traded!",
		["VOICEMACRO_17_Tr_1_FEMALE"] = "My pleasure.",
		["ITEM_MIN_SKILL"] = "Requires %s (%d)",
		["EMOTE141_CMD2"] = "/snicker",
		["EMOTE57_CMD1"] = "/hug",
		["VOICEMACRO_14_Ta_2"] = "It is meant to be.",
		["PVP_TEAMSIZE"] = "(%dv%d)",
		["HELP_TEXT_LINE12"] = "- 'r' or '/r' to reply to the last tell",
		["VOICEMACRO_16_Ni_2_FEMALE"] = "You are too kind.",
		["EMOTE106_CMD2"] = "/work",
		["HELPFRAME_OTHER_BUTTON_TEXT"] = "Other Issues:",
		["OPTION_TOOLTIP_BUFFERING"] = "Enables triple buffering of frames when vertical sync is enabled. Selecting triple buffering may improve your framerate.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON3"] = "BottomRight Action Button 3",
		["PVP_RANK_8_0_FEMALE"] = "Senior Sergeant",
		["EMOTE42_CMD2"] = "/strong",
		["SLASH_CHAT_HELP2"] = "/chathelp",
		["VOICEMACRO_7_Ta_0"] = "Rest a moment.",
		["VOICEMACRO_17_Ta_0_FEMALE"] = "My pleasure.",
		["VOICEMACRO_13_Or_1"] = "Stay strong.",
		["TUTORIAL_TITLE16"] = "Reputation",
		["BINDING_NAME_TOGGLEGAMEMENU"] = "Toggle Game Menu",
		["VOICEMACRO_18_Gn_2_FEMALE"] = "Excellent.",
		["KEY_NUMPAD5"] = "Num Pad 5",
		["TUTORIAL46"] = "You have joined a raid group: a group with an increased limit of 40 members.\n\n|cffff2020While in a raid group, you will not earn credit towards most non-raid quests by killing creatures or collecting items.|r",
		["ITEM_SOCKETING"] = "Item Socketing",
		["ITEM_RESIST_ALL"] = "%c%d to All Resistances",
		["SLASH_CHAT_BAN1"] = "/ban",
		["HELPFRAME_GUILD_TEXT"] = "Any problems associated with the creation or functionality of a guild",
		["EMOTE122_CMD2"] = "/pounce",
		["SLASH_CHAT_ANNOUNCE3"] = "/announce",
		["VOICEMACRO_7_Hu_1"] = "Stay here.",
		["EMOTE45_CMD1"] = "/gaze",
		["EMOTE164_CMD1"] = "/wait",
		["VOICEMACRO_19_Hu_2_FEMALE"] = "I need a hero.",
		["BINDING_NAME_SAVEVIEW4"] = "Save View 4",
		["VOICEMACRO_19_Ni_3_FEMALE"] = "There's nothing like sleeping in the forest under the moonlight.",
		["SLASH_CHAT_CINVITE1"] = "/cinvite",
		["TUTORIAL_TITLE44"] = "Ranged Weapons",
		["EMOTE52_CMD1"] = "/grovel",
		["SPELL_FAILED_SPELL_LEARNED"] = "You have already learned the spell",
		["COMBAT_RATING_NAME5"] = "Block Rating",
		["EMOTE76_CMD1"] = "/roar",
		["GUILD_RANK0_DESC"] = "Guild Master",
		["BINDING_NAME_BONUSACTIONBUTTON10"] = "Secondary Action Button 10",
		["VOICEMACRO_19_Ni_4"] = "Wanna bring out the animal in me?",
		["SLASH_PET_PASSIVE1"] = "/petpassive",
		["TUTORIAL_TITLE20"] = "Vendors",
		["OPTION_TOOLTIP_SPELL_DETAIL"] = "Controls the detail level of spell effects.  Decrease to improve performance.",
		["EMOTE26_CMD2"] = "/congrats",
		["VOICEMACRO_2_Tr_0_FEMALE"] = "For Zul'jin!",
		["SLASH_GUILD_INFO2"] = "/guildinfo",
		["VOICEMACRO_16_Dw_1_FEMALE"] = "Ah, you're nice.",
		["VOICEMACRO_17_Ni_2_FEMALE"] = "The honor was mine.",
		["VOICEMACRO_17_Ni_1_FEMALE"] = "It was nothing.",
		["VOICEMACRO_17_Ni_1"] = "My pleasure.",
		["SLASH_SCRIPT3"] = "/script",
		["ITEM_WRONG_RACE"] = "That item can't be used by players of your race!",
		["RESISTANCE5_NAME"] = "Shadow Resistance",
		["VOICEMACRO_2_Or_2"] = "Break their bones!",
		["SPELL_FAILED_NOT_ON_TAXI"] = "You are in flight",
		["NEWBIE_TOOLTIP_UNIT_UNINVITE"] = "Removes the selected player from the group.",
		["PVP_RANK_10_0"] = "Stone Guard",
		["TUTORIAL45"] = "You cannot fire bows and guns without ammunition. To purchase ammunition, visit a gun or bow merchant in a city. To equip ammunition, right-click it.",
		["EMOTE9_CMD1"] = "/bite",
		["EMOTE18_CMD3"] = "/burp",
		["EMOTE5_CMD3"] = "/applause",
		["OPTION_TOOLTIP_MUSIC_VOLUME"] = "Adjusts the background music volume.",
		["SLASH_RAID2"] = "/raid",
		["VOICEMACRO_17_Hu_2"] = "At your service.",
		["VOICEMACRO_17_Hu_2_FEMALE"] = "You're welcome.",
		["EMOTE17_CMD2"] = "/bow",
		["ITEM_COOLDOWN_TIME_DAYS_P1"] = "Cooldown remaining: %d days",
		["BINDING_NAME_SAVEVIEW2"] = "Save View 2",
		["VOICEMACRO_3_Ni_1_FEMALE"] = "Our foe is too strong!",
		["VOICEMACRO_14_Hu_1_FEMALE"] = "Sure.",
		["VOICEMACRO_18_Or_2_FEMALE"] = "Congratulations.",
		["NEWBIE_TOOLTIP_LFMTAB"] = "Click here to look for members to add to your existing group.",
		["GUILDCONTROL_OPTION10"] = "Edit Public Note",
		["VOICEMACRO_2_Dw_1"] = "For Khaz Modan!",
		["KEY_BUTTON4"] = "Mouse Button 4",
		["CONFIRM_RESET_INSTANCES"] = "Do you really want to reset all of your instances?",
		["KEY_ESCAPE"] = "Escape",
		["VOICEMACRO_14_Tr_3"] = "I dig it.",
		["NEWBIE_TOOLTIP_HONORABLE_KILLS"] = "Each time you or a group you are part of does damage to an enemy player in PvP that is subsequently killed you gain an honorable kill.   You only get an honorable kill if the target’s difficulty is green or better (the target would give you experience if it were a monster).    Only enemy players give honorable kills.",
		["SLASH_GUILD_LEAVE4"] = "/guildquit",
		["SLASH_LOOKINGFORMORE2"] = "/lfm",
		["GUILD_NOTE_EDITLABEL"] = "Click here to set a Public Note.",
		["BINDING_HEADER_ITUNES_REMOTE"] = "iTunes Remote",
		["EMOTE126_CMD3"] = "/raise",
		["SLASH_LIST_CHANNEL3"] = "/chatinfo",
		["EMOTE147_CMD2"] = "/growl",
		["VOICEMACRO_17_Dw_1"] = "My pleasure.",
		["NEWBIE_TOOLTIP_IGNOREPLAYER"] = "Adds a player to your ignore list. You will no longer see messages or other text from players on your ignore list, nor will these players be able to communicate with you in any other way.",
		["EMOTE118_CMD2"] = "/listen",
		["EMOTE58_CMD2"] = "/food",
		["VOICEMACRO_17_Dw_0_FEMALE"] = "No problem.",
		["PVP_RANK_17_1"] = "Field Marshal",
		["VOICEMACRO_3_Sc_0"] = "Move your carcass!",
		["EMOTE78_CMD2"] = "/rude",
		["SLASH_UNIGNORE1"] = "/unignore",
		["EMOTE13_CMD4"] = "/doh",
		["VOICEMACRO_13_Hu_2_FEMALE"] = "It's been fun.",
		["SLASH_SAY1"] = "/s",
		["TRAINER_REQ_ABILITY_RED"] = "|cffff2020%s|r",
		["KEY_NUMPAD3"] = "Num Pad 3",
		["VOICEMACRO_14_Sc_2"] = "I suppose so.",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_COMBO_POINTS"] = "Shows the number of combo points you have each time you acquire a new one.",
		["SLASH_CHAT_ANNOUNCE4"] = "/ann",
		["ITEM_ENCHANT_TIME_LEFT_HOURS"] = "%s (%d hour)",
		["SPELL_FAILED_UNIT_NOT_BEHIND"] = "Target needs to be behind you",
		["OPTION_TOOLTIP_SHOW_HELM"] = "Uncheck this box to hide your character's helm.",
		["KEY_PAGEDOWN"] = "Page Down",
		["VOICEMACRO_16_Ta_2_FEMALE"] = "You are too kind.",
		["VOICEMACRO_2_Or_2_FEMALE"] = "Leave none alive!",
		["HELPFRAME_HOME_ISSUE3_HEADER"] = "PvP",
		["ITEM_MIN_LEVEL"] = "Requires Level %d",
		["EMOTE145_CMD2"] = "/smile",
		["SPELL_FAILED_TARGET_NOT_IN_INSTANCE"] = "Target must be in this instance",
		["INVTYPE_WEAPON"] = "One-Hand",
		["SLASH_CHAT_MODERATOR1"] = "/mod",
		["GUILDCONTROL_OPTION1"] = "Guildchat Listen",
		["VOICEMACRO_6_Gn_0"] = "I'll lead the way.",
		["SPELL_FAILED_NOT_MOUNTED"] = "You are mounted",
		["SLASH_TEAM_DISBAND2"] = "/tdisband",
		["SLASH_GUILD_LEAVE1"] = "/gquit",
		["ITEM_DURATION_MIN"] = "Duration: %d min",
		["VOICEMACRO_3_Ta_0_FEMALE"] = "Retreat!",
		["EMOTE71_CMD2"] = "/peer",
		["GUILD_NOTES_LABEL"] = "Player Notes:",
		["PVP_ENABLED"] = "PvP",
		["NEWBIE_TOOLTIP_XPBAR"] = "The amount of experience (XP) you have earned. The color of the XP bar indicates your rest state: light blue for Rested, and purple for Normal. Rested players earn twice the experience they would normally gain from slaying a monster. Characters become less rested when they kill monsters, and more rested by spending time at or logging out at an inn or city.",
		["VOICEMACRO_7_Gn_0"] = "Stay here for a moment.",
		["NEWBIE_TOOLTIP_UNIT_PROMOTE"] = "Surrenders your leadership of the group, naming the selected player to succeed you.",
		["EMOTE84_CMD2"] = "/shrug",
		["HELPFRAME_ACCOUNT_TEXT"] = "Having problems setting up your account or need to make changes to your billing options?",
		["EMOTE98_CMD1"] = "/thank",
		["NEWBIE_TOOLTIP_RANK"] = "Rank is the final result of all the honor system calculations.  Based upon a comparison between your standing for the week versus your current rank, your rank may either rise, fall, or stay the same.  Higher level players rise more quickly in rank (and fall more slowly) than lower level players.  In addition, rank increases more quickly at low ranks than at high ranks.",
		["VOICEMACRO_4_Dw_0_FEMALE"] = "Join my attack!",
		["COMBAT_TEXT_SHOW_COMBO_POINTS_TEXT"] = "Show Combo Points",
		["VOICEMACRO_16_Hu_2_FEMALE"] = "Much appreciated.",
		["KEY_NUMPAD6"] = "Num Pad 6",
		["EMOTE157_CMD1"] = "/incoming",
		["ITEM_MOD_CRIT_MELEE_RATING"] = "Improves melee critical strike rating by %d.",
		["BUG_CATEGORY13"] = "Miscellaneous",
		["EMOTE88_CMD1"] = "/sleep",
		["VOICEMACRO_20_Or_3"] = "I come from the Orcs.  We eat with spoons and forks.  We love to eat our pork.",
		["ITEM_MOD_HASTE_SPELL_RATING"] = "Improves spell haste rating by %d.",
		["VOICEMACRO_13_Dw_0_FEMALE"] = "So long.",
		["VOICEMACRO_19_Dw_1_FEMALE"] = "I'll have you know I can flatten steel with my thighs.",
		["BINDING_NAME_SETVIEW5"] = "Set View 5",
		["EMOTE15_CMD1"] = "/bounce",
		["KEY_BINDINGS"] = "Key Bindings",
		["HELPFRAME_QUEST_TEXT"] = "An issue that results in the inability to initiate or complete a quest",
		["VOICEMACRO_18_Ta_0"] = "Well done.",
		["EMOTE99_CMD5"] = "/threaten",
		["HELPFRAME_QUEST_BULLET1"] = "A quest related NPC or object is not functioning appropriately",
		["EMOTE114_CMD2"] = "/insult",
		["GUILDCONTROL_OPTION2"] = "Guildchat Speak",
		["SLASH_PET_ATTACK2"] = "/petattack",
		["VOICEMACRO_20_Ni_6"] = "What?  I didn't hear that.",
		["VOICEMACRO_18_Hu_1_FEMALE"] = "Excellent.",
		["EMOTE23_CMD1"] = "/chuckle",
		["NEWBIE_TOOLTIP_GUILDGROUPINVITE"] = "Invites the selected guild member to join a group.",
		["EMOTE20_CMD2"] = "/cackle",
		["EMOTE13_CMD2"] = "/doh",
		["SLASH_TRADE3"] = "/tr",
		["SPELL_FAILED_NOT_TRADEABLE"] = "You can only use this on an object you own",
		["VOICEMACRO_5_Sc_0_FEMALE"] = "I need mana!",
		["HELPFRAME_TECHNICAL_BULLET5"] = "Connection/disconnection problems",
		["VOICEMACRO_14_Ta_1"] = "I believe so.",
		["VOICEMACRO_18_Sc_2"] = "Good job.",
		["ITEM_UNSELLABLE"] = "No sell price",
		["HELPFRAME_ITEM_TEXT"] = "Issues regarding any problem dealing with item functionality or possession",
		["BINDING_NAME_MOVEBACKWARD"] = "Move Backward",
		["VOICEMACRO_6_Hu_0"] = "Follow me.",
		["CHAT_MONSTER_YELL_GET"] = "%s yells: ",
		["TUTORIAL29"] = "You will see a Breath bar pop up when your character becomes submerged in water. If you run out of breath, you will begin to drown.",
		["PVP_RANK_10_1_FEMALE"] = "Knight",
		["VOICEMACRO_15_Ta_2_FEMALE"] = "It is not meant to be.",
		["VOICEMACRO_13_Or_2_FEMALE"] = "Until next time.",
		["VOICEMACRO_15_Sc_0_FEMALE"] = "No.",
		["KEY1"] = "Key 1",
		["SLASH_CLEARTARGET2"] = "/cleartarget",
		["VOICEMACRO_19_Dw_3_FEMALE"] = "I won't fall for any bad pickup line.  You've got to try two or three, at least.",
		["NEWBIE_TOOLTIP_DISHONORABLE_KILLS"] = "Each time you assist in killing a civilian in PvP that is too low of a level to give you experience (a gray level number), you will get a dishonorable kill.   Each dishonorable kill you get immediately reduces your overall ranking slightly, and each additional dishonorable kill you get during a single day has a larger effect than the last one.   Dishonorable kills are directly applied to your ranking.",
		["HELPFRAME_OTHER_BUTTON_DESCRIPTION"] = "Any issues that require GM assistance",
		["COMBAT_TEXT_SHOW_COMBAT_STATE_TEXT"] = "Show Combat State",
		["GUILDCONTROL_OPTION11"] = "View Officer Note",
		["SLASH_SWAPACTIONBAR2"] = "/swapactionbar",
		["SLASH_GUILD_ROSTER1"] = "/groster",
		["EMOTE142_CMD1"] = "/tickle",
		["NEWBIE_TOOLTIP_BATTLEFIELDMINIMAP_OPTIONS"] = "Right-click to get a list of customizable options for this window. Left-click and drag to move the window.",
		["VOICEMACRO_15_Ni_0_FEMALE"] = "No.",
		["TUTORIAL_TITLE4"] = "Targeting",
		["NEWBIE_TOOLTIP_CHATOPTIONS"] = "Right-click to get a list of customizable options for this window. Left-click and drag to move the window.",
		["BUG_SUBMITTED"] = "Bug submitted",
		["PVP_RANK_18_0_FEMALE"] = "High Warlord",
		["NEWBIE_TOOLTIP_ENCHANTSLOT"] = "Drop an item into this slot to permit other players to unlock a container, or enchant or poison an item. An item placed in this slot will not be traded; rather, it will simply return to its owner's inventory.",
		["EMOTE46_CMD2"] = "/giggle",
		["SLASH_TRADE4"] = "/trade",
		["SPELL_FAILED_NEED_AMMO_POUCH"] = "Requires: %s",
		["EMOTE109_CMD3"] = "/calm",
		["VOICEMACRO_6_Dw_0_FEMALE"] = "I'll lead the way.",
		["GUILDCONTROL_OPTION3"] = "Officerchat Listen",
		["VOICEMACRO_20_Dw_5_FEMALE"] = "I give myself a Dutch oven pedicure every night.  I've got no foot fungus at all.  My toes are pristine.",
		["VOICEMACRO_7_Hu_0"] = "Stay put.",
		["EMOTE139_CMD1"] = "/thirsty",
		["EMOTE155_CMD1"] = "/train",
		["VOICEMACRO_13_Sc_1"] = "Have a bad day.",
		["VOICEMACRO_12_Dw_1_FEMALE"] = "Hi, there.",
		["ITEM_MOD_HIT_TAKEN_RANGED_RATING"] = "Improves ranged hit avoidance rating by %d.",
		["ITEM_COOLDOWN_TIME_HOURS_P1"] = "Cooldown remaining: %d hrs",
		["EMOTE7_CMD1"] = "/beckon",
		["NEWBIE_TOOLTIP_LATENCY"] = "The average time it takes to talk with the game server. A low latency will display as a green bar, higher latencies will be yellow or even red. Consistently high latencies may indicate a problem with your Internet connection.",
		["ERR_CANT_USE_ITEM_IN_ARENA"] = "You can't use that item in an arena.",
		["UNKNOWNOBJECT"] = "Unknown",
		["SLASH_GUILD_LEADER3"] = "/gleader",
		["VOICEMACRO_15_Gn_2"] = "I don't think so.",
		["VOICEMACRO_0_Hu_0"] = "I require aid!",
		["VOICEMACRO_18_Hu_0_FEMALE"] = "Congratulations.",
		["NEWBIE_TOOLTIP_UNIT_INSPECT"] = "Inspects any armor and weapons that the selected player has equipped.",
		["NEWBIE_TOOLTIP_WHOTAB"] = "Allows you to locate other players in the world.",
		["PVP_RANK_11_0"] = "Blood Guard",
		["SLASH_TEAM_DISBAND3"] = "/teamdisband",
		["ITEM_QUALITY0_DESC"] = "Poor",
		["EMOTE55_CMD3"] = "/yay",
		["VOICEMACRO_17_Dw_0"] = "No problem.",
		["BINDING_NAME_TARGETPARTYPET3"] = "Target Party Pet 3",
		["VOICEMACRO_0_Tr_0"] = "Help me!",
		["EMOTE112_CMD3"] = "/cuddle",
		["VOICEMACRO_6_Ni_0_FEMALE"] = "I'll lead the way.",
		["BINDING_NAME_BONUSACTIONBUTTON2"] = "Secondary Action Button 2",
		["EMOTE167_CMD2"] = "/silly",
		["VOICEMACRO_14_Ni_2_FEMALE"] = "Naturally.",
		["SLASH_LIST_CHANNEL6"] = "/chatwho",
		["EMOTE62_CMD2"] = "/liedown",
		["KEYBINDINGFRAME_MOUSEWHEEL_ERROR"] = "Can't bind mousewheel to actions with up and down states",
		["VOICEMACRO_18_Dw_2"] = "Brilliant.",
		["VOICEMACRO_17_Sc_0_FEMALE"] = "Any time.",
		["EMOTE116_CMD1"] = "/jk",
		["VOICEMACRO_14_Ni_1_FEMALE"] = "Certainly.",
		["VOICEMACRO_LABEL_WAITHERE1"] = "wait",
		["VOICEMACRO_7_Sc_1"] = "Stay here.",
		["VOICEMACRO_7_Ni_1_FEMALE"] = "Wait here.",
		["GMSURVEY_REQUEST_TEXT"] = "Please answer the following questions:",
		["BINDING_NAME_MASTERVOLUMEDOWN"] = "Master Volume Down",
		["EMOTE136_CMD3"] = "/stink",
		["OPTION_TOOLTIP_AUTO_LOOT_KEY_TEXT"] = "Key to use to auto loot a corpse",
		["OPTION_TOOLTIP_USE_RESOLUTION"] = "Changes the screen resolution of the game. Decrease to improve performance.",
		["VOICEMACRO_19_Gn_1"] = "Everyone keeps talking about beer goggles.  I can't find the plans for them anywhere.",
		["INVTYPE_LEGS"] = "Legs",
		["EMOTE153_CMD1"] = "/moo",
		["OPTION_TOOLTIP_AUTO_SELF_CAST_KEY_TEXT"] = "When held this key will allow self casting, even if an enemy is targeted.",
		["EMOTE19_CMD3"] = "/farewell",
		["EMOTE131_CMD2"] = "/slap",
		["INVTYPE_WAIST"] = "Waist",
		["RESISTANCE_TYPE3"] = "nature",
		["VOICEMACRO_7_Tr_0_FEMALE"] = "You stay here.",
		["PETTAME_UNKNOWNERROR"] = "Unknown taming error",
		["VOICEMACRO_15_Or_2"] = "(grunt)",
		["SLASH_EQUIP3"] = "/equip",
		["OPTION_TOOLTIP_CINEMATIC_SUBTITLES"] = "Enables subtitles during the intro cinematic.",
		["VOICEMACRO_20_Or_2"] = "Man, dawg, you know, it's like I'm feeling you, but I'm not feeling you, you know?",
		["SLASH_BATTLEGROUND3"] = "/bg",
		["EMOTE35_CMD1"] = "/dance",
		["ITEM_SPELL_TRIGGER_ONUSE"] = "Use:",
		["EMOTE29_CMD3"] = "/cower",
		["SLASH_UNINVITE5"] = "/u",
		["EMOTE97_CMD1"] = "/tap",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_DODGE_PARRY_MISS"] = "Shows attacks against you that dodge, parry, or miss.",
		["PVP_RANK_19_0"] = "Leader",
		["VOICEMACRO_2_Or_1"] = "Slay them all!",
		["VOICEMACRO_18_Gn_0"] = "Congratulations.",
		["HELPFRAME_GUILD_BULLET_TITLE1"] = "The following are examples of guild issues:",
		["EMOTE49_CMD3"] = "/greet",
		["EMOTE99_CMD3"] = "/threat",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_REPUTATION"] = "Shows a message when the player gains or loses reputation with a faction.",
		["TUTORIAL20"] = "Right-clicking an item in the merchant pane will buy that item if you have enough money. While the merchant pane is open, right-clicking an item in your backpack will sell the item.",
		["VOICEMACRO_3_Gn_0"] = "Run!",
		["KEY_UP"] = "Up Arrow",
		["VOICEMACRO_17_Or_0_FEMALE"] = "Any time.",
		["NEWBIE_TOOLTIP_FIRST_AVAILABLE"] = "Join the queue to enter the first available battleground. If you select \"First Available\" and another party member enters a \"First Available\" battleground, then your preference will be changed to that battleground. ",
		["OPTION_TOOLTIP_ENABLE_ERROR_SPEECH"] = "Enables speech from errors (e.g. \"Target out of range\").",
		["BUG_CATEGORY8"] = "Quests & Story",
		["VOICEMACRO_4_Or_2"] = "Shed blood with me!",
		["OPTION_TOOLTIP_ENABLE_SOUND_AT_CHARACTER"] = "Listen to sound from the character's point of view rather than the camera.",
		["PVP_RANK_7_0"] = "Sergeant",
		["HELP_TEXT_LINE7"] = "- 'z' to draw/sheathe your weapons",
		["OPTION_TOOLTIP_ENVIRONMENT_DETAIL"] = "Controls how far you can see objects. Decrease to improve performance.",
		["TUTORIAL_TITLE40"] = "The Spellbook",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON6"] = "BottomRight Action Button 6",
		["VOICEMACRO_6_Ta_0"] = "Come with me.",
		["COMBAT_RATING_NAME1"] = "Weapon Skill",
		["TUTORIAL_TITLE14"] = "Trainers",
		["HELPFRAME_BUG_BUTTON_TEXT"] = "Submit a Bug:",
		["BUG_CATEGORY7"] = "Monsters - Placement",
		["SLASH_GUILD_PROMOTE4"] = "/guildpromote",
		["HONOR_STANDING"] = "Standing",
		["SLASH_YELL6"] = "/yell",
		["SLASH_REPLY3"] = "/r",
		["VOICEMACRO_7_Tr_2"] = "Don't you be going nowhere.",
		["EMOTE10_CMD3"] = "/bleed",
		["OPTION_TOOLTIP_SCROLL_UP"] = "Scrolls combat text towards the top of the screen.",
		["GUILDMEMBER_ALERT"] = "Guild Member Alert",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON2"] = "BottomLeft Action Button 2",
		["EMOTE26_CMD4"] = "/congratulate",
		["KEY_SCROLLLOCK"] = "Scroll Lock",
		["EMOTE103_CMD1"] = "/welcome",
		["OPTION_TOOLTIP_PHONG_SHADING"] = "Enable this option for smooth lighting across characters.",
		["VOICEMACRO_4_Sc_0_FEMALE"] = "Join the slaughter!",
		["VOICEMACRO_6_Gn_1"] = "Follow me.",
		["OPTION_TOOLTIP_FULL_SCREEN_GLOW"] = "Enables a full screen effect that softens edges and lighting. Disabling this can sometimes improve performance.",
		["OPTION_TOOLTIP_SHOW_CLOAK"] = "Uncheck this box to hide your character's cloak.",
		["VOICEMACRO_6_Hu_1_FEMALE"] = "I'll lead the way.",
		["BINDING_NAME_ACTIONPAGE2"] = "Action Page 2",
		["OPTION_TOOLTIP_SHOW_MULTIBAR2"] = "Toggles an optional actionbar in the bottom right area of the screen.",
		["PVP_RANK_15_1"] = "Commander",
		["OPTION_TOOLTIP_SHOW_NPC_NAMES"] = "Always display NPC names in the game world.",
		["OPTION_TOOLTIP_SHOW_PET_MELEE_DAMAGE"] = "Show damage caused by your pet.",
		["EMOTE114_CMD1"] = "/insult",
		["OPTION_TOOLTIP_SHOW_QUEST_FADING"] = "Check this to make quest text appear instantly.",
		["SPELL_FAILED_INTERRUPTED_COMBAT"] = "Interrupted",
		["VOICEMACRO_12_Ta_1"] = "Hello.",
		["VOICEMACRO_20_Gn_4"] = "I'd like to give a shout out to my boys in Gnomeregan.  Keeping it real Big-T, Snoop-Pup, and Little Dees.  Y'all are short, but you're real, baby.",
		["OPTION_TOOLTIP_SHOW_TUTORIALS"] = "Display tutorials which help introduce you to WoW.",
		["OPTION_TOOLTIP_SHOW_UNIT_NAMES"] = "Display unit names in the game world.",
		["OPTION_TOOLTIP_SIMPLE_CHAT"] = "Sets up a main chat window and a combat log that cannot be reconfigured.",
		["BINDING_NAME_JUMP"] = "Jump",
		["HELPFRAME_GUILD_BULLET1"] = "Unable to add/remove guild members",
		["OPTION_TOOLTIP_SHOW_COMBAT_TEXT"] = "Checking this will enable additional combat messages to appear in the playfield.",
		["EMOTE59_CMD4"] = "/blow",
		["KEY2"] = "Key 2",
		["OPTION_TOOLTIP_TARGETOFTARGET_RAID"] = "Sets Target of Target to display when you are in a raid.",
		["BINDING_NAME_TOGGLERAIDTAB"] = "Toggle Raid Pane",
		["SPELL_FAILED_TARGET_AFFECTING_COMBAT"] = "Target is in combat",
		["MELEE_ATTACK_POWER"] = "Melee Attack Power",
		["OPTION_TOOLTIP_WINDOWED_MAXIMIZED"] = "Check to maximize window and remove borders.",
		["OPTION_TOOLTIP_WINDOWED_MODE"] = "Check to play in a non-fullscreen window.\n\nIf this is checked the game will use your desktop gamma and you will not be able to adjust it via the slider below.",
		["BINDING_NAME_TOGGLEWORLDSTATESCORES"] = "Toggle Score Screen",
		["EMOTE130_CMD3"] = "/shoo",
		["VOICEMACRO_12_Ni_2_FEMALE"] = "Well met.",
		["VOICEMACRO_12_Ni_1"] = "Well met.",
		["HELPFRAME_OPENTICKET_TEXT"] = "Describe Your Question:",
		["RESISTANCE_POOR"] = "Poor",
		["SLASH_GUILD_MOTD3"] = "/gmotd",
		["VOICEMACRO_12_Hu_2_FEMALE"] = "Greetings.",
		["EMOTE116_CMD2"] = "/jk",
		["GUILD_CHARTER"] = "Guild Charter",
		["EMOTE171_CMD1"] = "/mountspecial",
		["EMOTE32_CMD2"] = "/sob",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON8"] = "Right ActionBar 2 Button 8",
		["VOICEMACRO_12_Hu_0_FEMALE"] = "Hi.",
		["VOICEMACRO_LABEL_FLEE1"] = "flee",
		["VOICEMACRO_19_Sc_2_FEMALE"] = "Us Undead girls really know how to have a good time because, after all, what's the worst thing that could happen?",
		["VOICEMACRO_12_Gn_1_FEMALE"] = "Greetings.",
		["SLASH_CHAT_MUTE3"] = "/unvoice",
		["SLASH_INSPECT1"] = "/ins",
		["EMOTE55_CMD4"] = "/happy",
		["EMOTE152_CMD2"] = "/love",
		["VOICEMACRO_3_Or_0"] = "Retreat!",
		["EMOTE82_CMD2"] = "/rear",
		["EMOTE19_CMD4"] = "/bye",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON1"] = "BottomRight Action Button 1",
		["VOICEMACRO_16_Gn_2_FEMALE"] = "Much appreciated.",
		["SLASH_WHISPER9"] = "/tell",
		["OPTION_TOOLTIP_DISABLE_SPAM_FILTER"] = "Disables spam filtering on chat text.",
		["VOICEMACRO_4_Hu_0"] = "Aid my attack!",
		["SPELL_FAILED_PROSPECT_WHILE_LOOTING"] = "Cannot prospect while looting",
		["SLASH_PARTY4"] = "/party",
		["GUILD_HELP_TEXT_LINE9"] = "'/gmotd <message>' sets the guild's message of the day",
		["BINDING_NAME_MASTERVOLUMEUP"] = "Master Volume Up",
		["SLASH_CHAT_PASSWORD4"] = "/password",
		["VOICEMACRO_12_Dw_2_FEMALE"] = "How are you?",
		["RESISTANCE3_NAME"] = "Nature Resistance",
		["PVP_RANK_2_0"] = "Outlaw",
		["BINDING_NAME_SETVIEW4"] = "Set View 4",
		["BUG_CATEGORY4"] = "Cities",
		["BINDING_NAME_NAMEPLATES"] = "Show Name Plates",
		["KEY_TAB"] = "Tab",
		["ITEM_MOD_DEFENSE_SKILL_RATING"] = "Increases defense rating by %d.",
		["EMOTE92_CMD1"] = "/surprised",
		["SPELL_FAILED_PREVENTED_BY_MECHANIC"] = "Can't do that while %s",
		["VOICEMACRO_14_Sc_0_FEMALE"] = "Yes.",
		["SLASH_WHISPER4"] = "/tell",
		["TUTORIAL_TITLE17"] = "Replying to Tells",
		["SLASH_GUILD_DISBAND2"] = "/guilddisband",
		["VOICEMACRO_5_Tr_1_FEMALE"] = "I be needing more mana!",
		["VOICEMACRO_10_Ni_1_FEMALE"] = "Fire!",
		["VOICEMACRO_10_Ni_0_FEMALE"] = "Strike quickly!",
		["EMOTE117_CMD1"] = "/lick",
		["ITEM_MOD_AGILITY"] = "%c%d Agility",
		["VOICEMACRO_10_Tr_1_FEMALE"] = "Light 'em up!",
		["VOICEMACRO_14_Hu_1"] = "Sounds fine.",
		["EMOTE62_CMD3"] = "/lay",
		["VOICEMACRO_20_Tr_4_FEMALE"] = "If cannibalism be wrong, I don't want to be right.",
		["SLASH_TEAM_DISBAND1"] = "/teamdisband",
		["GMSURVEY_EXCELLENT"] = "5 (Excellent)",
		["OPTION_TOOLTIP_PET_NAMEPLATES"] = "Toggles displaying of name plates on your pets, totems, and guardians.",
		["OPTION_TOOLTIP_SHOW_DISPELLABLE_DEBUFFS"] = "Show only Debuffs that the player can dispel.  Only applies to raids.",
		["VOICEMACRO_14_Dw_1"] = "Sure.",
		["VOICEMACRO_18_Sc_1"] = "Well done.",
		["TUTORIAL14"] = "You can go to your trainer in your the starting area and learn a new skill.  You may have to search around a little to find your trainer.",
		["OPTION_TOOLTIP_VERTICAL_SYNC"] = "Synchronizes your framerate to some fraction of your monitor's refresh rate. Enable this if you see excessive screen tearing in game.",
		["VOICEMACRO_7_Dw_1_FEMALE"] = "Wait here.",
		["EMOTE59_CMD3"] = "/kiss",
		["HELPFRAME_NONQUEST_BULLET5"] = "Request for Non-Quest NPC/Creep spawn or despawn",
		["PVP_RANK_9_0"] = "First Sergeant",
		["OPTION_TOOLTIP_DEATH_EFFECT"] = "Uncheck to disable glowing effect while in ghost form. Disabling this can sometimes improve performance.",
		["EMOTE96_CMD2"] = "/question",
		["ERR_QUEST_UNKNOWN_COMPLETE"] = "Objective Complete.",
		["VOICEMACRO_17_Ta_1"] = "Always glad to help.",
		["VOICEMACRO_18_Gn_1"] = "Well done.",
		["OPTION_TOOLTIP_SOUND_VOLUME"] = "Adjusts the sound effect volume.",
		["BUG_CATEGORY9"] = "Art",
		["EMOTE55_CMD5"] = "/glad",
		["EMOTE43_CMD2"] = "/disappointed",
		["EMOTE139_CMD2"] = "/thirsty",
		["HELP_LABEL"] = "Help",
		["EMOTE137_CMD1"] = "/taunt",
		["SLASH_GUILD3"] = "/gu",
		["ITEM_MOD_DODGE_RATING"] = "Increases your dodge rating by %d.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON8"] = "BottomRight Action Button 8",
		["BINDING_NAME_TOGGLECHARACTER3"] = "Toggle Pet Pane",
		["SPELL_FAILED_NO_PET"] = "You do not have a pet",
		["EMOTE25_CMD1"] = "/confused",
		["TUTORIAL_TITLE28"] = "Swimming",
		["BUG_CATEGORY6"] = "Monsters - Balance/Abilities",
		["VOICEMACRO_19_Ta_2_FEMALE"] = "I've got big soulful eyes, long eyelashes, and a wet tongue.  What more could a guy want?",
		["GUILD_MOTD_EDITLABEL"] = "Click here to set the Guild Message Of The Day.",
		["BINDING_NAME_SAVEVIEW1"] = "Save View 1",
		["TUTORIAL_TITLE41"] = "Elite Quests",
		["KEY_UNBOUND_ERROR"] = "|cffff0000%s Function is Now Unbound!|r",
		["SPELL_FAILED_EQUIPPED_ITEM"] = "Must have the proper item equipped",
		["SLASH_REMOVEFRIEND1"] = "/removefriend",
		["VOICEMACRO_20_Or_1"] = "It's not easy being green.",
		["TUTORIAL34"] = "You have completed your first quest! To collect your reward, you should return to the character who gave you the quest. When you complete a quest, you can see the corresponding quest giver on your minimap, provided you are nearby.",
		["VOICEMACRO_1_Tr_0_FEMALE"] = "There be danger!",
		["VOICEMACRO_19_Dw_3"] = "You look pretty.  I like your hair.  Here's your drink.  Are you ready now?",
		["SLASH_TARGET_LAST_TARGET2"] = "/targetlasttarget",
		["GUILDCONTROL_OPTION13"] = "Modify Guild Info",
		["SLASH_IGNORE2"] = "/ignore",
		["VOICEMACRO_15_Ta_1"] = "I don't think so.",
		["EMOTE144_CMD1"] = "/violin",
		["BINDING_HEADER_TARGETING"] = "Targeting Functions",
		["SLASH_LOOKINGFORGROUP2"] = "/lfg",
		["VOICEMACRO_20_Dw_5"] = "I like my beer like I like my women; stout and bitter.",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_RESISTANCES"] = "Shows when you resist taking damage from attacks or spells.",
		["EMOTE11_CMD1"] = "/blink",
		["VOICEMACRO_8_Dw_2"] = "Heal me!",
		["VOICEMACRO_10_Hu_0"] = "Fire at will!",
		["BUG_CATEGORY14"] = "Player vs. Player",
		["EMOTE120_CMD2"] = "/mock",
		["BINDING_NAME_SHAPESHIFTBUTTON1"] = "Special Action Button 1",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_FRIENDLY_NAMES"] = "Shows the name of a friendly caster when they cast a heal spell on you.",
		["HELPFRAME_ENVIRONMENTAL_BULLET_TITLE1"] = "The following are examples of a Environmental issues:",
		["BINDING_NAME_RESETVIEW3"] = "Reset View 3",
		["TUTORIAL8"] = "An item went into your backpack. You can click on the backpack button in the lower right part of the screen to open your backpack.  Move the mouse over the item to see what it is.",
		["EMOTE30_CMD1"] = "/crack",
		["SLASH_CHAT_PASSWORD1"] = "/password",
		["SPELL_FAILED_NOTHING_TO_STEAL"] = "Nothing to steal",
		["ITEM_QUALITY3_DESC"] = "Rare",
		["EMOTE27_CMD1"] = "/unused",
		["INVTYPE_CHEST"] = "Chest",
		["BINDING_NAME_ACTIONBUTTON5"] = "Action Button 5",
		["NEWBIE_TOOLTIP_PVPFFA"] = "You can now attack and be attacked by any player in the game.",
		["EMOTE15_CMD2"] = "/bounce",
		["VOICEMACRO_19_Ta_1_FEMALE"] = "I want a man with soft hands.  Preferably four of them.",
		["RESISTANCE4_NAME"] = "Frost Resistance",
		["EMOTE63_CMD1"] = "/massage",
		["EMOTE74_CMD2"] = "/poke",
		["HELPFRAME_ENVIRONMENTAL_TITLE"] = "Environmental",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON12"] = "BottomLeft Action Button 12",
		["GUILDREMOVERANK_BUTTON_TOOLTIP"] = "Click to remove this rank",
		["SPELL_FAILED_EQUIPPED_ITEM_CLASS_OFFHAND"] = "Must have a %s equipped in the offhand",
		["GUILD_INFO_EDITLABEL"] = "Click here to set message",
		["VOICEMACRO_5_Gn_1_FEMALE"] = "I'm short on mana!",
		["EMOTE93_CMD2"] = "/surrender",
		["VOICEMACRO_15_Ta_0_FEMALE"] = "No.",
		["OPTION_TOOLTIP_ENABLE_ALL_SOUND"] = "Enables or disables all game sound.",
		["VOICEMACRO_14_Gn_0"] = "Sure.",
		["VOICEMACRO_3_Dw_0"] = "Run away!",
		["VOICEMACRO_19_Or_5"] = "Um, you look like a lady.",
		["SLASH_JOIN1"] = "/join",
		["OPTION_TOOLTIP_INVERT_MOUSE"] = "Invert the way that the mouse affects camera pitch.",
		["VOICEMACRO_0_Dw_1_FEMALE"] = "I need help!",
		["SLASH_TIME2"] = "/time",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON4"] = "Right Action Button 4",
		["TUTORIAL_TITLE9"] = "Using Items",
		["OPTION_TOOLTIP_AUTO_QUEST_WATCH"] = "Quests are automatically watched for 5 minutes when you achieve a quest objective.",
		["BINDING_NAME_TARGETLASTTARGET"] = "Target Last Target",
		["VOICEMACRO_12_Dw_2"] = "Greetings.",
		["TUTORIAL44"] = "You have obtained a ranged weapon. To use it, equip it, and then open up your spellbook and drag the Shoot or Throw ability into your Action Bar.",
		["GUILDADDRANK_BUTTON_TOOLTIP"] = "Click to add rank",
		["EMOTE67_CMD1"] = "/no",
		["VOICEMACRO_19_Or_4"] = "Lady, from the moment I see you I... I did not expect to get this far.",
		["VOICEMACRO_0_Tr_1"] = "Assist me!",
		["SPELL_FAILED_WRONG_PET_FOOD"] = "Your pet doesn't like that food",
		["VOICEMACRO_3_Sc_1"] = "Turn back!",
		["OPTION_TOOLTIP_CAMERA_ALWAYS"] = "Set the camera to always prefer being behind your character.",
		["PVP_FLAG"] = "Player vs. Player",
		["EMOTE162_CMD2"] = "/oom",
		["SLASH_DUEL_CANCEL2"] = "/concede",
		["EMOTE106_CMD1"] = "/work",
		["VOICEMACRO_17_Ta_1_FEMALE"] = "Always glad to help.",
		["ITEM_STARTS_QUEST"] = "This Item Begins a Quest",
		["BINDING_NAME_ACTIONBUTTON11"] = "Action Button 11",
		["VOICEMACRO_6_Ta_1_FEMALE"] = "Follow my trail.",
		["PVP_MEDAL3"] = "Thane of Ironforge",
		["HELPFRAME_NONQUEST_BULLET4"] = "Vendor NPC not itemized or not responding",
		["OPTION_TOOLTIP_TARGETOFTARGET5"] = "Sets Target of Target to always display.",
		["VOICEMACRO_17_Ni_0_FEMALE"] = "My pleasure.",
		["TUTORIAL38"] = "Your character can learn up to two professions which will allow you to find or create items of value. To learn more about professions ask a guard in a major city for directions to the profession trainers.",
		["INVTYPE_BODY"] = "Shirt",
		["ITEM_UNIQUE_EQUIPPABLE"] = "Unique-Equipped",
		["PVP_RANK_0_1_FEMALE"] = "Private",
		["EMOTE98_CMD6"] = "/ty",
		["EMOTE38_CMD6"] = "/feast",
		["VOICEMACRO_19_Ta_1"] = "Hey, you into leather?",
		["VOICEMACRO_14_Dw_0"] = "Yes.",
		["TUTORIAL_TITLE6"] = "Spells and Abilities",
		["EMOTE21_CMD2"] = "/cheer",
		["VOICEMACRO_1_Sc_0"] = "Danger!",
		["EMOTE5_CMD4"] = "/applaud",
		["BINDING_NAME_RAIDTARGETNONE"] = "Clear raid target icon",
		["VOICEMACRO_20_Dw_3"] = "I don't have a drinking problem.  I drink, I get drunk, I fall down, no problem.",
		["SLASH_CHAT_MODERATOR4"] = "/moderator",
		["EMOTE71_CMD1"] = "/peer",
		["GUILD_HELP_TEXT_LINE6"] = "'/gremove <player>' removes a player from your guild",
		["VOICEMACRO_LABEL_FOLLOWME1"] = "followme",
		["PVP_MEDAL7"] = "Avenger of Gnomeregan",
		["SLASH_GUILD_INFO3"] = "/ginfo",
		["HELPFRAME_ITEM_TITLE"] = "Item",
		["VOICEMACRO_20_Ta_0"] = "Mess with the bull, you get the horns.",
		["ADDON_UNKNOWN_ERROR"] = "Unknown load problem",
		["PVP_RANK_13_1_FEMALE"] = "Knight-Champion",
		["TUTORIAL16"] = "You can look at your reputation with different groups in the world in the character pane under the reputation tab.",
		["PVP_RANK_14_1_FEMALE"] = "Lieutenant Commander",
		["BINDING_NAME_TOGGLEACTIONBARLOCK"] = "Toggle ActionBar Lock",
		["EMOTE58_CMD3"] = "/hungry",
		["VOICEMACRO_19_Tr_1"] = "We Trolls mate for life.  'Course, we believe in frequent reincarnation.",
		["PVP_RANK_11_1"] = "Knight-Lieutenant",
		["SLASH_WHO2"] = "/who",
		["SPELL_CAST_TIME_INSTANT_NO_MANA"] = "Instant",
		["VOICEMACRO_13_Or_1_FEMALE"] = "May you always be victorious.",
		["VOICEMACRO_17_Ta_0"] = "It was nothing.",
		["PVP_RANK_17_0_FEMALE"] = "Warlord",
		["BINDING_NAME_ACTIONPAGE4"] = "Action Page 4",
		["VOICEMACRO_15_Ni_1"] = "I don't think so.",
		["NEWBIE_TOOLTIP_ADDMEMBER"] = "Adds a new player to the guild.",
		["VOICEMACRO_20_Or_5"] = "Stop poking me!  Well, that was okay.",
		["EMOTE148_CMD1"] = "/bark",
		["PVP_RANK_4_1"] = "Dishonored",
		["EMOTE127_CMD4"] = "/rdy",
		["EMOTE132_CMD2"] = "/smirk",
		["VOICEMACRO_18_Ta_2_FEMALE"] = "Fate smiles upon you.",
		["EMOTE102_CMD2"] = "/wave",
		["ITEM_MOD_INTELLECT"] = "%c%d Intellect",
		["EMOTE88_CMD2"] = "/sleep",
		["VOICEMACRO_19_Ta_0"] = "You move me.",
		["PVP_RANK_19_0_FEMALE"] = "Leader",
		["VOICEMACRO_LABEL_HEALME1"] = "heal",
		["OPTION_TOOLTIP_SHOW_PLAYER_NAMES"] = "Always display player names in the game world.",
		["SPELL_FAILED_REAGENTS"] = "Missing reagent: %s",
		["VOICEMACRO_7_Ta_0_FEMALE"] = "Rest your haunches.",
		["PVP_RANK_3_0"] = "Exiled",
		["PVP_RANK_3_1"] = "Exiled",
		["PVP_RANK_4_0_FEMALE"] = "Dishonored",
		["VOICEMACRO_8_Hu_0"] = "I need healing!",
		["BINDING_NAME_TARGETNEARESTFRIEND"] = "Target Nearest Friend",
		["PVP_RANK_14_0_FEMALE"] = "Champion",
		["HELPFRAME_CHARACTER_TITLE"] = "Character",
		["GMSURVEYRATING1"] = "Bad",
		["VOICEMACRO_12_Hu_1"] = "Good tidings.",
		["EMOTE32_CMD3"] = "/weep",
		["EMOTE94_CMD1"] = "/talk",
		["VOICEMACRO_15_Sc_1"] = "Not on your life.",
		["VOICEMACRO_16_Ta_1"] = "How kind of you.",
		["VOICEMACRO_2_Or_0_FEMALE"] = "Attack!",
		["EMOTE65_CMD1"] = "/moon",
		["SPELL_FAILED_ONLY_DAYTIME"] = "Can only use during the day",
		["CHAT_MONSTER_WHISPER_GET"] = "%s whispers: ",
		["SLASH_EMOTE2"] = "/em",
		["PVP_RANK_6_0_FEMALE"] = "Grunt",
		["PVP_RANK_6_1"] = "Corporal",
		["SLASH_COMBATLOG2"] = "/combatlog",
		["VOICEMACRO_12_Ta_1_FEMALE"] = "Hello.",
		["TUTORIAL_TITLE42"] = "Welcome to World of Warcraft!",
		["VOICEMACRO_17_Ta_2_FEMALE"] = "You are welcome.",
		["PVP_RANK_8_0"] = "Senior Sergeant",
		["EMOTE81_CMD1"] = "/sexy",
		["VOICEMACRO_15_Dw_2"] = "No way.",
		["ITEM_MOD_HIT_MELEE_RATING"] = "Improves melee hit rating by %d.",
		["EMOTE18_CMD2"] = "/belch",
		["VOICEMACRO_3_Sc_1_FEMALE"] = "Move your carcass!",
		["PVP_RANK_8_1"] = "Master Sergeant",
		["EMOTE34_CMD1"] = "/curtsey",
		["KEY_NUMPADMINUS"] = "Num Pad -",
		["BAG_CANT_STACK"] = "This item cannot stack.",
		["EMOTE49_CMD1"] = "/greet",
		["PVP_REQUIRED_FOR_CAPTURE"] = "You must be flagged for PvP in order to help capture this objective.",
		["EMOTE42_CMD4"] = "/strong",
		["TUTORIAL35"] = "You have clicked a flight master who trains flying beasts to carry passengers from one location to another. For a minimal fee, you can swiftly travel to other flight masters that you have interacted with in the past. When you discover a new city, finding the flight master will allow you to return easily in the future.",
		["COMBAT_TEXT_SHOW_RESISTANCES_TEXT"] = "Show Damage Reduction",
		["VOICEMACRO_13_Or_0"] = "Until our paths cross again.",
		["TUTORIAL50"] = "You now have a keyring to hold your dungeon keys. This keyring appears to the left of your bags on your action bar. The keyring can only store permanent keys.",
		["SPELL_FAILED_MAINHAND_EMPTY"] = "Your weapon hand is empty",
		["VOICEMACRO_1_Dw_1_FEMALE"] = "Heads up!",
		["SLASH_REPLY2"] = "/reply",
		["SPELL_FAILED_NOT_ON_SHAPESHIFT"] = "Cannot be cast on shapeshifted target.",
		["BINDING_NAME_SETVIEW1"] = "Set View 1",
		["PVP_RANK_14_1"] = "Lieutenant Commander",
		["EMOTE64_CMD2"] = "/moan",
		["VOICEMACRO_0_Ni_2"] = "Assist me!",
		["EMOTE56_CMD2"] = "/hi",
		["SPELL_FAILED_INTERRUPTED"] = "Interrupted",
		["EMOTE41_CMD1"] = "/fidget",
		["VOICEMACRO_13_Sc_0_FEMALE"] = "Goodbye.",
		["VOICEMACRO_1_Ta_1_FEMALE"] = "On your guard!",
		["VOICEMACRO_16_Sc_1"] = "Gee, thanks.",
		["VOICEMACRO_13_Sc_0"] = "Goodbye.",
		["OPTION_TOOLTIP_HEAD_BOB"] = "Simulate head bobbing when in first-person perspective.",
		["EMOTE36_CMD1"] = "/drink",
		["VOICEMACRO_20_Ta_4"] = "Moo.  Are you happy now?",
		["VOICEMACRO_16_Or_2"] = "Thank you.",
		["VOICEMACRO_16_Dw_0_FEMALE"] = "Thank you.",
		["SPELL_FAILED_DISENCHANT_WHILE_LOOTING"] = "Cannot disenchant while looting",
		["ITEM_PROSPECTABLE"] = "Prospectable",
		["PVP_TOGGLE_OFF_VERBOSE"] = "You will be unflagged for PvP combat after five minutes of non-PvP action in friendly territory.",
		["VOICEMACRO_19_Sc_4_FEMALE"] = "I don't care that much about romance.  I fell in love before, and look what happened to me.",
		["VOICEMACRO_18_Hu_2"] = "Wonderful.",
		["PVP_TOGGLE_ON_VERBOSE"] = "You are now flagged for PvP combat and will remain so until toggled off.",
		["SPELL_FAILED_CANT_STEALTH"] = "You are too close to enemies",
		["SPELL_FAILED_ALREADY_OPEN"] = "Already open",
		["SPELL_FAILED_ALREADY_HAVE_CHARM"] = "You already control a charmed creature",
		["TUTORIAL17"] = "You can respond to that player by hitting the R key and then typing a message, or by typing /tell <theirname> and then the message.",
		["EMOTE12_CMD2"] = "/blush",
		["EMOTE75_CMD2"] = "/pray",
		["VOICEMACRO_18_Gn_1_FEMALE"] = "Way to go.",
		["SLASH_QUIT3"] = "/quit",
		["EMOTE128_CMD1"] = "/shimmy",
		["OPTION_TOOLTIP_SECURE_ABILITY_TOGGLE"] = "When selected you will be protected from toggling your abilities off if accidently hitting the button more than once in a short period of time.",
		["GUILD_ROSTER_TEMPLATE"] = "%d players, %d accounts",
		["INVTYPE_HOLDABLE"] = "Held In Off-hand",
		["VOICEMACRO_20_Hu_4"] = "A guy walked up to me and said, \"I'm a teepee, I'm a wigwam, I'm a teepee, I'm a wigwam.\"  I said, \"Relax, man, you're too tense.\"",
		["KEY_BACKSPACE"] = "Backspace",
		["KEY_NUMPAD1"] = "Num Pad 1",
		["TUTORIAL_TITLE25"] = "Death",
		["HELPFRAME_TECHNICAL_BULLET_TITLE1"] = "The following are examples of Technical issues:",
		["SLASH_WHO1"] = "/who",
		["VOICEMACRO_17_Hu_0"] = "Always glad to help.",
		["VOICEMACRO_17_Hu_1_FEMALE"] = "Anytime.",
		["OPTION_TOOLTIP_STATUS_BAR"] = "Always display the text on XP, health, mana, rage, energy, or happiness status bars.",
		["SLASH_UNINVITE1"] = "/u",
		["SLASH_UNINVITE8"] = "/kick",
		["BINDING_NAME_TOGGLEBAG3"] = "Toggle Bag 3",
		["GENERIC_SEC"] = "%d second",
		["VOICEMACRO_15_Gn_1_FEMALE"] = "Not on your life.",
		["KEY_PAUSE"] = "Pause",
		["TUTORIAL43"] = "An NPC with a gray '!' over its head has a quest that you are too low level to accept. Check back once you gain a few levels.",
		["EMOTE26_CMD1"] = "/congratulate",
		["SLASH_STARTATTACK2"] = "/startattack",
		["EMOTE98_CMD2"] = "/thanks",
		["VOICEMACRO_1_Or_1_FEMALE"] = "Incoming!",
		["EMOTE103_CMD2"] = "/welcome",
		["TUTORIAL_TITLE19"] = "Players",
		["SLASH_SAVEGUILDROSTER1"] = "/saveguildroster",
		["VOICEMACRO_17_Ni_2"] = "The honor was mine.",
		["VOICEMACRO_2_Gn_1"] = "Attack!",
		["BINDING_NAME_ITUNES_NEXTTRACK"] = "iTunes Next Track",
		["VOICEMACRO_7_Or_0"] = "Remain here.",
		["EMOTE50_CMD5"] = "/wicked",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON8"] = "Right Action Button 8",
		["EMOTE165_CMD1"] = "/flirt",
		["PVP_MEDAL6"] = "Chieftain of Thunderbluff",
		["GUILDCONTROL_OPTION9"] = "Set MOTD",
		["ITEM_WRAPPED_BY"] = "|cff00ff00<Gift from %s>|r",
		["BINDING_NAME_COMBATLOGPAGEUP"] = "Combat Log Page Up",
		["VOICEMACRO_1_Hu_1"] = "On your guard!",
		["PVP_POLICY_URL"] = "|cffffd200http://www.worldofwarcraft.com/policy/pvp.shtml|r",
		["HELPFRAME_GUILD_BUTTON_TEXT"] = "Report Guild Issue",
		["CONFIRM_GUILD_LEAVE"] = "Really leave %s?",
		["PVP_RANK_19_1"] = "Leader",
		["VOICEMACRO_20_Ni_1"] = "You know those Ancient Protectors in Darnassas?  They're not that old.",
		["VOICEMACRO_12_Sc_0"] = "Hello.",
		["SLASH_PET_AUTOCASTOFF1"] = "/petautocastoff",
		["OPTION_TOOLTIP_LOCALE"] = "Select which language you would like to play in.",
		["GUILD_CHARTER_CREATOR"] = "Guild Master: %s",
		["HELPFRAME_ACCOUNT_BUTTON_TEXT"] = "Report Account/Billing Issue",
		["SLASH_CHAT_KICK2"] = "/ckick",
		["SPELL_FAILED_ONLY_STEALTHED"] = "You must be in stealth mode",
		["EMOTE136_CMD4"] = "/smell",
		["SLASH_CHAT_UNMUTE6"] = "/voice",
		["TUTORIAL48"] = "You are now in a queue to enter a battleground.  You may check your status by mousing over the icon on your minimap.",
		["GMSURVEYRATING5"] = "Excellent",
		["SLASH_PROMOTE1"] = "/pr",
		["VOICEMACRO_15_Ni_2"] = "Absolutely not.",
		["ITEM_REQ_SKILL"] = "Requires %s",
		["VOICEMACRO_7_Tr_2_FEMALE"] = "Don't you be going nowhere.",
		["SLASH_PLAYED2"] = "/played",
		["VOICEMACRO_12_Ta_0_FEMALE"] = "Hi.",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON10"] = "BottomLeft Action Button 10",
		["VOICEMACRO_20_Gn_2_FEMALE"] = "You know, squirrels can be deadly when cornered.",
		["INVTYPE_CLOAK"] = "Back",
		["NEWBIE_TOOLTIP_REMOVEFRIEND"] = "Removes the selected player from your friends list.",
		["BINDING_NAME_RESETVIEW2"] = "Reset View 2",
		["HELPFRAME_TECHNICAL_BULLET2"] = "Display errors (black boxes, flickering objects, distortions, etc)",
		["SPELL_FAILED_TRANSFORM_UNUSABLE"] = "You can't use the new item",
		["VOICEMACRO_17_Or_1"] = "Honor required it.",
		["SLASH_PET_DEFENSIVE2"] = "/petdefensive",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_AURA_FADE"] = "Shows a message when an aura fades from the player.",
		["VOICEMACRO_5_Sc_0"] = "My mana is drained!",
		["VOICEMACRO_13_Or_2"] = "May your blade be true.",
		["BUG_CATEGORY_CHOOSE"] = "--> Please Choose a Category",
		["EMOTE43_CMD1"] = "/frown",
		["EMOTE3_CMD3"] = "/angry",
		["VOICEMACRO_20_Gn_1"] = "I think that last vendor short changed me.  Oh, that was a bad one.",
		["SLASH_STOPCASTING1"] = "/stopcasting",
		["KEYRING"] = "Keyring",
		["BINDING_NAME_ITUNES_VOLUMEUP"] = "iTunes Volume Up",
		["SLASH_CLEARTARGET1"] = "/cleartarget",
		["VOICEMACRO_3_Ni_1"] = "Scatter!",
		["KEY_BACKSLASH"] = "\\",
		["HELP_TEXT_LINE3"] = "- To group/inspect/trade: target another player, right click their portrait",
		["BINDING_NAME_TOGGLEBAG2"] = "Toggle Bag 2",
		["VOICEMACRO_20_Gn_2"] = "I do hope to find some interesting gadgets around here.  I do love tinkering with things.",
		["PVP_RANK_2_1"] = "Outlaw",
		["NEWBIE_TOOLTIP_UNIT_GROUP_LOOT"] = "Under group loot rules, players take turns looting just like in round-robin with the exception that all group members will be eligible to roll for items over the loot threshold.",
		["VOICEMACRO_6_Or_1_FEMALE"] = "Come.",
		["HELPFRAME_GUILD_BULLET3"] = "Unable to reassign or rename ranks within the guild",
		["VOICEMACRO_16_Or_2_FEMALE"] = "Thanks.",
		["VOICEMACRO_17_Tr_1"] = "Any time, man.",
		["VOICEMACRO_18_Dw_2_FEMALE"] = "Oh, that's great.",
		["BINDING_NAME_RAIDTARGET6"] = "Assign Square to Target",
		["SLASH_FRIENDS4"] = "/friend",
		["VOICEMACRO_14_Ni_1"] = "Of course.",
		["EMOTE67_CMD2"] = "/no",
		["SLASH_EQUIP1"] = "/equip",
		["BUG_CATEGORY2"] = "Outdoor Zones",
		["SPELL_FAILED_CASTER_AURASTATE"] = "You can't do that yet",
		["PVP_RANK_12_1"] = "Knight-Captain",
		["EMOTE54_CMD1"] = "/hail",
		["SLASH_LOGOUT4"] = "/camp",
		["VOICEMACRO_19_Dw_1"] = "You'd like to run your hands through my beard, wouldn't you?",
		["SLASH_GUILD_DEMOTE1"] = "/gdemote",
		["BUG_CATEGORY12"] = "Tradeskills",
		["TUTORIAL25"] = "You are now a ghost.  You can return to life by either finding your corpse or talking to a nearby spirit healer.  Your corpse shows up as an icon in the minimap at the upper right hand portion of the screen.",
		["KEY_NUMLOCK"] = "Num Lock",
		["SLASH_INVITE6"] = "/invite",
		["BINDING_NAME_TOGGLECHARACTER2"] = "Toggle Reputation Pane",
		["EMOTE43_CMD4"] = "/frown",
		["OPTION_TOOLTIP_CLICK_CAMERA2"] = "Sets the camera to always be aligned with your character when changing direction with click-to-move.",
		["VOICEMACRO_16_Tr_2"] = "I owe you one.",
		["SLASH_INVITE1"] = "/i",
		["VOICEMACRO_2_Ta_0_FEMALE"] = "For Kalimdor!",
		["EMOTE147_CMD1"] = "/growl",
		["VOICEMACRO_15_Dw_0_FEMALE"] = "No.",
		["RESILIENCE_TOOLTIP"] = "Decreases chance of enemy scoring a critical hit on you by %.2f%%.\nReduces damage taken from critical strikes by %.2f%%.",
		["RESISTANCE0_NAME"] = "Armor",
		["EMOTE70_CMD2"] = "/panic",
		["VOICEMACRO_7_Tr_1_FEMALE"] = "Stay put.",
		["EMOTE56_CMD4"] = "/hi",
		["SLASH_RAID4"] = "/rsay",
		["SLASH_FOLLOW1"] = "/f",
		["SLASH_GUILD_UNINVITE1"] = "/gremove",
		["BUG_CATEGORY11"] = "Items",
		["EMOTE135_CMD1"] = "/soothe",
		["SLASH_CHAT_UNMODERATOR4"] = "/unmoderator",
		["SLASH_VOICEMACRO2"] = "/v",
		["VOICEMACRO_8_Tr_2"] = "I be in a bad way.",
		["SLASH_ASSIST3"] = "/a",
		["HELPFRAME_GENERAL_BUTTON_TEXT"] = "General Game Play Question:",
		["HELPFRAME_TECHNICAL_TITLE"] = "Technical Support",
		["EMOTE159_CMD2"] = "/charge",
		["NEWBIE_TOOLTIP_LFGTAB"] = "Click here to look for a group that meets your search criteria.",
		["EMOTE2_CMD1"] = "/amaze",
		["NEWBIE_TOOLTIP_PLAYEROPTIONS"] = "Right-click to bring up special commands for interacting with another player. You can inspect their equipment, issue a party invite, initiate a trade, or challenge a player to a duel. A group leader can promote or remove that player from the group.",
		["RESISTANCE_TYPE1"] = "holy",
		["NEWBIE_TOOLTIP_PROMOTE"] = "Promotes the selected player one rank higher.",
		["VOICEMACRO_5_Gn_0"] = "I need some mana!",
		["MELEE_ATTACK"] = "Melee Attack",
		["PVP_RANK_6_0"] = "Grunt",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON9"] = "Right ActionBar 2 Button 9",
		["EMOTE12_CMD1"] = "/blush",
		["SLASH_CHAT_MUTE1"] = "/mute",
		["EMOTE169_CMD1"] = "/pat",
		["SLASH_EQUIP4"] = "/eq",
		["EMOTE69_CMD1"] = "/nosepick",
		["ITEM_QUALITY5_DESC"] = "Legendary",
		["VOICEMACRO_20_Sc_4_FEMALE"] = "You know, once you're dead, nothing smells bad anymore.  Rotten eggs?  No problem.  Dead fish?  Like a spring breeze.",
		["HELPFRAME_ITEM_BULLET6"] = "Inquiries about how to obtain an item",
		["SPELL_FAILED_NOTHING_TO_DISPEL"] = "Nothing to dispel",
		["SPELL_FAILED_NO_CHARGES_REMAIN"] = "No charges remain",
		["BINDING_HEADER_CHAT"] = "Chat Functions",
		["BINDING_NAME_ACTIONBUTTON10"] = "Action Button 10",
		["EMOTE83_CMD1"] = "/shout",
		["TUTORIAL_TITLE2"] = "Movement",
		["HELPFRAME_ITEM_BULLET_TITLE2"] = "The following are NOT considered item issues:",
		["VOICEMACRO_15_Sc_2_FEMALE"] = "I don't think so.",
		["SLASH_HELP6"] = "/help",
		["CONFIRM_BUY_BANK_SLOT"] = "Do you want to purchase a bank slot for:",
		["EMOTE47_CMD2"] = "/glare",
		["VOICEMACRO_19_Or_0"] = "That armor looks good on you.  It would also look good on my floor.",
		["VOICEMACRO_13_Tr_2"] = "Smell you later.",
		["COMBAT_TEXT_SHOW_AURA_FADE_TEXT"] = "Show Fading Auras",
		["EMOTE112_CMD4"] = "/spoon",
		["INVTYPE_SHIELD"] = "Off Hand",
		["SLASH_GUILD_ROSTER4"] = "/guildroster",
		["VOICEMACRO_LABEL_OUTOFMANA2"] = "outofmana",
		["PVP_RANK_16_1"] = "Marshal",
		["BINDING_NAME_TOGGLELFGTAB"] = "Toggle LFG Pane",
		["VOICEMACRO_16_Tr_2_FEMALE"] = "I owe you one.",
		["SLASH_FOLLOW6"] = "/fol",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON10"] = "Right Action Button 10",
		["ITEM_RACES_ALLOWED"] = "Races: %s",
		["BINDING_NAME_SHAPESHIFTBUTTON7"] = "Special Action Button 7",
		["TUTORIAL_TITLE49"] = "Port to Battleground",
		["VOICEMACRO_17_Sc_0"] = "Any time.",
		["GUILDMOTD_BUTTON_TOOLTIP"] = "Click to View the Guild Message Of The Day",
		["NEWBIE_TOOLTIP_ALLIANCE"] = "A proud member of the Alliance, opposed to members of the Horde (Orcs, Trolls, Tauren, Undead, Blood Elves).",
		["OPTION_TOOLTIP_PROFANITY_FILTER"] = "Enable profanity filtering.",
		["SLASH_CHAT_UNMODERATOR2"] = "/unmoderator",
		["BINDING_NAME_MINIMAPZOOMIN"] = "Minimap Zoom In",
		["HELPFRAME_HOME_BUTTON_TEXT"] = "Issues that GMs can assist with",
		["SLASH_CHAT_UNBAN1"] = "/unban",
		["PVP_RANK_12_0_FEMALE"] = "Legionnaire",
		["SLASH_QUIT4"] = "/exit",
		["VOICEMACRO_12_Ta_0"] = "Hi.",
		["EMOTE126_CMD2"] = "/volunteer",
		["VOICEMACRO_19_Ni_0"] = "You're an Emerald Dream come true.",
		["SLASH_GUILD_PROMOTE2"] = "/guildpromote",
		["EMOTE125_CMD1"] = "/puzzled",
		["EMOTE19_CMD2"] = "/goodbye",
		["EMOTE80_CMD1"] = "/scratch",
		["SPELL_FAILED_CHARMED"] = "Can't do that while charmed",
		["EMOTE82_CMD1"] = "/shake",
		["ITEM_MOD_PARRY_RATING"] = "Increases your parry rating by %d.",
		["VOICEMACRO_14_Or_0_FEMALE"] = "D'abu.",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON2"] = "Right ActionBar 2 Button 2",
		["VOICEMACRO_20_Ta_0_FEMALE"] = "In my native tongue, my name means Dances with Tassels.",
		["NEWBIE_TOOLTIP_WORLDMAP"] = "As you explore a zone, more areas of interest will become visible on the world map. You can use left-click to zoom in, or right-click to zoom out.",
		["EMOTE31_CMD2"] = "/cringe",
		["SLASH_SCRIPT1"] = "/script",
		["EMOTE105_CMD1"] = "/whistle",
		["EMOTE167_CMD1"] = "/silly",
		["SPELL_FAILED_IMMUNE"] = "Immune",
		["EMOTE61_CMD3"] = "/laugh",
		["SPELL_FAILED_NOT_FISHABLE"] = "Your cast didn't land in fishable water",
		["EMOTE162_CMD1"] = "/oom",
		["TUTORIAL13"] = "You can learn a new talent in the talent interface.  Open the talents page by clicking the pulsing talent button on your action bar.",
		["SLASH_CHANNEL2"] = "/csay",
		["EMOTE58_CMD1"] = "/hungry",
		["VOICEMACRO_14_Or_1_FEMALE"] = "Zug zug.",
		["SPELL_FAILED_BAD_TARGETS"] = "Invalid target",
		["EMOTE25_CMD2"] = "/confused",
		["SLASH_BENCHMARK1"] = "/benchmark",
		["SLASH_CHAT_ANNOUNCE1"] = "/announce",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_AURAS"] = "Shows a message when the player gains an aura.",
		["VOICEMACRO_15_Or_2_FEMALE"] = "(grunt)",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON7"] = "Right ActionBar 2 Button 7",
		["EMOTE127_CMD2"] = "/rdy",
		["CONFIRM_LEAVE_QUEUE"] = "Are you sure you would like to leave the meeting stone queue?",
		["BINDING_NAME_BONUSACTIONBUTTON9"] = "Secondary Action Button 9",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON12"] = "Right ActionBar 2 Button 12",
		["NEWBIE_TOOLTIP_RANK_POSITION"] = "Your position within the rank. This bar will tell you how close you are to attaining the next rank or falling to the previous rank. This will only be updated each week when ranking is updated.",
		["HELPFRAME_CHARACTER_BULLET2"] = "Unable to log in to World of Warcraft",
		["VOICEMACRO_8_Sc_1"] = "Heal me!",
		["VOICEMACRO_20_Gn_0"] = "You know, I really wish I had a garden where I could put a couple of human statues.",
		["KEY_SCROLLLOCK_MAC"] = "F14",
		["EMOTE32_CMD6"] = "/weep",
		["HELP_TEXT_LINE10"] = "- '1' or 't' to attack current target (selects nearest enemy if no current target)",
		["VOICEMACRO_12_Or_1"] = "Hey.",
		["EMOTE79_CMD2"] = "/salute",
		["VOICEMACRO_20_Ta_3"] = "You know, Taurens are born hunters.  You ever see a Tauren catch a salmon out of a stream?  It really is quite exciting.  And, have you ever seen a Tauren stalk a python?  'Course you haven't.  That's because Taurens are so adept at blending in with their surroundings.",
		["NEWBIE_TOOLTIP_UNIT_LOOT_THRESHOLD"] = "Items of this quality or higher will be able to be rolled on by the group when looted from a monster.",
		["EMOTE164_CMD2"] = "/wait",
		["HELPFRAME_TECHNICAL_BULLET4"] = "Sound issues (no sound or music, static, looping effects, etc)",
		["SLASH_GUILD_LEADER2"] = "/guildleader",
		["EMOTE149_CMD2"] = "/pity",
		["VOICEMACRO_13_Gn_3_FEMALE"] = "I'll always treasure our time together.",
		["SPELL_FAILED_ITEM_NOT_FOUND"] = "Tried to enchant an item that didn't exist",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON2"] = "BottomRight Action Button 2",
		["PVP_RANK_17_0"] = "Warlord",
		["RESISTANCE_GOOD"] = "Good",
		["VOICEMACRO_15_Tr_1"] = "No way.",
		["EMOTE14_CMD2"] = "/bored",
		["SPELL_FAILED_SPELL_UNAVAILABLE"] = "The spell is not available to you",
		["VOICEMACRO_14_Gn_2_FEMALE"] = "Indubitably.",
		["HELPFRAME_STUCK_BUTTON_TEXT"] = "Stuck:",
		["HELP_TEXT_LINE1"] = "WoW help:",
		["ITEM_SET_BONUS_GRAY"] = "(%d) Set: %s",
		["EMOTE145_CMD1"] = "/smile",
		["SPELL_FAILED_TARGET_IS_PLAYER"] = "Can't target players",
		["KEY_PAUSE_MAC"] = "F15",
		["INVTYPE_THROWN"] = "Thrown",
		["VOICEMACRO_LABEL_TRAIN1"] = "train",
		["EMOTE143_CMD2"] = "/stand",
		["ITEM_SPELL_TRIGGER_ONEQUIP"] = "Equip:",
		["EMOTE49_CMD2"] = "/greetings",
		["BINDING_HEADER_CAMERA"] = "Camera Functions",
		["HELPFRAME_QUEST_BUTTON_TEXT"] = "Report Quest/NPC Issue",
		["VOICEMACRO_18_Tr_0_FEMALE"] = "Good job.",
		["SLASH_BATTLEGROUND4"] = "/battleground",
		["SPELL_FAILED_SILENCED"] = "Can't do that while silenced",
		["PVP_RANK_1_0"] = "Pariah",
		["SLASH_PROMOTE4"] = "/promote",
		["VOICEMACRO_20_Tr_1"] = "I like my women dumpy and droopy with halitosis.",
		["EMOTE19_CMD6"] = "/farewell",
		["SLASH_CAST4"] = "/spell",
		["EMOTE8_CMD2"] = "/beg",
		["SPELL_FAILED_LOW_CASTLEVEL"] = "Skill not high enough",
		["SLASH_GUILD_PROMOTE1"] = "/gpromote",
		["OPTION_TOOLTIP_MULTISAMPLING"] = "Increase multisampling to smooth out model edges.",
		["EMOTE7_CMD2"] = "/beckon",
		["DURABILITYDAMAGE_DEATH"] = "Your equipped items suffer a 10%% durability loss.",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON11"] = "Right Action Button 11",
		["SLASH_CHATLOG1"] = "/chatlog",
		["SLASH_CHATLOG2"] = "/chatlog",
		["BINDING_NAME_BONUSACTIONBUTTON7"] = "Secondary Action Button 7",
		["BINDING_NAME_TARGETPET"] = "Target Pet",
		["BINDING_NAME_ACTIONBUTTON2"] = "Action Button 2",
		["EMOTE100_CMD2"] = "/tired",
		["VOICEMACRO_1_Or_2"] = "On your guard!",
		["EMOTE50_CMD2"] = "/wicked",
		["SLASH_CHAT_CINVITE3"] = "/cinvite",
		["SLASH_CHAT_HELP1"] = "/chat",
		["EMOTE52_CMD3"] = "/grovel",
		["GUILD_TITLE_TEMPLATE"] = "%s of %s",
		["VOICEMACRO_18_Sc_0_FEMALE"] = "Congratulations.",
		["EMOTE132_CMD1"] = "/smirk",
		["EMOTE68_CMD3"] = "/nod",
		["SLASH_READYCHECK1"] = "/readycheck",
		["HELPFRAME_ENVIRONMENTAL_BULLET2"] = "Able to walk/jump through a wall",
		["SECURE_ABILITY_TOGGLE"] = "Secure Ability Toggle",
		["SLASH_CHAT_MODERATE1"] = "/moderate",
		["BINDING_NAME_CHATPAGEDOWN"] = "Chat Page Down",
		["VOICEMACRO_0_Ni_1"] = "To my side!",
		["SLASH_CHAT_MUTE5"] = "/squelch",
		["VOICEMACRO_18_Or_0"] = "You should be proud.",
		["SLASH_CHAT_MUTE6"] = "/unvoice",
		["BINDING_NAME_RESETVIEW4"] = "Reset View 4",
		["SLASH_CHAT_OWNER2"] = "/owner",
		["BINDING_NAME_RAIDTARGET8"] = "Assign Skull to Target",
		["EMOTE39_CMD2"] = "/eye",
		["VOICEMACRO_10_Gn_1_FEMALE"] = "Fire now!",
		["SLASH_CHAT_PASSWORD3"] = "/password",
		["SLASH_CHAT_PASSWORD2"] = "/pass",
		["VOICEMACRO_12_Sc_0_FEMALE"] = "Hello.",
		["OPTION_TOOLTIP_AUTO_LOOT_ALT_KEY"] = "Use the \"ALT\" key to Loot when \"Auto Loot Corpse\" is checked, and to Auto Loot when it is not.",
		["OPTION_TOOLTIP_TARGETOFTARGET3"] = "Sets Target of Target to display when solo.",
		["VOICEMACRO_8_Tr_0_FEMALE"] = "I be in a bad way!",
		["VOICEMACRO_20_Dw_0_FEMALE"] = "No, they're not real, but thanks for noticing.",
		["BINDING_NAME_ITUNES_BACKTRACK"] = "iTunes Back Track",
		["SLASH_CHAT_UNMODERATOR1"] = "/unmod",
		["EMOTE26_CMD6"] = "/cong",
		["SLASH_CHAT_UNMUTE3"] = "/voice",
		["BINDING_NAME_TARGETPARTYPET2"] = "Target Party Pet 2",
		["HELP_TEXT_LINE5"] = "- 'Shift-1 through Shift-6' to access extra action bars.  Shift up/down and Shift-mousewheel also work.",
		["EMOTE109_CMD2"] = "/calm",
		["VOICEMACRO_19_Ta_2"] = "Free rides for the ladies.",
		["ITEM_MOD_STRENGTH"] = "%c%d Strength",
		["VOICEMACRO_13_Ni_1_FEMALE"] = "I wish you well.",
		["VOICEMACRO_3_Ni_0_FEMALE"] = "Run!",
		["HELP_TICKET_EDIT_ABANDON"] = "You currently have an open ticket. Please choose an option.",
		["SPELL_FAILED_AFFECTING_COMBAT"] = "You are in combat",
		["EMOTE30_CMD4"] = "/knuckles",
		["VOICEMACRO_7_Hu_1_FEMALE"] = "Stay here.",
		["VOICEMACRO_18_Sc_2_FEMALE"] = "Well, aren't you lucky.",
		["KEY_NUMPADDECIMAL"] = "Num Pad .",
		["VOICEMACRO_1_Or_0_FEMALE"] = "On your guard!",
		["EMOTE29_CMD1"] = "/cower",
		["VOICEMACRO_19_Sc_3_FEMALE"] = "I can't wait to suck the juice out of your eyeballs.",
		["BINDING_NAME_ACTIONPAGE5"] = "Action Page 5",
		["VOICEMACRO_3_Or_1_FEMALE"] = "Run!",
		["HELPFRAME_QUEST_BULLET4"] = "Request for Quest NPC/Creep information",
		["VOICEMACRO_2_Ni_0"] = "For Cenarius!",
		["CHAT_CHANNEL_OWNER_NOTICE"] = "[%s] Channel owner is %s.",
		["VOICEMACRO_7_Sc_0"] = "Wait.",
		["SLASH_LIST_CHANNEL7"] = "/chatinfo",
		["EMOTE113_CMD1"] = "/duck",
		["EMOTE107_CMD1"] = "/yawn",
		["SLASH_TARGET_NEAREST_FRIEND1"] = "/targetfriend",
		["HELPFRAME_ACCOUNT_BULLET4"] = "Payment options",
		["SLASH_RANDOM2"] = "/rand",
		["NEWBIE_TOOLTIP_SHAREQUEST"] = "Shares the selected quest with any nearby party members who are eligible for the quest. Certain quests, such as those granted by items, cannot be shared.",
		["SLASH_UNINVITE3"] = "/kick",
		["GUILD_MEMBER_OPTIONS"] = "Guild Member Options",
		["VOICEMACRO_18_Ta_1"] = "You are worthy.",
		["VOICEMACRO_13_Ta_1_FEMALE"] = "Goodbye.",
		["EMOTE171_CMD2"] = "/mountspecial",
		["OPTION_TOOLTIP_CLICKCAMERA_LOCKED"] = "Sets the camera to always be aligned with your character when changing direction with click-to-move.",
		["VOICEMACRO_18_Tr_0"] = "Good job.",
		["SLASH_DUEL_CANCEL6"] = "/forfeit",
		["EMOTE31_CMD1"] = "/cringe",
		["TUTORIAL51"] = "You can find groups using the group search interface. This is accessed from the eye button in the middle of your action bar or by using the 'I' key.",
		["SLASH_EMOTE1"] = "/e",
		["RESISTANCE_TYPE0"] = "armor",
		["VOICEMACRO_8_Sc_1_FEMALE"] = "Bind my wounds!",
		["ITEM_COOLDOWN_TIME_HOURS"] = "Cooldown remaining: %d hour",
		["ABILITYBOOK_BUTTON"] = "Abilities",
		["OPTION_TOOLTIP_LOOT_KEY_TEXT"] = "Key to use to single loot a corpse",
		["EMOTE160_CMD1"] = "/flee",
		["EMOTE36_CMD2"] = "/shindig",
		["VOICEMACRO_18_Sc_1_FEMALE"] = "It's always somebody else.",
		["SLASH_LOGOUT3"] = "/logout",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON6"] = "BottomLeft Action Button 6",
		["SLASH_EQUIP_TO_SLOT1"] = "/equipslot",
		["EMOTE161_CMD1"] = "/attacktarget",
		["SLASH_FOCUS1"] = "/focus",
		["SLASH_GUILD_PROMOTE3"] = "/gpromote",
		["SLASH_FOCUS2"] = "/focus",
		["SLASH_FRIENDS3"] = "/friends",
		["KEY_NUMPADMULTIPLY"] = "Num Pad *",
		["SLASH_GUILD_WHO6"] = "/whoguild",
		["EMOTE52_CMD4"] = "/peon",
		["SLASH_GUILD8"] = "/guild",
		["ITEM_MOD_SPIRIT"] = "%c%d Spirit",
		["SLASH_GUILD1"] = "/g",
		["SLASH_GUILD5"] = "/g",
		["EMOTE156_CMD2"] = "/helpme",
		["SLASH_YELL8"] = "/shout",
		["SLASH_GUILD2"] = "/gc",
		["SLASH_CHAT_UNMODERATOR3"] = "/unmod",
		["VOICEMACRO_LABEL_THANKYOU2"] = "thanks",
		["VOICEMACRO_8_Ni_0"] = "Heal me!",
		["SLASH_GUILD_DEMOTE3"] = "/gdemote",
		["BINDING_NAME_TARGETLASTHOSTILE"] = "Target Last Hostile",
		["SLASH_GUILD_DISBAND1"] = "/gdisband",
		["SLASH_GUILD_HELP3"] = "/guildhelp",
		["BINDING_NAME_TARGETSELF"] = "Target Self",
		["GUILD_HELP_TEXT_LINE4"] = "'/o <message>' sends a chat message to all officers in your guild",
		["ITEM_LEVEL_AND_MIN"] = "Level %d (min %d)",
		["SLASH_GUILD_HELP4"] = "/guildhelp",
		["EMOTE22_CMD5"] = "/flap",
		["SLASH_GUILD_INFO1"] = "/ginfo",
		["VOICEMACRO_19_Or_3"] = "I love you like a fat kid loves cake.",
		["SLASH_GUILD_INVITE4"] = "/guildinvite",
		["SLASH_GUILD_MOTD4"] = "/guildmotd",
		["SLASH_GUILD_MOTD1"] = "/gmotd",
		["BINDING_NAME_REPLY2"] = "Re-Whisper",
		["PVP_RANK_0_0"] = "Scout",
		["BINDING_NAME_TARGETFOCUS"] = "Target Focus",
		["EMOTE91_CMD1"] = "/stare",
		["VOICEMACRO_14_Or_3"] = "Yes.",
		["PVP_RANK_11_0_FEMALE"] = "Blood Guard",
		["VOICEMACRO_4_Ta_1"] = "Join my fight!",
		["VOICEMACRO_LABEL_HELLO1"] = "hello",
		["EMOTE166_CMD2"] = "/healme",
		["SLASH_GUILD_UNINVITE4"] = "/guildremove",
		["EMOTE51_CMD1"] = "/groan",
		["VOICEMACRO_12_Or_2_FEMALE"] = "Greetings.",
		["SLASH_PLAYED1"] = "/played",
		["SLASH_GUILD_UNINVITE2"] = "/guildremove",
		["OPTION_TOOLTIP_AUTO_LOOT_CTRL_KEY"] = "Use the \"CTRL\" key to Loot when \"Auto Loot Corpse\" is checked, and to Auto Loot when it is not.",
		["EMOTE34_CMD2"] = "/curtsey",
		["VOICEMACRO_17_Or_1_FEMALE"] = "Anything for a friend.",
		["BINDING_HEADER_MISC"] = "Miscellaneous Functions",
		["EMOTE10_CMD2"] = "/blood",
		["SLASH_HELP5"] = "/h",
		["VOICEMACRO_19_Sc_1"] = "You have beautiful skin; no maggot holes at all.",
		["ITEM_MOD_HIT_TAKEN_RATING"] = "Improves hit avoidance rating by %d.",
		["OPTION_TOOLTIP_HIDE_PARTY_INTERFACE"] = "Click this to hide your party's portraits and health bars.",
		["VOICEMACRO_16_Dw_2"] = "Ah, you're nice.",
		["VOICEMACRO_20_Ni_0"] = "Last night I went to an awesome stag party.",
		["VOICEMACRO_20_Hu_3_FEMALE"] = "I like to fart in the tub.",
		["EMOTE165_CMD2"] = "/flirt",
		["COMBAT_TEXT_SHOW_REPUTATION_TEXT"] = "Show Reputation",
		["VOICEMACRO_19_Tr_3"] = "I hope you're well rested.  You're going to need your strength.",
		["VOICEMACRO_7_Gn_1"] = "Wait here, please.",
		["SLASH_JOIN4"] = "/join",
		["OPTION_TOOLTIP_CLICKCAMERA_NEVER"] = "Sets the camera to not move when changing direction with click-to-move.",
		["SLASH_LEAVE6"] = "/chatleave",
		["VOICEMACRO_2_Hu_1"] = "To battle!",
		["KEY_NUMPAD0"] = "Num Pad 0",
		["VOICEMACRO_13_Sc_2"] = "Stay optimistic.",
		["SLASH_LEAVE5"] = "/leave",
		["HELPFRAME_ENVIRONMENTAL_BUTTON_TEXT"] = "Report Environmental Issue",
		["ITEM_PURCHASED_COLON"] = "Item Purchased:",
		["SLASH_RAID_INFO2"] = "/raidinfo",
		["VOICEMACRO_2_Ni_0_FEMALE"] = "By Elune!",
		["EMOTE35_CMD2"] = "/dance",
		["SLASH_LOOT_FFA1"] = "/ffa",
		["SLASH_LOOT_FFA2"] = "/ffa",
		["SLASH_LOOT_MASTER2"] = "/master",
		["SLASH_LOOT_MASTER1"] = "/master",
		["SLASH_MACROHELP1"] = "/macrohelp",
		["HELPFRAME_ACCOUNT_BULLET3"] = "Problems with Authentication Keys",
		["ITEM_MOD_HASTE_RATING"] = "Improves haste rating by %d.",
		["VOICEMACRO_5_Dw_0"] = "I've got no mana!",
		["NEWBIE_TOOLTIP_CHARACTER"] = "Information about your character, including equipment, statistics, skills, and reputation.",
		["SLASH_PET_ATTACK1"] = "/petattack",
		["PVP_RANK_3_0_FEMALE"] = "Exiled",
		["HELPFRAME_TECHNICAL_BULLET_TITLE2"] = "You may find that a solution for your issue has already been posted on the Technical Support Forum, located on the World of Warcraft site at:\n\nwww.worldofwarcraft.com\n\nIf your technical issue is not addressed by the solutions posted there, please contact our Technical Support Department:\n\nBy Phone at:  (949) 955-1382\nBy Web at:  www.blizzard.com/support/wow\nBy Email at:  wowtech@blizzard.com",
		["VOICEMACRO_20_Sc_0_FEMALE"] = "I'd paint my toenails, but I'm not sure where they fell off.",
		["BINDING_NAME_ITUNES_VOLUMEDOWN"] = "iTunes Volume Down",
		["SPELL_FAILED_SPELL_UNAVAILABLE_PET"] = "That ability is not available to your pet",
		["HELPFRAME_ENVIRONMENTAL_BULLET1"] = "Unable to interact with a forge",
		["SLASH_PET_AUTOCASTON1"] = "/petautocaston",
		["SLASH_PET_AUTOCASTON2"] = "/petautocaston",
		["VOICEMACRO_3_Or_0_FEMALE"] = "Retreat!",
		["VOICEMACRO_4_Tr_0"] = "Strike this foe!",
		["HELPFRAME_ENVIRONMENTAL_BULLET5"] = "Player died and would like a port back to original location",
		["EMOTE87_CMD2"] = "/sit",
		["VOICEMACRO_15_Sc_1_FEMALE"] = "Not on your life.",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_LOW_HEALTH_MANA"] = "Shows a message when you fall below 20% mana or health.",
		["BINDING_NAME_RAIDTARGET5"] = "Assign Moon to Target",
		["BINDING_NAME_SETVIEW2"] = "Set View 2",
		["VOICEMACRO_16_Gn_0"] = "Thank you.",
		["SLASH_CANCELAURA1"] = "/cancelaura",
		["NEWBIE_TOOLTIP_UNIT_MASTER_LOOTER"] = "Under master-looter rules, the group leader is the only group member allowed to loot items at or above the threshold. Items below threshold and money are distributed via the round robin rules.",
		["SLASH_TEAM_DISBAND4"] = "/tdisband",
		["PVP_RANK_17_1_FEMALE"] = "Field Marshal",
		["SLASH_PROMOTE2"] = "/promote",
		["SLASH_PVP1"] = "/pvp",
		["SLASH_PET_STAY2"] = "/petstay",
		["HELPFRAME_TECHNICAL_BULLET3"] = "Cinematics or in-game movies not playing correctly",
		["SLASH_RAID6"] = "/rsay",
		["HELPFRAME_NONQUEST_BUTTON_TEXT"] = "Report Non-Quest NPC/Creep Issue",
		["EMOTE99_CMD7"] = "/threat",
		["SLASH_CLEARFOCUS1"] = "/clearfocus",
		["HELPFRAME_QUEST_TITLE"] = "Quest/Quest NPC",
		["SLASH_CHAT_HELP4"] = "/chat",
		["EMOTE6_CMD2"] = "/bashful",
		["EMOTE73_CMD2"] = "/point",
		["SLASH_REMOVEFRIEND3"] = "/removefriend",
		["SLASH_REPLY4"] = "/reply",
		["VOICEMACRO_1_Dw_0"] = "Danger approaching!",
		["VOICEMACRO_16_Hu_2"] = "How kind of you.",
		["VOICEMACRO_5_Sc_1"] = "I need mana!",
		["OPTION_TOOLTIP_SHOW_TARGET_CASTBAR_IN_V_KEY"] = "If the Name Plate is displayed for your current target, show the enemy cast bar with the target's health bar in the game field.",
		["EMOTE112_CMD2"] = "/spoon",
		["SPELL_FAILED_NO_COMBO_POINTS"] = "That ability requires combo points",
		["PVP_RANK_LEADER"] = "Leader",
		["SLASH_STARTATTACK1"] = "/startattack",
		["COMBAT_RATING_NAME4"] = "Parry Rating",
		["VOICEMACRO_14_Tr_2"] = "I be feeling you.",
		["SLASH_CAST1"] = "/cast",
		["HELPFRAME_HOME_ISSUE3"] = "Most PVP issues can be resolved through the PVP game mechanics. GM's will not be able to assist in many cases.  The exceptions to this rule are any behaviors that fall under the World of Warcraft Harassment Policy.  For special rules designated for PvP activity, please go to:",
		["SLASH_TARGET1"] = "/target",
		["SPELL_FAILED_TOO_SHALLOW"] = "Water too shallow",
		["SLASH_STOPCASTING2"] = "/stopcasting",
		["SLASH_TARGET_LAST_TARGET1"] = "/targetlasttarget",
		["VOICEMACRO_20_Sc_3_FEMALE"] = "This stinks.",
		["OPTION_TOOLTIP_TARGETOFTARGET4"] = "Sets Target of Target to display when you are in a raid or a party.",
		["SLASH_TEAM_DEMOTE4"] = "/tdemote",
		["SLASH_UNIGNORE2"] = "/unignore",
		["SLASH_UNINVITE6"] = "/un",
		["VOICEMACRO_14_Gn_2"] = "Indubitably.",
		["TUTORIAL_TITLE31"] = "Hearthstones",
		["GUILD_HELP_TEXT_LINE5"] = "'/ginvite <player>' invites another player to join your guild",
		["KEY_NUMPAD9"] = "Num Pad 9",
		["SLASH_UNINVITE2"] = "/un",
		["HELP_TEXT_LINE13"] = "- /who to get a list of players",
		["EMOTE155_CMD2"] = "/train",
		["VOICEMACRO_6_Tr_1_FEMALE"] = "You go with me.",
		["ITEM_SET_BONUS"] = "Set: %s",
		["SLASH_USE2"] = "/use",
		["SLASH_USERANDOM1"] = "/userandom",
		["SLASH_WHISPER5"] = "/send",
		["VOICEMACRO_20_Dw_6"] = "Oh, I'm just a social drinker.  Every time someone says, \"I'll have a drink\", I say, \"So shall I.\"",
		["SLASH_WHISPER1"] = "/w",
		["VOICEMACRO_16_Or_1"] = "I won't forget this.",
		["SLASH_YELL7"] = "/sh",
		["VOICEMACRO_3_Dw_2"] = "Run!",
		["NEWBIE_TOOLTIP_ADDFRIEND"] = "Adds a player to your friends list. You will be notified whenever a friend logs on or off. Other players do not know whether they are on your friends list.",
		["VOICEMACRO_LABEL_AID1"] = "aid",
		["GUILD_RANK4_DESC"] = "Initiate",
		["VOICEMACRO_16_Sc_1_FEMALE"] = "Gee, thanks.",
		["OPTION_TOOLTIP_TARGETOFTARGET_ALWAYS"] = "Sets Target of Target to always display.",
		["SPELLDURABILITYDAMAGEOTHEROTHER"] = "%s casts %s on %s: %s damaged.",
		["SPELL_CAST_TIME_RANGED"] = "Attack speed +%.3g sec",
		["VOICEMACRO_19_Hu_1"] = "If I said you had a good body, would you hold it against me?",
		["GUILD_MESSAGE"] = "Guild Chat",
		["SLASH_GUILD_ROSTER2"] = "/guildroster",
		["OPTION_TOOLTIP_SHOW_NEWBIE_TIPS"] = "Show detailed information about various user interface elements.  Advanced players may want to turn this off.",
		["BINDING_NAME_TOGGLECHARACTER1"] = "Toggle Skill Pane",
		["NEWBIE_TOOLTIP_GUILD_MEMBER_OPTIONS"] = "Right-click a guild member for more options.",
		["VOICEMACRO_16_Ta_0"] = "How generous.",
		["KEY_NUMPAD4"] = "Num Pad 4",
		["EMOTE129_CMD2"] = "/shiver",
		["SLASH_TARGET2"] = "/tar",
		["EMOTE61_CMD4"] = "/lol",
		["OPTION_TOOLTIP_SHOW_LOOT_SPAM"] = "Uncheck this to hide individual loot roll messages and only show the winner.",
		["EMOTE22_CMD1"] = "/chicken",
		["SLASH_EQUIP2"] = "/eq",
		["SPELL_FAILED_ONLY_BATTLEGROUNDS"] = "Can only use in battlegrounds",
		["HELPFRAME_ITEM_BULLET_TITLE1"] = "The following are examples of item issues:",
		["SLASH_CHAT_UNBAN2"] = "/unban",
		["EMOTE13_CMD3"] = "/bonk",
		["BINDING_NAME_SCREENSHOT"] = "Screen Shot",
		["HELPFRAME_STUCK_TEXT1"] = "If you find yourself stuck and unable to move, please try the auto-unstuck feature prior to petitioning a GM. In most cases, this should solve the problem. Activating the auto-unstuck command will first attempt to use your hearthstone to port you back to your inn. If this is not possible, it will attempt to nudge your character out of position.\n\nPlease note this option can only be used every 5 minutes. Using the auto-unstuck option will log your character and location so that we can verify and fix the location in the future.",
		["VOICEMACRO_14_Ni_2"] = "Naturally.",
		["PVP_RANK_15_0_FEMALE"] = "Lieutenant General",
		["SPELL_FAILED_NOT_BEHIND"] = "You must be behind your target",
		["OPTION_TOOLTIP_CHAT_BUBBLES"] = "Shows /say and /yell text in speech bubbles above characters' heads.",
		["EMOTE98_CMD5"] = "/thanks",
		["VOICEMACRO_20_Hu_5"] = "So, I have this idea for a great movie.  It's about two Gnomes who find a bracelet of power, and they have to take it to the Burning Steppes and cast it into The Cauldron.  They form the Brotherhood of the Bracelet.  Along the way, they're trailed by a murloc named Gottom who's obsessed with the bracelet, and nine bracelet bogeymen.  It could be a three parter called \"Ruler of the Bracelet\".  The first part would be called \"The Brotherhood of the Bracelet\", followed by \"A Couple of Towers\", with the climactic ending called \"Hey, the King's Back\".",
		["BINDING_NAME_TOGGLESPELLBOOK"] = "Toggle Spellbook",
		["SPELL_FAILED_EQUIPPED_ITEM_CLASS_MAINHAND"] = "Must have a %s equipped in the main hand",
		["SPELL_SKILL_LINE"] = "%s",
		["SHOW_PARTY_BACKGROUND_TEXT"] = "Show Party Background",
		["SLASH_TARGET4"] = "/tar",
		["VOICEMACRO_LABEL_FLIRT1"] = "flirt",
		["SLASH_USE1"] = "/use",
		["SPELL_FAILED_HIGHLEVEL"] = "Target is too high level",
		["OPTION_TOOLTIP_FOLLOW_TERRAIN"] = "Automatically change the camera angle based on the terrain. If your character climbs a slope, the camera will rotate upwards; if you descend, it will rotate downwards.",
		["VOICEMACRO_19_Or_2"] = "You have six different smiles; one for when you're angry, one for when you tear flesh, one for when you chew flesh, one for when you loot bodies, one for when you skin game, and one for when you want to kill something.",
		["VOICEMACRO_2_Tr_1_FEMALE"] = "We bring the pain to them!",
		["VOICEMACRO_14_Hu_0_FEMALE"] = "Yes.",
		["SPELL_FAILED_LEVEL_REQUIREMENT"] = "You are not high enough level",
		["EMOTE10_CMD4"] = "/blood",
		["SPELL_FAILED_MIN_SKILL"] = "Your skill is not high enough.  Requires %s (%d).",
		["SPELL_FAILED_MOVING"] = "Can't do that while moving",
		["EMOTE14_CMD1"] = "/bored",
		["VOICEMACRO_0_Hu_1"] = "Aid me!",
		["BINDING_NAME_STRAFELEFT"] = "Strafe Left",
		["SPELL_FAILED_CASTER_DEAD"] = "You are dead",
		["SPELL_FAILED_NOT_IN_CONTROL"] = "You are not in control of your actions",
		["SLASH_TEAM_DEMOTE2"] = "/tdemote",
		["VOICEMACRO_2_Ta_1"] = "Unleash your fury!",
		["SPELL_FAILED_NOT_ON_DAMAGE_IMMUNE"] = "Spell cannot be cast on a damage immune target.",
		["TUTORIAL9"] = "Right click on items to use them.  You can drag usable items to your action bar if you want to be able to use it without opening your backpack.",
		["VOICEMACRO_4_Ta_1_FEMALE"] = "Join my fight!",
		["CHAT_FLAG_AFK"] = "<AFK>",
		["SPELL_FAILED_NOT_ON_STEALTHED"] = "Spell cannot be cast on stealted target.",
		["ITEM_SPELL_EFFECT"] = "Effect: %s",
		["SPELL_FAILED_NOT_ON_TRANSPORT"] = "You are on a transport",
		["EMOTE81_CMD2"] = "/sexy",
		["SPELL_FAILED_NOT_WHILE_GHOST"] = "Can't cast as ghost",
		["SPELL_FAILED_NO_CHAMPION"] = "You haven't selected a champion",
		["PVP_MEDAL5"] = "Deathlord of the Undercity",
		["SPELL_FAILED_NO_ENDURANCE"] = "Not enough endurance",
		["TUTORIAL_TITLE27"] = "Fatigue",
		["SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED"] = "Can't use items while shapeshifted",
		["SPELL_FAILED_NO_MOUNTS_ALLOWED"] = "You can't mount here",
		["COMBAT_TEXT_SHOW_FRIENDLY_NAMES_TEXT"] = "Show Friendly Healer Names",
		["EMOTE22_CMD4"] = "/chicken",
		["SPELL_FAILED_ONLY_INDOORS"] = "Can only use indoors",
		["GUILD_PETITION_LEADER_INSTRUCTIONS"] = "Select a player you wish to invite and click <request signature>.   To create this guild, turn it in to the guild registrar when you have filled the charter.",
		["VOICEMACRO_12_Ni_3_FEMALE"] = "Hi.",
		["SPELL_FAILED_ONLY_OUTDOORS"] = "Can only use outside",
		["VOICEMACRO_12_Or_2"] = "Hello.",
		["SLASH_FOLLOW2"] = "/follow",
		["SPELL_FAILED_ONLY_UNDERWATER"] = "Can only use while swimming",
		["SPELL_FAILED_NO_DUELING"] = "Dueling isn't allowed here",
		["PVP_RANK_9_1_FEMALE"] = "Sergeant Major",
		["SPELL_FAILED_OUT_OF_RANGE"] = "Out of range",
		["HELPFRAME_BUG_BUTTON_DESCRIPTION"] = "Report a bug or error in the game",
		["BINDING_NAME_TOGGLECOMBATLOG"] = "Toggle Combat Log",
		["SPELL_FAILED_PACIFIED"] = "Can't use that ability while pacified",
		["SPELL_FAILED_POSSESSED"] = "You are possessed",
		["SPELL_FAILED_LOWLEVEL"] = "Target is too low level",
		["SPELL_FAILED_PROSPECT_NEED_MORE"] = "Requires %d %s.",
		["BINDING_NAME_SAVEVIEW3"] = "Save View 3",
		["GUILD_STATUS"] = "Show Guild Status",
		["EMOTE129_CMD1"] = "/shiver",
		["SLASH_GUILD_HELP1"] = "/ghelp",
		["SLASH_QUIT1"] = "/quit",
		["SLASH_CHAT_DND3"] = "/dnd",
		["SPELL_FAILED_REPUTATION"] = "Your reputation isn't high enough",
		["VOICEMACRO_6_Sc_1"] = "I will lead the way.",
		["BINDING_NAME_ACTIONBUTTON7"] = "Action Button 7",
		["HELP_TEXT_LINE6"] = "- 'Numlock' to autorun",
		["SPELL_FAILED_TARGETS_DEAD"] = "Your target is dead",
		["COMBAT_RATING_NAME11"] = "Crit Rating",
		["COMBAT_TEXT_SCROLL_UP"] = "Scroll Up",
		["SPELL_FAILED_TARGET_ENRAGED"] = "Target is too enraged to be charmed",
		["SPELL_FAILED_CHEST_IN_USE"] = "That is already being used",
		["TUTORIAL30"] = "You are now resting, indicated by your portrait glowing yellow. Time spent resting or logged out gives you a temporary bonus to experience from killing monsters.  You may want to find an Innkeeper and get a hearthstone which will allow you to quickly return later.",
		["HELPFRAME_ENVIRONMENTAL_BULLET6"] = "Inquiry of a location that is difficult to find",
		["VOICEMACRO_19_Tr_4_FEMALE"] = "You're the type I'd like to sink my teeth into.",
		["SPELL_FAILED_TARGET_NOT_IN_RAID"] = "Target is not in your party or raid group",
		["SPELL_FAILED_TOO_MANY_OF_ITEM"] = "You have too many of that item already",
		["VOICEMACRO_19_Tr_0"] = "Want some of my jungle love?",
		["VOICEMACRO_8_Ta_0_FEMALE"] = "Heal me!",
		["ITEM_NO_DROP"] = "No Drop",
		["INVTYPE_ROBE"] = "Chest",
		["SLASH_SWAPACTIONBAR1"] = "/swapactionbar",
		["SPELL_FAILED_TOTEM_CATEGORY"] = "Requires %s",
		["NEWBIE_TOOLTIP_ABANDONQUEST"] = "Abandons the selected quest, removing it from the Quest Log. Any quest that you abandon can be accepted again at some later date. Associated quest items will remain in your inventory, and there is no penalty for abandoning a quest.",
		["VOICEMACRO_10_Tr_0_FEMALE"] = "Shoot them!",
		["VOICEMACRO_0_Dw_0"] = "Help me!",
		["BINDING_NAME_ACTIONPAGE6"] = "Action Page 6",
		["ITEM_MOD_HEALTH"] = "%c%d Health",
		["VOICEMACRO_20_Hu_1_FEMALE"] = "Do you ever feel like you're not in charge of your own destiny, like you're being controlled by an invisible hand?",
		["OPTION_TOOLTIP_TEXTURE_DETAIL"] = "Controls the level of all texture detail. Decrease to improve performance.",
		["BINDING_NAME_ACTIONBUTTON6"] = "Action Button 6",
		["SLASH_EQUIP_TO_SLOT2"] = "/equipslot",
		["VOICEMACRO_18_Or_1"] = "Good job.",
		["PVP_TEAMTYPE"] = "%dv%d",
		["EMOTE80_CMD4"] = "/scratch",
		["VOICEMACRO_10_Ta_0_FEMALE"] = "Fire away!",
		["EMOTE29_CMD2"] = "/fear",
		["GUILDOFFICERNOTE_BUTTON_TOOLTIP"] = "Click to View the selected player's Officer's Note",
		["EMOTE30_CMD2"] = "/knuckles",
		["VOICEMACRO_10_Dw_0_FEMALE"] = "Shoot to kill!",
		["ITEM_WRITTEN_BY"] = "Written by %s",
		["VOICEMACRO_16_Hu_1"] = "How generous.",
		["SLASH_INSPECT2"] = "/inspect",
		["EMOTE79_CMD1"] = "/salute",
		["SPELL_FAILED_ITEM_GONE"] = "Item is gone",
		["HELPFRAME_ITEM_BULLET4"] = "Scammed items",
		["VOICEMACRO_7_Ta_1_FEMALE"] = "Remain here.",
		["EMOTE39_CMD1"] = "/eye",
		["VOICEMACRO_4_Gn_1_FEMALE"] = "Hey, help me attack over here!",
		["VOICEMACRO_20_Sc_1"] = "I'm dead, and I'm pissed.",
		["INVTYPE_HAND"] = "Hands",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_COMBAT_STATE"] = "Shows a message when you enter or leave combat. ",
		["INVTYPE_FINGER"] = "Finger",
		["BINDING_NAME_MINIMAPZOOMOUT"] = "Minimap Zoom Out",
		["EMOTE24_CMD1"] = "/clap",
		["CHAT_CHANNEL_LIST_GET"] = "[%s] ",
		["HELPFRAME_ACCOUNT_ENDTEXT"] = "For assistance with any issues like these, please contact Billing & Account Services:\n\nBy Phone at:  |cffffd200(800) 59-BLIZZARD|r\nBy Web at:  |cffffd200www.blizzard.com/support/wowbilling|r\nBy Email at:  |cffffd200billing@blizzard.com|r \n\nWe also recommend you check the Account Management page at: \n\n|cffffd200www.worldofwarcraft.com/account|r \n\nOn the Account Management page, you can view your subscription information, add game cards, and access other important account functions and options.",
		["VOICEMACRO_16_Gn_1_FEMALE"] = "How kind of you.",
		["HELPFRAME_TECHNICAL_BULLET7"] = "Any other technical game issue",
		["ITEM_SUFFIX_TEMPLATE"] = "%s %s",
		["SLASH_SCRIPT2"] = "/run",
		["VOICEMACRO_20_Tr_4"] = "I kill two dwarves in the morning, I kill two dwarves at night.  I kill two dwarves in the afternoon, and then I feel alright. I kill two dwarves in time of peace and two in time of war. I kill two dwarves before I kill two dwarves, and then I kill two more.",
		["SPELL_FAILED_SPELL_IN_PROGRESS"] = "Another action is in progress",
		["BINDING_NAME_ACTIONBUTTON12"] = "Action Button 12",
		["VOICEMACRO_3_Gn_1"] = "Let's get out of here!",
		["BINDING_NAME_TOGGLEQUESTLOG"] = "Toggle Quest Log",
		["VOICEMACRO_16_Gn_0_FEMALE"] = "How generous.",
		["EMOTE42_CMD3"] = "/flex",
		["HELPFRAME_ENVIRONMENTAL_BULLET3"] = "Getting ported to the wrong graveyard",
		["GUILDCONTROL_SELECTRANK"] = "Select guild rank to modify:",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY2"] = "This will show the World PVP objectives when you are near PVP points of interest.",
		["SLASH_CASTRANDOM1"] = "/castrandom",
		["EMOTE48_CMD2"] = "/gloat",
		["VOICEMACRO_1_Gn_0"] = "Danger approaches!",
		["VOICEMACRO_19_Or_3_FEMALE"] = "You'll do.  Let's go.",
		["EMOTE141_CMD1"] = "/snicker",
		["SPELL_FAILED_TARGET_FRIENDLY"] = "Target is friendly",
		["EMOTE32_CMD1"] = "/cry",
		["VOICEMACRO_12_Ni_0"] = "Greetings.",
		["VOICEMACRO_4_Ta_0"] = "Fight at my side!",
		["VOICEMACRO_20_Hu_1"] = "So, an Orc walks into a bar with a parrot on his shoulder.  The bartender says, \"Hey, where'd you get that?\"  The parrot says, \"Durotar.  They got 'em all over the place.\"",
		["VOICEMACRO_5_Ta_1"] = "My mana is spent!",
		["VOICEMACRO_20_Dw_4"] = "I don't drink anymore.  'Course, I don't drink any less, either.",
		["ITEM_BIND_QUEST"] = "Quest Item",
		["TUTORIAL36"] = "The durability of one of your items is getting low. The paper doll below your minimap indicates the damaged item in yellow. Find a merchant in town to repair the item before it breaks.",
		["SLASH_CHAT_UNMUTE5"] = "/unsquelch",
		["TUTORIAL5"] = "You enter combat mode by right clicking on your target and then moving into combat range.  You will automatically start swinging at your target.",
		["SLASH_INVITE4"] = "/i",
		["EMOTE73_CMD1"] = "/point",
		["GUILD_TEMPLATE"] = "%s of %s",
		["PVP_RANK_0_0_FEMALE"] = "Scout",
		["TUTORIAL1"] = "Questgivers have exclamation marks over their heads.  Talk to questgivers by moving close to them and right clicking on them.",
		["TUTORIAL18"] = "You can invite another player to your group by right-clicking on their portrait and selecting the Invite option from the popup menu.",
		["TUTORIAL2"] = "You can move with the ASDW keys, with the arrow keys or by holding down both the left and right mouse buttons.",
		["SLASH_WHISPER10"] = "/send",
		["PVP_RANK_13_1"] = "Knight-Champion",
		["SLASH_RAID1"] = "/raid",
		["SLASH_RANDOM5"] = "/rand",
		["GUILD_HELP_TEXT_LINE10"] = "'/gquit' removes you from your guild",
		["SPELL_FAILED_NOT_ON_MOUNTED"] = "Spell cannot be cast on a mounted unit.",
		["TUTORIAL40"] = "You have learned a new spell or ability! Use the Spellbook & Abilities button in your Action Bar to open your spellbook. Left-click and drag a spell or ability to move it to your Action Bar. The spellbook is organized by category, as indicated by the tabs sticking out from the right side of the book.",
		["TUTORIAL31"] = "You now have a hearthstone.  Hearthstones can be used to transport you from your current location to the last Inn that you acquired the hearthstone from.  You can only use your hearthstone once per hour.",
		["HELPFRAME_HOME_ISSUE2"] = "This includes information about:  an upcoming patch (what, when, how), upcoming content additions, game play changes, and future rule changes.",
		["SLASH_GUILD_WHO2"] = "/gwho",
		["VOICEMACRO_7_Sc_0_FEMALE"] = "Stay here.",
		["OPTION_TOOLTIP_USE_REFRESH"] = "Changes the monitor refresh rates. Higher rates flicker less.",
		["TUTORIAL19"] = "That’s another real person playing a character.  You can tell by the blue name above their head.",
		["EMOTE41_CMD2"] = "/impatient",
		["TUTORIAL_TITLE47"] = "Meeting Stones",
		["PVP_RANK_12_1_FEMALE"] = "Knight-Captain",
		["SPELL_FAILED_NEED_AMMO"] = "Ammo needs to be in the paper doll ammo slot before it can be fired",
		["TUTORIAL_TITLE37"] = "Broken Items",
		["INVTYPE_2HWEAPON"] = "Two-Hand",
		["SLASH_CONSOLE1"] = "/console",
		["EMOTE134_CMD1"] = "/snub",
		["TUTORIAL_TITLE3"] = "Cameras",
		["SLASH_HELP2"] = "/help",
		["TUTORIAL_TITLE18"] = "Grouping",
		["VOICEMACRO_5_Ni_0_FEMALE"] = "My mana is low!",
		["SLASH_MACROHELP2"] = "/macrohelp",
		["EMOTE104_CMD1"] = "/whine",
		["SLASH_OFFICER1"] = "/o",
		["EMOTE38_CMD5"] = "/chew",
		["HELP_TICKET_EDIT"] = "Edit My Ticket",
		["TUTORIAL_TITLE12"] = "Drink",
		["TUTORIAL_TITLE32"] = "Player vs. Player Combat",
		["VOICEMACRO_6_Or_1"] = "Come.",
		["TUTORIAL_TITLE51"] = "Looking for Group",
		["EMOTE72_CMD1"] = "/plead",
		["NEWBIE_TOOLTIP_UNIT_ROUND_ROBIN"] = "Under round-robin rules, group members take turns looting the monsters that they help the group to kill. Money is automatically divided between group members.",
		["HELP_TICKET_OPEN"] = "Open a Ticket",
		["PVP_RANK_7_0_FEMALE"] = "Sergeant",
		["HELP_TEXT_LINE2"] = "- 'x' to sit/stand",
		["TUTORIAL_TITLE43"] = "Unavailable Quest Givers",
		["TUTORIAL_TITLE26"] = "Rested",
		["EMOTE89_CMD2"] = "/snarl",
		["EMOTE30_CMD3"] = "/crack",
		["TUTORIAL_TITLE50"] = "Keyrings",
		["VOICEMACRO_LABEL_JOKE1"] = "silly",
		["VOICEMACRO_13_Ta_2_FEMALE"] = "May our paths cross again.",
		["OPTION_TOOLTIP_SHOW_BUFF_DURATION"] = "Toggle text counters for buff durations on and off.",
		["VOICEMACRO_6_Tr_0"] = "Follow me.",
		["EMOTE46_CMD1"] = "/giggle",
		["SLASH_MACRO3"] = "/m",
		["HELP_TEXT_LINE11"] = "- 'PageUp/PageDown' to scroll chat pane",
		["UNKNOWN"] = "Unknown",
		["RESISTANCE_TYPE5"] = "shadow",
		["VOICEMACRO_15_Sc_2"] = "I don't think so.",
		["KEY_ENTER_MAC"] = "Return",
		["EMOTE1_CMD2"] = "/agree",
		["OPTION_TOOLTIP_COMBAT_TEXT_SHOW_HONOR_GAINED"] = "Shows the honor you gain from killing other players.",
		["FRIENDS_LIST_OFFLINE_TEMPLATE"] = "|cff999999%s - Offline|r",
		["SLASH_MACROHELP3"] = "/macrohelp",
		["BINDING_NAME_CHATPAGEUP"] = "Chat Page Up",
		["VOICEMACRO_13_Gn_1_FEMALE"] = "Goodbye.",
		["VOICEMACRO_20_Sc_5_FEMALE"] = "You don't need deodorant when you don't have any armpits.",
		["CONFIRM_XP_LOSS"] = "If you find your corpse, you can resurrect for no penalty.  If I resurrect you all of your items will take 25%% durability damage (equipped and inventory) and you will be afflicted by %s of Resurrection Sickness.",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY_ALWAYS"] = "This will show the World PVP objectives when you are in PVP zones.",
		["EMOTE114_CMD3"] = "/insult",
		["VOICEMACRO_0_Gn_1"] = "Please, help me!",
		["SPELL_FAILED_ALREADY_HAVE_SUMMON"] = "You already control a summoned creature",
		["VOICEMACRO_0_Hu_1_FEMALE"] = "Help me!",
		["OPTION_TOOLTIP_USE_DESKTOP_GAMMA"] = "Use the same gamma settings as your desktop.",
		["VOICEMACRO_0_Ni_0"] = "Aid me!",
		["SLASH_CHAT_MODERATOR2"] = "/moderator",
		["VOICEMACRO_15_Hu_1"] = "Nay.",
		["VOICEMACRO_0_Or_0_FEMALE"] = "I need help!",
		["SLASH_JOIN3"] = "/chan",
		["VOICEMACRO_0_Sc_0_FEMALE"] = "Need your help!",
		["VOICEMACRO_0_Sc_1"] = "Help me!",
		["GUILD_HELP_TEXT_LINE3"] = "'/g <message>' sends a chat message to all members of your guild",
		["VOICEMACRO_0_Sc_1_FEMALE"] = "Help me!",
		["CANT_USE_ITEM"] = "You can't use that item.",
		["ADD_RAID_MEMBER"] = "Add Member",
		["VOICEMACRO_10_Dw_1"] = "Fire!",
		["VOICEMACRO_10_Gn_0"] = "Hurry, fire!",
		["VOICEMACRO_10_Gn_0_FEMALE"] = "Shoot!",
		["SLASH_PET_PASSIVE2"] = "/petpassive",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON11"] = "BottomLeft Action Button 11",
		["EMOTE50_CMD1"] = "/grin",
		["EMOTE55_CMD6"] = "/yay",
		["VOICEMACRO_LABEL_OPENFIRE2"] = "openfire",
		["VOICEMACRO_8_Ni_1"] = "I need healing!",
		["ITEM_ENCHANT_TIME_LEFT_DAYS"] = "%s (%d day)",
		["EMOTE36_CMD4"] = "/shindig",
		["EMBLEM_BACKGROUND"] = "Background",
		["BINDING_NAME_ASSISTTARGET"] = "Assist Target",
		["VOICEMACRO_16_Dw_1"] = "Thanks a lot.",
		["SLASH_TEAM_INVITE4"] = "/tinvite",
		["SLASH_CHAT_UNMUTE1"] = "/unmute",
		["ITEM_SIGNABLE"] = "<Right Click for Details>",
		["VOICEMACRO_10_Or_1"] = "Let 'em have it!",
		["VOICEMACRO_10_Ta_1_FEMALE"] = "Strike now!",
		["TITLE_TEMPLATE"] = "%s of the %s",
		["CONFIRM_TEAM_PROMOTE"] = "Really promote %s to Team Captain?",
		["OPTION_TOOLTIP_SHOW_MULTIBAR4"] = "Toggles an additional optional actionbar on the right side of the screen.",
		["SLASH_CHAT_AFK1"] = "/afk",
		["GUILD_HELP_TEXT_LINE11"] = "'/groster' gives an entire guild roster",
		["KEY_NUMPADPLUS"] = "Num Pad +",
		["VOICEMACRO_13_Gn_1"] = "Goodbye.",
		["TUTORIAL39"] = "You may want to invite other players to team up with you to more easily overcome your enemies. Many difficult quests can be quickly completed in a group, as quest credit is shared by the group. Moreover, groups earn bonus experience, relative to solo players.",
		["VOICEMACRO_16_Or_1_FEMALE"] = "Thank you.",
		["ITEM_BIND_ON_PICKUP"] = "Binds when picked up",
		["SLASH_PVP2"] = "/pvp",
		["VOICEMACRO_LABEL_CONGRATULATIONS3"] = "congratulations",
		["GUILDCONTROL_OPTION7"] = "Invite Member",
		["CHAT_EMOTE_SEND"] = "%s ",
		["COMBAT_TEXT_SHOW_HONOR_GAINED_TEXT"] = "Show Honor Gained",
		["VOICEMACRO_16_Or_0"] = "I will return the favor.",
		["EMOTE112_CMD1"] = "/cuddle",
		["SLASH_CHAT_HELP3"] = "/chat",
		["EMOTE29_CMD4"] = "/fear",
		["VOICEMACRO_14_Sc_0"] = "Yes.",
		["VOICEMACRO_6_Gn_0_FEMALE"] = "Follow me.",
		["VOICEMACRO_12_Gn_0_FEMALE"] = "Hello.",
		["CONFIRM_XP_LOSS_AGAIN_NO_SICKNESS"] = "Remember, if you find your corpse there is no penalty.  Are you sure you want to have all your items take 25% durability damage?",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON9"] = "Right Action Button 9",
		["HELPFRAME_CHARACTER_BULLET_TITLE1"] = "The following are examples of character issues:",
		["KEY_END"] = "End",
		["VOICEMACRO_14_Hu_2"] = "Uh huh.",
		["HELP_TICKET_QUEUE_DISABLED"] = "GM Help Tickets are currently unavailable.",
		["NEWBIE_TOOLTIP_MINIMAPTOGGLE"] = "Toggle display of the minimap.",
		["HELPFRAME_HOME_TEXT"] = "The following are the types of issues that a GM can assist with:",
		["SPELL_FAILED_ONLY_ABOVEWATER"] = "Cannot use while swimming",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON1"] = "Right Action Button 1",
		["HELPFRAME_NONQUEST_BULLET6"] = "Request for Non-Quest NPC/Creep information",
		["BINDING_NAME_TOGGLEBAG1"] = "Toggle Bag 1",
		["CONFIRM_XP_LOSS_NO_SICKNESS"] = "If you find your corpse, you can resurrect for no penalty.  If I resurrect you all of your items will take 25%% durability damage (equipped and inventory).",
		["VOICEMACRO_19_Sc_1_FEMALE"] = "One good thing about being dead, biological clock seems to have stopped.",
		["EMOTE77_CMD2"] = "/rofl",
		["OPTION_TOOLTIP_AUTO_LOOT_DEFAULT"] = "Sets Auto Looting as the default action when clicking on a lootable creature. (Looting when this is checked, or Auto Looting when it is not, is performed by holding the Loot Key / Auto Loot Key)",
		["INVTYPE_BAG"] = "Bag",
		["GUILD_TOTALONLINE"] = "(|cffffffff%d|r |cff00ff00Online|r)",
		["SLASH_EMOTE3"] = "/emote",
		["TUTORIAL_TITLE45"] = "Ammunition",
		["OPTION_TOOLTIP_ASSIST_ATTACK"] = "Automatically attack a target when you acquire it by using \"/assist\".",
		["BINDING_NAME_RAIDTARGET1"] = "Assign Star to Target",
		["VOICEMACRO_17_Or_2_FEMALE"] = "You're welcome.",
		["VOICEMACRO_8_Tr_1_FEMALE"] = "Cure me!",
		["VOICEMACRO_8_Tr_1"] = "Heal me!",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON9"] = "BottomLeft Action Button 9",
		["VOICEMACRO_16_Dw_3_FEMALE"] = "May your generosity be returned to you one hundred fold.",
		["VOICEMACRO_12_Ni_2"] = "Hi.",
		["HELPFRAME_ITEM_BUTTON_TEXT"] = "Report Item Issue",
		["TUTORIAL_TITLE48"] = "Battleground Queue",
		["EMOTE170_CMD2"] = "/golfclap",
		["VOICEMACRO_12_Or_0"] = "Thram-ka.",
		["VOICEMACRO_6_Tr_1"] = "You go with me.",
		["EMOTE153_CMD2"] = "/moo",
		["VOICEMACRO_LABEL_FOLLOWME3"] = "fol",
		["VOICEMACRO_20_Dw_2"] = "Oh, I'm having a wardrobe malfunction.  Oh, there's my hammer.",
		["VOICEMACRO_6_Or_0_FEMALE"] = "Follow me.",
		["INVTYPE_TRINKET"] = "Trinket",
		["VOICEMACRO_12_Sc_1"] = "Hi, there.",
		["OPTION_TOOLTIP_FIX_LAG"] = "Enabling this will reduce user interface lag, but can reduce frame rates.",
		["VOICEMACRO_12_Sc_1_FEMALE"] = "Hi, there.",
		["KEY_PLUS"] = "+",
		["EMOTE5_CMD6"] = "/applause",
		["VOICEMACRO_20_Ni_4"] = "I don't know about you, but I can't understand a thing those Wisps say.  I usually just nod.",
		["SLASH_CASTRANDOM2"] = "/castrandom",
		["VOICEMACRO_17_Gn_1"] = "Any time.",
		["VOICEMACRO_12_Sc_2"] = "Greetings.",
		["KEY_SPACE"] = "Spacebar",
		["VOICEMACRO_3_Sc_0_FEMALE"] = "Run!",
		["TUTORIAL_TITLE8"] = "Backpack",
		["VOICEMACRO_8_Hu_1"] = "Heal me!",
		["VOICEMACRO_5_Sc_1_FEMALE"] = "My mana is exhausted!",
		["VOICEMACRO_12_Ta_2"] = "Greetings.",
		["HELPFRAME_NONQUEST_TITLE"] = "Non-Quest NPC/Creep",
		["OPTION_TOOLTIP_CLICK_CAMERA3"] = "Sets the camera to not move when changing direction with click-to-move.",
		["SLASH_TEAM_CAPTAIN2"] = "/tcaptain",
		["VOICEMACRO_12_Tr_0"] = "Hey, there.",
		["VOICEMACRO_LABEL_THANKYOU3"] = "thank",
		["VOICEMACRO_13_Tr_0_FEMALE"] = "Goodbye.",
		["VOICEMACRO_12_Tr_1"] = "Hey, man.",
		["EMOTE99_CMD8"] = "/wrath",
		["SLASH_OFFICER2"] = "/osay",
		["NEWBIE_TOOLTIP_MANABAR1"] = "Warrior abilities require Rage. Rage is gained when you cause damage or take damage.",
		["VOICEMACRO_17_Dw_2_FEMALE"] = "You're welcome.",
		["OPTION_TOOLTIP_COMBAT_TEXT_SCROLL_DOWN"] = "Scroll combat text down instead of up.",
		["EMOTE126_CMD4"] = "/volunteer",
		["SLASH_PET_AGGRESSIVE1"] = "/petaggressive",
		["SPELL_FAILED_TARGET_NO_WEAPONS"] = "Target has no weapons equipped",
		["VOICEMACRO_12_Tr_1_FEMALE"] = "Hey, there.",
		["TUTORIAL_TITLE15"] = "Spells and Abilities Book",
		["GUILD_INFORMATION"] = "Guild Information",
		["VOICEMACRO_13_Dw_0"] = "Farewell.",
		["VOICEMACRO_7_Tr_0"] = "You stay here.",
		["SPELL_FAILED_ITEM_ALREADY_ENCHANTED"] = "Item is already enchanted",
		["VOICEMACRO_7_Ta_2"] = "Stew here.",
		["VOICEMACRO_13_Dw_2"] = "See you.",
		["SLASH_TEAM_INVITE3"] = "/teaminvite",
		["VOICEMACRO_15_Tr_0"] = "No.",
		["VOICEMACRO_13_Gn_0_FEMALE"] = "Farewell.",
		["VOICEMACRO_13_Gn_3"] = "I'll miss you.",
		["EMOTE121_CMD2"] = "/ponder",
		["VOICEMACRO_19_Dw_0_FEMALE"] = "I like tall men.",
		["EMOTE56_CMD1"] = "/hello",
		["SPELL_FAILED_TARGET_NOT_DEAD"] = "Target is alive",
		["HELPFRAME_TECHNICAL_BUTTON_TEXT"] = "Report Technical Issue",
		["VOICEMACRO_7_Or_1"] = "Stay here.",
		["OPTION_TOOLTIP_CAMERA1"] = "Set the camera to stay where placed, except when your character is moving.",
		["OPTION_TOOLTIP_CAMERA_NEVER"] = "Set the camera to stay where set, and never auto adjust.",
		["FACTION_OTHER"] = "Other",
		["BINDING_NAME_TOGGLEWHOTAB"] = "Toggle Who Pane",
		["SLASH_EMOTE7"] = "/emote",
		["HELPFRAME_ACCOUNT_BULLET2"] = "Canceling your World of Warcraft account",
		["EMOTE90_CMD1"] = "/spit",
		["EMOTE5_CMD5"] = "/bravo",
		["SLASH_INVITE2"] = "/inv",
		["VOICEMACRO_3_Hu_1_FEMALE"] = "Retreat!",
		["EMOTE16_CMD2"] = "/brb",
		["VOICEMACRO_13_Or_0_FEMALE"] = "Stay strong.",
		["ITEM_ENCHANT_TIME_LEFT_HOURS_P1"] = "%s (%d hrs)",
		["GUILD_LEAVE"] = "Leave Guild",
		["GUILD"] = "Guild",
		["VOICEMACRO_13_Sc_1_FEMALE"] = "It's been real.",
		["VOICEMACRO_14_Ta_1_FEMALE"] = "Naturally.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON9"] = "BottomRight Action Button 9",
		["SLASH_LEAVE3"] = "/chatexit",
		["BINDING_NAME_STRAFERIGHT"] = "Strafe Right",
		["SLASH_INVITE5"] = "/inv",
		["VOICEMACRO_13_Sc_2_FEMALE"] = "Good luck.",
		["VOICEMACRO_13_Ta_0_FEMALE"] = "Farewell.",
		["SLASH_TARGET_NEAREST_RAID1"] = "/targetraid",
		["GMSURVEY_POOR"] = "1 (Poor)",
		["SLASH_DUEL_CANCEL1"] = "/yield",
		["SLASH_EMOTE6"] = "/em",
		["BINDING_NAME_COMBATLOGBOTTOM"] = "Combat Log Bottom",
		["EMOTE50_CMD6"] = "/wickedly",
		["OPTION_TOOLTIP_AUTO_JOIN_GUILD_CHANNEL"] = "Check this option to automatically join the Guild Recruitment chat channel based upon whether or not you are in a guild.",
		["HELPFRAME_CHARACTER_BUTTON_TEXT"] = "Report Character Issue",
		["GUILD_CHARTER_TITLE"] = "Guild Name: %s",
		["VOICEMACRO_7_Dw_2"] = "Stay here.",
		["GUILD_HELP_TEXT_LINE12"] = "'/gleader <player>' sets another player as the guild leader",
		["HELPFRAME_ENVIRONMENTAL_BULLET_TITLE2"] = "The following are not considered environment issues:",
		["EMOTE111_CMD1"] = "/comfort",
		["VOICEMACRO_10_Dw_1_FEMALE"] = "Open fire!",
		["VOICEMACRO_14_Dw_2"] = "Aye.",
		["SLASH_CHAT_DND2"] = "/dnd",
		["BINDING_NAME_RAIDTARGET7"] = "Assign Cross to Target",
		["VOICEMACRO_7_Dw_0_FEMALE"] = "Stay here.",
		["PVP_RANK_1_0_FEMALE"] = "Pariah",
		["EMOTE161_CMD2"] = "/attacktarget",
		["ITEM_QUALITY2_DESC"] = "Uncommon",
		["VOICEMACRO_14_Hu_0"] = "Certainly.",
		["EMOTE43_CMD3"] = "/disappointment",
		["SPELL_FAILED_ERROR"] = "Internal error",
		["VOICEMACRO_20_Ni_0_FEMALE"] = "You know I have to keep moving at night or I'll disappear.",
		["BINDING_NAME_BONUSACTIONBUTTON4"] = "Secondary Action Button 4",
		["VOICEMACRO_2_Sc_1"] = "Rend flesh with me!",
		["PVPFFA"] = "Free for All PVP",
		["VOICEMACRO_8_Gn_1"] = "Would you please heal me?",
		["SPELL_FAILED_NOT_SHAPESHIFT"] = "You are in shapeshift form",
		["VOICEMACRO_LABEL_NO1"] = "no",
		["HELP_TEXT_SIMPLE"] = "Type '/help' for a listing of a few commands.",
		["VOICEMACRO_19_Dw_5"] = "I must be asleep, cause you're a dream come true.  Also, I'm slightly damp.",
		["OPTION_TOOLTIP_ENABLE_AMBIENCE"] = "Enable ambient sounds.",
		["PVP_RANK_9_0_FEMALE"] = "First Sergeant",
		["OPTION_TOOLTIP_SHOW_TARGET_OF_TARGET"] = "Toggles the display of the target of your target.",
		["FRIENDS_LEVEL_TEMPLATE"] = "Level %d %s",
		["EMOTE168_CMD2"] = "/wink",
		["VOICEMACRO_13_Gn_2"] = "It's been fun.",
		["KEY_PRINTSCREEN"] = "Print Screen",
		["ITEM_DURATION_HOURS"] = "Duration: %d hrs",
		["BINDING_NAME_TOGGLEIGNORETAB"] = "Toggle Ignore Pane",
		["EMOTE130_CMD4"] = "/pest",
		["BINDING_NAME_PITCHUP"] = "Pitch Up",
		["VOICEMACRO_14_Or_2_FEMALE"] = "(grunt)",
		["OPTION_TOOLTIP_CLICK_CAMERA_STYLE"] = "Determines the way the camera follows the player while in Click-to-Move mode.",
		["VOICEMACRO_14_Sc_1"] = "Certainly.",
		["EMOTE5_CMD1"] = "/applaud",
		["VOICEMACRO_5_Hu_0_FEMALE"] = "I'm out of mana!",
		["VOICEMACRO_16_Sc_0"] = "I am in your debt.",
		["SLASH_STOPATTACK2"] = "/stopattack",
		["VOICEMACRO_14_Ta_0_FEMALE"] = "Yes.",
		["VOICEMACRO_5_Tr_0"] = "Me mana be running low!",
		["SLASH_QUIT2"] = "/exit",
		["VOICEMACRO_5_Ta_0_FEMALE"] = "My mana must be replenished!",
		["SPELL_FAILED_NOT_WHILE_FATIGUED"] = "Can't cast while fatigued",
		["TUTORIAL26"] = "You are rested. Being rested gives you a temporary bonus to experience from killing monsters.",
		["VOICEMACRO_13_Tr_2_FEMALE"] = "Catch you later.",
		["EMOTE154_CMD2"] = "/commend",
		["VOICEMACRO_15_Gn_0"] = "No.",
		["EMOTE143_CMD1"] = "/stand",
		["OPTION_TOOLTIP_CLICKCAMERA_SMART"] = "Sets the camera to follow your character after a brief delay when changing direction with click-to-move. (Recommended Mode) ",
		["GM_EMAIL_NAME"] = "Customer Support",
		["VOICEMACRO_4_Or_0_FEMALE"] = "Attack over here!",
		["VOICEMACRO_15_Gn_2_FEMALE"] = "I don't think so.",
		["PVP_RANK_1_1_FEMALE"] = "Pariah",
		["VOICEMACRO_15_Hu_0"] = "No.",
		["VOICEMACRO_15_Hu_0_FEMALE"] = "No.",
		["ITEM_DISENCHANT_MIN_SKILL"] = "Disenchanting requires %s (%d)",
		["VOICEMACRO_15_Hu_3"] = "Not.",
		["VOICEMACRO_12_Tr_2"] = "What be happening?",
		["VOICEMACRO_3_Ta_0"] = "Run!",
		["EMOTE119_CMD2"] = "/lost",
		["EMOTE18_CMD4"] = "/belch",
		["VOICEMACRO_3_Dw_1_FEMALE"] = "Run!",
		["VOICEMACRO_0_Or_1_FEMALE"] = "Aid me!",
		["VOICEMACRO_15_Hu_1_FEMALE"] = "No way.",
		["VOICEMACRO_1_Ni_0_FEMALE"] = "Danger!",
		["NEWBIE_TOOLTIP_UNIT_FREE_FOR_ALL"] = "Under free-for-all rules, all group members may loot a monster that they help the group to kill. Money is automatically divided between group members.",
		["EMOTE_MESSAGE"] = "Emote",
		["VOICEMACRO_LABEL_HELP1"] = "helpme",
		["VOICEMACRO_7_Sc_1_FEMALE"] = "Don't move.",
		["SPELL_FAILED_TOTEMS"] = "Requires %s",
		["VOICEMACRO_19_Tr_3_FEMALE"] = "I won't bite you where it shows.",
		["KEY_BOUND"] = "Key Bound Successfully",
		["VOICEMACRO_18_Ta_1_FEMALE"] = "Excellent.",
		["HELP_TEXT_LINE14"] = "- /chat for a list of chat commands",
		["VOICEMACRO_LABEL_INCOMING2"] = "inc",
		["SLASH_TEAM_QUIT4"] = "/tquit",
		["EMOTE37_CMD2"] = "/drool",
		["SLASH_RAID_INFO1"] = "/raidinfo",
		["EMOTE38_CMD1"] = "/eat",
		["OPTION_TOOLTIP_WORLD_PVP_DISPLAY_NEVER"] = "This will turn off the World PVP objectives.",
		["INVTYPE_WEAPONOFFHAND"] = "Off Hand",
		["VOICEMACRO_1_Dw_0_FEMALE"] = "Danger approaching!",
		["EMOTE62_CMD4"] = "/lie",
		["VOICEMACRO_20_Hu_3"] = "How does a Tauren hide in a cherry tree?  He paints his hooves red.",
		["INVTYPE_HEAD"] = "Head",
		["VOICEMACRO_16_Dw_2_FEMALE"] = "Thanks a lot.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON5"] = "BottomRight Action Button 5",
		["EMOTE99_CMD6"] = "/doom",
		["NEWBIE_TOOLTIP_MANABAR2"] = "Hunters require focus to use their abilities.  Focus generates while standing still.",
		["VOICEMACRO_LABEL_OUTOFMANA1"] = "oom",
		["BINDING_NAME_RESETVIEW5"] = "Reset View 5",
		["NEWBIE_TOOLTIP_TALENTS"] = "The array of talents available to enhance and specialize your character.",
		["VOICEMACRO_16_Hu_0_FEMALE"] = "Thank you.",
		["VOICEMACRO_8_Or_1_FEMALE"] = "I need healing!",
		["VOICEMACRO_20_Or_1_FEMALE"] = "I have no respect for people with small piercings.  I say go full hog.  Put a spear through your head.",
		["SLASH_REMOVEFRIEND2"] = "/remfriend",
		["OPTION_TOOLTIP_SHOW_MULTIBAR1"] = "Toggles an optional actionbar in the bottom left area of the screen.",
		["GUILD_OFFICERNOTE_EDITLABEL"] = "Click here to set an Officer's Note.",
		["EMOTE55_CMD2"] = "/glad",
		["EMOTE133_CMD1"] = "/sniff",
		["EMOTE123_CMD1"] = "/praise",
		["ITEM_BIND_ON_USE"] = "Binds when used",
		["EMOTE22_CMD2"] = "/flap",
		["ERR_CANT_USE_ITEM"] = "You can't use that item.",
		["BINDING_NAME_MULTIACTIONBAR2BUTTON10"] = "BottomRight Action Button 10",
		["SLASH_LEAVE2"] = "/chatleave",
		["SLASH_CASTSEQUENCE1"] = "/castsequence",
		["VOICEMACRO_19_Ni_2"] = "Baby, I'm mortal now.  Time's a wasting.",
		["VOICEMACRO_3_Ta_1_FEMALE"] = "Save your hide!",
		["EMOTE170_CMD1"] = "/golfclap",
		["PVP_RANK_19_1_FEMALE"] = "Leader",
		["ITEM_OPENABLE"] = "<Right Click to Open>",
		["KEY_BUTTON5"] = "Mouse Button 5",
		["VOICEMACRO_LABEL_RASPBERRY1"] = "rasp",
		["VOICEMACRO_16_Ni_2"] = "Much appreciated.",
		["EMOTE101_CMD2"] = "/victory",
		["EMOTE58_CMD6"] = "/pizza",
		["OPTION_TOOLTIP_TARGETOFTARGET_RAID_AND_PARTY"] = "Sets Target of Target to display when you are in a raid or a party.",
		["EMOTE51_CMD2"] = "/groan",
		["BINDING_NAME_FOCUSTARGET"] = "Focus Target",
		["VOICEMACRO_20_Ni_3"] = "Is that thing sharp?  Could that thing cut me?  I'm not immortal now, you know.",
		["VOICEMACRO_7_Ni_0_FEMALE"] = "Remain here.",
		["VOICEMACRO_LABEL_THANKYOU1"] = "thankyou",
		["SLASH_LEAVE1"] = "/leave",
		["OPTION_TOOLTIP_AMBIENCE_VOLUME"] = "Adjusts the ambient sound volume.",
		["TUTORIAL_TITLE1"] = "Questgivers",
		["EMOTE80_CMD2"] = "/cat",
		["VOICEMACRO_16_Sc_2_FEMALE"] = "How generous.",
		["VOICEMACRO_5_Hu_1_FEMALE"] = "I need more mana!",
		["ITEM_DISENCHANT_ANY_SKILL"] = "Disenchantable",
		["VOICEMACRO_6_Ta_1"] = "I'll lead the way.",
		["EMOTE2_CMD2"] = "/amaze",
		["VOICEMACRO_8_Or_0_FEMALE"] = "Heal me!",
		["GUILD_PROMOTE"] = "Promote to Guildmaster",
		["GUILDCONTROL_OPTION5"] = "Promote",
		["SLASH_LIST_CHANNEL2"] = "/chatwho",
		["BUG_CATEGORY_ERROR"] = "You must choose a category to submit your bug/suggestion.",
		["VOICEMACRO_19_Or_5_FEMALE"] = "Let's not ruin this moment with chit chat.",
		["VOICEMACRO_16_Ta_0_FEMALE"] = "Thank you.",
		["SLASH_GUILD_LEAVE2"] = "/guildquit",
		["VOICEMACRO_16_Ta_1_FEMALE"] = "How kind of you.",
		["SLASH_TARGET_NEAREST_RAID2"] = "/targetraid",
		["VOICEMACRO_10_Hu_1"] = "Fire!",
		["VOICEMACRO_18_Hu_2_FEMALE"] = "Hazzah.",
		["COMBAT_TEXT_COMBO_POINTS_P1"] = "<%d Combo Points>",
		["SLASH_GUILD_INVITE3"] = "/ginvite",
		["HELPFRAME_GUILD_TITLE"] = "Guild",
		["VOICEMACRO_20_Ta_2"] = "Homogenized?  No way.  I like the ladies.",
		["SLASH_OFFICER4"] = "/osay",
		["VOICEMACRO_20_Ni_7"] = "I don't mind the Gnomes, but I'm always worried about tripping over one.",
		["KEY_NUMPAD8"] = "Num Pad 8",
		["SLASH_CHAT_CINVITE2"] = "/chatinvite",
		["BINDING_NAME_TOGGLEAUTOSELFCAST"] = "Toggle Auto Self Cast",
		["SLASH_RAID_WARNING1"] = "/rw",
		["VOICEMACRO_18_Dw_1"] = "Fantastic.",
		["VOICEMACRO_16_Tr_1_FEMALE"] = "Big thanks.",
		["EMOTE3_CMD2"] = "/mad",
		["VOICEMACRO_14_Hu_2_FEMALE"] = "Why not.",
		["SLASH_CHAT_MODERATE2"] = "/moderate",
		["OPTION_TOOLTIP_GAMEFIELD_DESELECT"] = "Checking this will prevent the deselection of targets by clicking on the gamefield.  Targets can only be cleared by pressing escape or clicking another target.",
		["VOICEMACRO_16_Tr_1"] = "Big thanks.",
		["GUILD_INVITATION"] = "%s invites you to join the guild: %s",
		["GUILDCONTROL_OPTION8"] = "Remove Member",
		["VOICEMACRO_4_Hu_0_FEMALE"] = "Aid my attack!",
		["SLASH_CHAT_PASSWORD5"] = "/pass",
		["SLASH_CHAT_MUTE2"] = "/squelch",
		["ITEM_SPELL_TRIGGER_ONPROC"] = "Chance on hit:",
		["VOICEMACRO_3_Ta_1"] = "Retreat!",
		["VOICEMACRO_2_Hu_0_FEMALE"] = "Attack!",
		["OPTION_TOOLTIP_MAX_FOLLOW_DIST"] = "Adjust the maximum distance the camera will follow behind you.",
		["VOICEMACRO_8_Dw_0"] = "I need healing!",
		["VOICEMACRO_10_Or_1_FEMALE"] = "Fire!",
		["GUILD_ONLINE_LABEL"] = "Online",
		["OPTION_TOOLTIP_USE_UISCALE"] = "Check to use the UI Scale Slider, uncheck to use the system default scale.",
		["ITEM_RESIST_SINGLE"] = "%c%d %s Resistance",
		["VOICEMACRO_2_Dw_0_FEMALE"] = "Charge!",
		["HELPFRAME_GUILD_BULLET2"] = "Not able to form a guild",
		["OPTION_TOOLTIP_WORLD_LOD"] = "Check this to enable dynamic reduction of terrain polygon detail.  Check to increase performance.",
		["SLASH_CONSOLE2"] = "/console",
		["SPELL_FAILED_CANT_BE_CHARMED"] = "Target can't be charmed",
		["VOICEMACRO_17_Dw_1_FEMALE"] = "My pleasure.",
		["EMOTE119_CMD1"] = "/lost",
		["BINDING_NAME_SHAPESHIFTBUTTON6"] = "Special Action Button 6",
		["VOICEMACRO_20_Tr_5"] = "I heard if you cut off an extremity, it'll regenerate a little bigger.  Don't believe it.",
		["BACKGROUND"] = "Background",
		["TUTORIAL7"] = "Right-Click on a creature’s corpse to loot it.  You can then right click on items in the loot pane to place them in your backpack.",
		["PVP_RANK_18_1_FEMALE"] = "Grand Marshal",
		["BINDING_NAME_TARGETPARTYMEMBER3"] = "Target Party Member 3",
		["VOICEMACRO_13_Ni_0"] = "Good journey.",
		["EMOTE111_CMD2"] = "/comfort",
		["PVP_RANK_14_0"] = "Champion",
		["VOICEMACRO_0_Or_0"] = "I need help!",
		["EMOTE108_CMD1"] = "/boggle",
		["VOICEMACRO_14_Tr_2_FEMALE"] = "Yeah, man.",
		["HELPFRAME_ITEM_BULLET3"] = "Enchantment or add-ons not working appropriately",
		["EMOTE95_CMD4"] = "/excited",
		["BINDING_NAME_TOGGLECHARACTER4"] = "Toggle Honor Pane",
		["VOICEMACRO_LABEL_GOODBYE1"] = "goodbye",
		["VOICEMACRO_6_Or_0"] = "Follow me.",
		["VOICEMACRO_19_Ta_3_FEMALE"] = "Come over here, sailor.",
		["PVP_LABEL_ARENA"] = "ARENA:",
		["VOICEMACRO_20_Ta_3_FEMALE"] = "You know how hard it is to get your groove on with the spirit of your great grandmother looking over you?",
		["VOICEMACRO_17_Or_2"] = "It was nothing.",
		["SLASH_LEAVE7"] = "/chatexit",
		["ITEM_COOLDOWN_TIME_DAYS"] = "Cooldown remaining: %d day",
		["VOICEMACRO_12_Dw_0"] = "How's it hanging?",
		["VOICEMACRO_8_Sc_0_FEMALE"] = "Heal me!",
		["SLASH_GUILD_WHO1"] = "/glist",
		["VOICEMACRO_14_Sc_2_FEMALE"] = "I suppose so.",
		["VOICEMACRO_8_Ta_0"] = "Heal me!",
		["VOICEMACRO_2_Hu_1_FEMALE"] = "To battle!",
		["VOICEMACRO_15_Ni_0"] = "No.",
		["VOICEMACRO_10_Sc_0"] = "Shoot to kill!",
		["VOICEMACRO_LABEL_ATTACKMYTARGET1"] = "assist",
		["PVP_RANK_2_0_FEMALE"] = "Outlaw",
		["VOICEMACRO_17_Tr_2_FEMALE"] = "Any time, man.",
		["VOICEMACRO_10_Ta_0"] = "Unleash your fury!",
		["TUTORIAL24"] = "You can equip items by opening your character screen with the button in the bottom center of the screen, and dragging them from your backpack onto your character.",
		["HELPFRAME_ENVIRONMENTAL_TEXT"] = "Issues that deal with a character not being able to interact with the environment or operate in the environment",
		["VOICEMACRO_2_Gn_2"] = "For Gnomeregan!",
		["SLASH_PET_DEFENSIVE1"] = "/petdefensive",
		["EMOTE107_CMD2"] = "/yawn",
		["EMOTE54_CMD2"] = "/hail",
		["VOICEMACRO_20_Sc_1_FEMALE"] = "Yes, they're real.  They're not mine, but they're real.",
		["BINDING_NAME_MULTIACTIONBAR3BUTTON3"] = "Right Action Button 3",
		["VOICEMACRO_1_Hu_0"] = "Guard yourself!",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON8"] = "BottomLeft Action Button 8",
		["SLASH_CLEARFOCUS2"] = "/clearfocus",
		["VOICEMACRO_8_Or_1"] = "I need healing!",
		["KEY_HOME"] = "Home",
		["VOICEMACRO_5_Gn_0_FEMALE"] = "My mana is running low!",
		["VOICEMACRO_4_Ni_0_FEMALE"] = "Assault this foe!",
		["VOICEMACRO_4_Ta_0_FEMALE"] = "Fight at my side!",
		["OPTION_TOOLTIP_ENABLE_MUSIC_LOOPING"] = "Enable to continuously play background music.",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON3"] = "Right ActionBar 2 Button 3",
		["VOICEMACRO_14_Ta_0"] = "Yes.",
		["NEWBIE_TOOLTIP_HEALTHBAR"] = "The amount of health you currently have. If your health reaches zero, you will die. Health automatically regenerates when you are out of combat.",
		["PVP_RANK_15_0"] = "Lieutenant General",
		["EMOTE61_CMD2"] = "/lol",
		["EMOTE148_CMD2"] = "/bark",
		["VOICEMACRO_18_Hu_0"] = "Congratulations.",
		["VOICEMACRO_7_Ta_1"] = "Remain here.",
		["VOICEMACRO_2_Sc_0"] = "For the forsaken!",
		["VOICEMACRO_6_Dw_0"] = "I'll lead the way.",
		["EMOTE38_CMD4"] = "/eat",
		["VOICEMACRO_20_Sc_7_FEMALE"] = "I heard a knee slapper once, and skipped my kneecap right across a lake.",
		["GM_TICKET_UNAVAILABLE"] = "Wait time currently unavailable.",
		["VOICEMACRO_15_Or_0"] = "No.",
		["VOICEMACRO_18_Or_1_FEMALE"] = "Not bad.",
		["BINDING_NAME_BONUSACTIONBUTTON5"] = "Secondary Action Button 5",
		["VOICEMACRO_19_Sc_4"] = "Check my breath.  Is it bad enough for you?",
		["VOICEMACRO_10_Ta_1"] = "Strike now!",
		["VOICEMACRO_19_Hu_2"] = "Hey, baby cakes.",
		["VOICEMACRO_18_Or_2"] = "You are worthy.",
		["GM_TICKET_SERVICE_SOON"] = "Your ticket will be serviced soon.",
		["SLASH_LIST_CHANNEL5"] = "/chatlist",
		["SLASH_PARTY1"] = "/p",
		["VOICEMACRO_15_Hu_2"] = "I don't think so.",
		["VOICEMACRO_18_Gn_3_FEMALE"] = "Wonderful.",
		["VOICEMACRO_6_Sc_0_FEMALE"] = "This way.",
		["VOICEMACRO_1_Tr_0"] = "There be danger!",
		["SLASH_RANDOM4"] = "/random",
		["VOICEMACRO_18_Tr_1"] = "Fantastic.",
		["HELP_TEXT_LINE4"] = "- 'F1-F5' to target self/groupmates",
		["VOICEMACRO_18_Tr_1_FEMALE"] = "Way to go.",
		["SLASH_GUILD_WHO4"] = "/glist",
		["INVTYPE_FEET"] = "Feet",
		["EMOTE140_CMD1"] = "/veto",
		["VOICEMACRO_1_Ta_0"] = "Danger approaches!",
		["VOICEMACRO_18_Tr_2_FEMALE"] = "Wonderful.",
		["OPTION_TOOLTIP_SHOW_DAMAGE"] = "Display damage numbers over hostile creatures when damaged.",
		["VOICEMACRO_19_Dw_4"] = "Where are you from?  Not that it matters.",
		["OPTION_TOOLTIP_USE_UBERTOOLTIPS"] = "Enable detailed tooltips in the lower right hand corner of the screen.",
		["VOICEMACRO_1_Or_1"] = "Incoming!",
		["OPTION_TOOLTIP_COMBAT_TEXT_MODE"] = "Sets the direction that combat text scrolls.",
		["SPELLDURABILITYDAMAGESELFOTHER"] = "You cast %s on %s: %s damaged.",
		["VOICEMACRO_19_Gn_0"] = "I have a number of inventions I'd like to show you back at my place.",
		["HELPFRAME_GM_BUTTON_TEXT"] = "Page a GM:",
		["GUILD_FRAME_TITLE"] = "Guild Roster",
		["VOICEMACRO_16_Gn_2"] = "Allow me to express my deepest thanks.",
		["VOICEMACRO_1_Sc_0_FEMALE"] = "Danger!",
		["CONFIRM_GUILD_DISBAND"] = "Do you really want to disband your guild?",
		["VOICEMACRO_16_Ta_2"] = "I thank you.",
		["VOICEMACRO_13_Dw_1"] = "Till we meet again.",
		["VOICEMACRO_4_Dw_2"] = "Help me with this cretin!",
		["EMOTE33_CMD1"] = "/curious",
		["BINDING_NAME_MULTIACTIONBAR1BUTTON3"] = "BottomLeft Action Button 3",
		["SLASH_GUILD6"] = "/gc",
		["VOICEMACRO_19_Hu_0"] = "How you doing?",
		["VOICEMACRO_19_Hu_1_FEMALE"] = "My turn offs are rude people, mean people, and people who aren't nice.",
		["SPELL_FAILED_CANT_BE_PROSPECTED"] = "There are no gems in this",
		["BINDING_NAME_ACTIONBUTTON1"] = "Action Button 1",
		["VOICEMACRO_19_Hu_4"] = "Are you tired, cause you've been running through my mind all day.",
		["VOICEMACRO_18_Dw_4"] = "Way to go.",
		["EMOTE48_CMD1"] = "/gloat",
		["EMOTE36_CMD3"] = "/drink",
		["TUTORIAL23"] = "You can send a message by hitting the enter key and typing a message.  Other players nearby will hear what you say.",
		["EMOTE130_CMD1"] = "/shoo",
		["SLASH_INSPECT4"] = "/inspect",
		["HELPFRAME_HARASSMENT_BUTTON_TEXT"] = "Harassment:",
		["VOICEMACRO_14_Tr_1"] = "Sure thing.",
		["VOICEMACRO_19_Ni_1"] = "I hope you're not afraid of snakes.",
		["CHAT_CHANNEL_GET"] = "%s: ",
		["VOICEMACRO_0_Ta_1_FEMALE"] = "Help!",
		["VOICEMACRO_19_Ni_2_FEMALE"] = "I'm the type of girl my mother warned me about.",
		["VOICEMACRO_19_Or_1_FEMALE"] = "I'll give you crazy love.",
		["VOICEMACRO_15_Tr_2_FEMALE"] = "Not on your life.",
		["NEWBIE_TOOLTIP_UNIT_FOLLOW"] = "Causes you to begin following the selected player. You will automatically continue to follow the player until this auto follow mode is disrupted.",
		["BINDING_NAME_PETATTACK"] = "Pet Attack",
		["SLASH_FOLLOW5"] = "/follow",
		["SLASH_WHISPER2"] = "/whisper",
		["SLASH_CHANGEACTIONBAR2"] = "/changeactionbar",
		["VOICEMACRO_13_Gn_0"] = "Farewell.",
		["EMOTE86_CMD1"] = "/sigh",
		["NEWBIE_TOOLTIP_HONOR_STANDING"] = "Standing is how you are doing compared to all other players on your side (Horde or Alliance).   If your standing is 150, then there were 149 players who gained more honor than you did during that time period. You must get at least 25 Honorable Kills in a week in order to be eligible to gain Standing and Rank.",
		["ITEM_MOD_CRIT_TAKEN_SPELL_RATING"] = "Improves spell critical avoidance rating by %d.",
		["BINDING_NAME_REPLY"] = "Chat Reply",
		["KEY_BUTTON3"] = "Middle Mouse",
		["BINDING_NAME_TOGGLESHEATH"] = "Sheath/Unsheath Weapon",
		["EMOTE95_CMD1"] = "/talkex",
		["VOICEMACRO_20_Tr_3"] = "New Troll here.",
		["OPTION_TOOLTIP_AUTO_SELF_CAST_ALT_KEY"] = "Use the \"ALT\" key to cast friendly target spells on yourself even if an enemy is targeted, or there is no target.",
		["NEXT_ABILITY"] = "Next Ability",
		["VOICEMACRO_LABEL_CONGRATULATIONS1"] = "grats",
		["BINDING_NAME_OPENCHATSLASH"] = "Open Chat Slash",
		["NEWBIE_TOOLTIP_BATTLEFIELD_GROUP_JOIN"] = "If you are the leader of a group, this button will add your current group to the battleground queue. Your group will be guaranteed to get into the same battleground instance at the same time.  Any group member added after you click this button or a group member in a queue for another battleground will not be guaranteed entrance to the same battleground.",
		["VOICEMACRO_19_Tr_1_FEMALE"] = "When enraged, and in heat, a female Troll can mate over eighty times in one night.  Be you prepared?",
		["SLASH_GUILD7"] = "/gu",
		["OPTION_TOOLTIP_AUTO_FOLLOW_SPEED"] = "Adjust the camera movement speed in Always and Smart following styles.",
		["EMOTE95_CMD3"] = "/talkex",
		["VOICEMACRO_16_Ni_1"] = "Excellent.",
		["VOICEMACRO_1_Hu_0_FEMALE"] = "Guard yourself!",
		["VOICEMACRO_1_Ni_0"] = "Beware!",
		["GUILD_RANK2_DESC"] = "Veteran",
		["VOICEMACRO_1_Or_0"] = "Watch it!",
		["VOICEMACRO_16_Or_0_FEMALE"] = "I won't forget this.",
		["VOICEMACRO_1_Sc_1_FEMALE"] = "Incoming!",
		["BINDING_NAME_CHATBOTTOM"] = "Chat Bottom",
		["EMOTE136_CMD2"] = "/smell",
		["VOICEMACRO_20_Dw_0"] = "Hi ho, hi ho... uh... second verse, same as the first.",
		["SLASH_VOICEMACRO1"] = "/v",
		["GUILD_MOTD"] = "Guild MOTD",
		["KEY_MOUSEWHEELDOWN"] = "Mouse Wheel Down",
		["BINDING_HEADER_MULTIACTIONBAR"] = "MultiActionBar Bindings",
		["OPTION_TOOLTIP_SCROLL_DOWN"] = "Scrolls combat text towards the bottom of the screen.",
		["VOICEMACRO_2_Ta_0"] = "For Kalimdor!",
		["VOICEMACRO_20_Gn_3_FEMALE"] = "Some day, I hope to find the nuggets on a chicken.",
		["OPTION_TOOLTIP_CAMERA2"] = "Set the camera to always prefer being behind your character.",
		["VOICEMACRO_20_Hu_4_FEMALE"] = "Me and my girlfriends exchange clothes all the time.  We're all the same size.",
		["SLASH_CHAT_CINVITE4"] = "/chatinvite",
		["VOICEMACRO_20_Ni_2"] = "Man, I was halfway through the Emerald Dream when I had to pee.",
		["ITEM_MOD_CRIT_TAKEN_RANGED_RATING"] = "Improves ranged critical avoidance rating by %d.",
		["HELP_TEXT_LINE9"] = "- Tab to target nearest enemy",
		["VOICEMACRO_LABEL_FOLLOWME2"] = "follow",
		["SPELL_FAILED_TARGET_AURASTATE"] = "You can't do that yet",
		["BINDING_NAME_SHAPESHIFTBUTTON8"] = "Special Action Button 8",
		["SPELL_FAILED_BAD_IMPLICIT_TARGETS"] = "No target",
		["VOICEMACRO_20_Or_5_FEMALE"] = "Man, I think that boar meat's coming back on me.  I gotta hit the can.  Anyone have a hearthstone?",
		["VOICEMACRO_20_Sc_2_FEMALE"] = "I'm in a rotten mood.",
		["SLASH_ASSIST2"] = "/assist",
		["VOICEMACRO_LABEL_HELPME2"] = "helpme",
		["OPTION_TOOLTIP_USE_WEATHER_SHADER"] = "Uncheck this if weather effects are causing your computer to crash.",
		["NEWBIE_TOOLTIP_ENTER_BATTLEGROUND"] = "Join the queue to enter this battleground when space becomes available.  This will result in a longer wait than selecting \"First Available\".",
		["VOICEMACRO_15_Sc_0"] = "No.",
		["GUILDCONTROL"] = "Guild Control",
		["VOICEMACRO_20_Ta_2_FEMALE"] = "Happy Taurens come from Mulgore.",
		["EMOTE133_CMD2"] = "/sniff",
		["BINDING_NAME_FLIPCAMERAYAW"] = "Flip Camera",
		["ITEM_SOCKETABLE"] = "<Shift Right Click to Socket>",
		["SLASH_CAST3"] = "/cast",
		["VOICEMACRO_16_Dw_0"] = "Thank you.",
		["VOICEMACRO_14_Dw_0_FEMALE"] = "Sure.",
		["HELPFRAME_ACCOUNT_TITLE"] = "Billing & Account Services",
		["PVP_RANK_4_1_FEMALE"] = "Dishonored",
		["CONFIRM_ACCEPT_SOCKETS"] = "One or more gems will be destroyed by socketing. Do you really want to socket the new gem(s)?",
		["OPTION_TOOLTIP_FARCLIP"] = "Changes how far you can see terrain. Decrease to improve performance.",
		["EMOTE19_CMD1"] = "/bye",
		["EMOTE69_CMD4"] = "/pick",
		["BINDING_NAME_TARGETPARTYPET1"] = "Target Party Pet 1",
		["VOICEMACRO_15_Tr_2"] = "Hell, no.",
		["OPTION_TOOLTIP_TARGETOFTARGET_SOLO"] = "Sets Target of Target to display when solo.",
		["VOICEMACRO_2_Dw_0"] = "Charge!",
		["VOICEMACRO_6_Dw_1_FEMALE"] = "Follow me!",
		["VOICEMACRO_0_Tr_0_FEMALE"] = "Help me!",
		["SLASH_JOIN2"] = "/channel",
		["SLASH_GUILD_UNINVITE3"] = "/gremove",
		["NEWBIE_TOOLTIP_GUILDCONTROL"] = "Allows you to customize the names of each rank in your guild, along with its privileges.",
		["VOICEMACRO_7_Hu_2_FEMALE"] = "Wait here.",
		["SLASH_GUILD_LEADER4"] = "/guildleader",
		["VOICEMACRO_8_Ni_0_FEMALE"] = "Heal me!",
		["COMBAT_TEXT_SHOW_MANA_TEXT"] = "Show Energy Gains",
		["BINDING_NAME_MULTIACTIONBAR4BUTTON10"] = "Right ActionBar 2 Button 10",
		["VOICEMACRO_15_Dw_1"] = "Uh uh.",
		["VOICEMACRO_20_Ni_1_FEMALE"] = "Actually, I'm more of a morning elf.",
		["ITEM_MOUSE_OVER"] = "Mouse over icon for more info",
		["EMOTE158_CMD2"] = "/openfire",
		["RESISTANCE_NONE"] = "None",
		["VOICEMACRO_19_Dw_0"] = "Enough of this chit chat.  Let's get to it, then.",
		["BINDING_NAME_BONUSACTIONBUTTON3"] = "Secondary Action Button 3",
		["GUILD_MOTD_TEMPLATE"] = "Guild Message of the Day: %s",
		["VOICEMACRO_0_Ta_1"] = "Help!",
		["EMOTE32_CMD4"] = "/cry",
		["VOICEMACRO_17_Gn_2"] = "You're welcome.",
		["HELPFRAME_QUEST_BULLET_TITLE1"] = "The following are examples of Quest/Quest NPC issues:",
		["EMOTE66_CMD1"] = "/mourn",
		["OPTION_TOOLTIP_PET_SPELL_DAMAGE"] = "Show spell damage caused by your pet.",
		["OPTION_TOOLTIP_TRILINEAR"] = "Enables high quality filtering of texture maps. Turn this feature off to increase performance.",
	},
}
