This addon records what patterns are being fred from what combat log events. What I mean is it'll save something like this in the saved variables:

CombatLogScribeDB = {
	["events"] = {
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = {
			["AURAADDEDOTHERHELPFUL"] = {
				[1] = "%s gains %s.",
				[2] = "Seasoned Guardian gains Shield Block.",
			},
			["POWERGAINOTHEROTHER"] = {
				[1] = "%s gains %d %s from %s's %s.",
				[2] = "Rophy gains 15 Mana from Nino's Blessing of Wisdom.",
			},
		}
	}
}

I created this addon mainly to support ParserLib, and this wowwiki page: http://www.wowwiki.com/Patterns_fired_from_each_CHAT_MSG_events

There are a few scripts included in this package, which you'll need lua binary to execute:
	convert.lua	- converts GlobalStrings.lua into a table so that the mod can know the global string patterns.
	wiki.lua	- converts saved variable file into a wowwiki page.
	
To use this addon, first you'll need to upgrade the gs_table.lua if it is outdated. 
Get the newest GlobalStrings.lua, copy the file to this directory, then execute the following script:
	lua convert.lua > gs_table.lua
	
Then enable this addon in WoW and play, at first you'll be spammed by lots of "New pattern: XXX" messages, 
after most of the patterns are being recorded you won't see the messages as often.

The in game slash command for this mod is "/cls", see in game help for usages.

When you think you have gathered enough information to upload to WoWWiki, copy the saved variables to this directory and execute the wiki script:
	lua wiki.lua > result_wiki.txt
	
Then you can grab the whole wiki page from the website and do a diff to see if there are any new patterns, 
remember to verify that they're the correct patterns manually, before you actually upload.
