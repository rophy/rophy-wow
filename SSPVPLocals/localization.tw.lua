if( GetLocale() ~= "zhTW" ) then
	return;
end

SSPVPLocals = setmetatable( {

	["Eye of the Storm"] = "暴風之眼",
	["Warsong Gulch"] = "戰歌峽谷",
	["Arathi Basin"] = "阿拉希盆地",
	["Alterac Valley"] = "奧特蘭克山谷",
	["Blade's Edge Arena"] = "劍刃競技場",
	["Nagrand Arena"] = "納葛蘭競技場",
	["Ruins of Lordaeron"] = "羅德隆廢墟",
	["Arenas"] = "競技場",


	["Unknown"] = "未知",
}, { __index = SSPVPLocals } );
