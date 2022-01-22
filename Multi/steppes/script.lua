dofile("Scripts/mission.lua");
dofile("Scripts/msl.lua");

function PostCreate()
	mission_lua.BasicMissionInitialize()
	AIparts:AddOneTime("startReinf", 10, func_startReinf)
	msd_vars = {
		id1 = 1,
		id2 = 2,
	}
end

function func_startReinf()
	do
		RunMultiSpawn(msd_vars.id1, "scout")
		RunMultiSpawn(msd_vars.id2, "scout")
		RunMultiSpawn(msd_vars.id1, "scout")
	end
end

