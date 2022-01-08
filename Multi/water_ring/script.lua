dofile("Scripts/mission.lua");
dofile("Scripts/msl.lua");

function PostCreate()
	mission_lua.BasicMissionInitialize()
	AIparts:AddOneTime("SpawnScouts", 10, func_SpawnScouts)
	AIparts:AddOneTime("General", 1010, func_General)
	AIparts:AddOneTime("SpawnInfantry", 1210, func_SpawnInfantry)
	AIparts:AddOneTime("SpawnSpecialSquads", 1410, func_SpawnSpecialSquads)
	AIparts:AddOneTime("SpawnAntiair", 1910, func_SpawnAntiair)
	AIparts:AddPeriodic("SpawnSupport", 36000, func_SpawnSupport, 2400 + RandomHalf(100))
	AIparts:AddOneTime("SpawnTanks", 2810, func_SpawnTanks)
	AIparts:AddOneTime("SpawnSpg", 3210, func_SpawnSpg)
	AIparts:AddOneTime("SpawnInfantrry1", 6210, func_SpawnInfantrry1)
	AIparts:AddOneTime("SpawnTanks1", 6810, func_SpawnTanks1)
	AIparts:AddOneTime("SpawnHeavybonus", 7210, func_SpawnHeavybonus)
	AIparts:AddOneTime("SpawnHowitzers", 7710, func_SpawnHowitzers)
	AIparts:AddOneTime("SpawnSturmIfantryPlatoon", 15210, func_SpawnSturmIfantryPlatoon)
	AIparts:AddOneTime("Rocket", 15810, func_Rocket)
	AIparts:AddOneTime("DefineFlags", 30, func_DefineFlags)
	AIparts:AddOneTime("Aircrafts", 10, func_Aircrafts)
	AIparts:AddOneTime("Bonus", 1210, func_Bonus)
	AIparts:AddOneTime("BonusX", 16010, func_BonusX)
	msd_vars = {
		Alliance1id = 1,
		Alliance2id = 2,
		NorthStatus = 0,
		Random = 0,
		Random1 = 0,
		Random2 = 0,
		Random3 = 0,
		Random4 = 0,
		Random5 = 0,
		Random7 = 0,
		Random8 = 0,
		SouthStatus = 0,
	}
end

function func_SpawnScouts()
	do
		RunMultiSpawn(msd_vars.Alliance1id, "scouts")
		RunMultiSpawn(msd_vars.Alliance2id, "scouts")
	end
end

function func_General()
	do
		RunMultiSpawn(msd_vars.Alliance1id, "GeneralAndSappers")
		RunMultiSpawn(msd_vars.Alliance2id, "GeneralAndSappers")
	end
end

function func_SpawnInfantry()
	do
		msd_vars.Random7 = RandomHalf(2)
	end
	if msd_vars.Random7 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "infantry_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "infantry_platoon2")
	end
	do
		msd_vars.Random7 = RandomHalf(2)
	end
	if msd_vars.Random7 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "infantry_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "infantry_platoon2")
	end
end

function func_SpawnSpecialSquads()
	do
		RunSimpleSpawn(6, "arty2guns", "arty2guns")
		RunSimpleSpawn(7, "sappers", "sappers")
		RunSimpleSpawn(8, "amphibians", "amphibians")
		RunSimpleSpawn(9, "sappers", "train")
	end
end

function func_SpawnAntiair()
	do
		msd_vars.Random4 = RandomHalf(2)
	end
	if msd_vars.Random4 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "antiair")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "antiair1")
	end
	do
		msd_vars.Random4 = RandomHalf(2)
	end
	if msd_vars.Random4 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "antiair")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "antiair1")
	end
end

function func_SpawnSupport()
	do
		RunMultiSpawn(msd_vars.Alliance1id, "support_group")
		RunMultiSpawn(msd_vars.Alliance2id, "support_group")
	end
end

function func_SpawnTanks()
	do
		msd_vars.Random2 = RandomHalf(2)
	end
	if msd_vars.Random2 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "tank_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "tank_platoon1")
	end
	do
		msd_vars.Random2 = RandomHalf(2)
	end
	if msd_vars.Random2 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "tank_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "tank_platoon1")
	end
end

function func_SpawnSpg()
	do
		msd_vars.Random3 = RandomHalf(2)
	end
	if msd_vars.Random3 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "spg_platoon1")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "spg_platoon")
	end
	do
		msd_vars.Random3 = RandomHalf(2)
	end
	if msd_vars.Random3 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "spg_platoon1")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "spg_platoon")
	end
end

function func_SpawnInfantrry1()
	do
		RunMultiSpawn(msd_vars.Alliance1id, "infantry_platoon")
		RunMultiSpawn(msd_vars.Alliance2id, "infantry_platoon")
	end
end

function func_SpawnTanks1()
	do
		msd_vars.Random1 = RandomHalf(2)
	end
	if msd_vars.Random1 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "spzbat")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "spzbat1")
	end
	do
		msd_vars.Random1 = RandomHalf(2)
	end
	if msd_vars.Random1 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "spzbat")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "spzbat1")
	end
end

function func_SpawnHeavybonus()
	do
		msd_vars.Random = RandomHalf(4)
	end
	if msd_vars.Random < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "heavybonus1")
	elseif msd_vars.Random < 2 then
		RunMultiSpawn(msd_vars.Alliance1id, "heavybonus2")
	elseif msd_vars.Random < 3 then
		RunMultiSpawn(msd_vars.Alliance1id, "heavybonus4")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "heavybonus3")
	end
	do
		msd_vars.Random = RandomHalf(4)
	end
	if msd_vars.Random < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "heavybonus1")
	elseif msd_vars.Random < 2 then
		RunMultiSpawn(msd_vars.Alliance2id, "heavybonus2")
	elseif msd_vars.Random < 3 then
		RunMultiSpawn(msd_vars.Alliance2id, "heavybonus4")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "heavybonus3")
	end
end

function func_SpawnHowitzers()
	if AreHowitzersDisabled() then
		RunMultiSpawn(msd_vars.Alliance1id, "support_platoon")
		RunMultiSpawn(msd_vars.Alliance2id, "support_platoon")
	elseif not AreHowitzersDisabled() then
		RunMultiSpawn(msd_vars.Alliance1id, "support_platoon_howitzers")
		RunMultiSpawn(msd_vars.Alliance2id, "support_platoon_howitzers")
	end
end

function func_SpawnSturmIfantryPlatoon()
	do
		msd_vars.Random5 = RandomHalf(2)
	end
	if msd_vars.Random5 < 1 then
		RunMultiSpawn(msd_vars.Alliance1id, "sturm_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance1id, "sturm_platoon1")
	end
	do
		msd_vars.Random5 = RandomHalf(2)
	end
	if msd_vars.Random5 < 1 then
		RunMultiSpawn(msd_vars.Alliance2id, "sturm_platoon")
	else
		RunMultiSpawn(msd_vars.Alliance2id, "sturm_platoon1")
	end
end

function func_Rocket()
	do
		RunMultiSpawn(msd_vars.Alliance1id, "Rocket")
		RunMultiSpawn(msd_vars.Alliance2id, "Rocket")
	end
end

function func_DefineFlags()
	do
		SetFlag("North", 12, 180, false, 180, 0, {"infantry_group", }, {"", }, true, {"", }, {0, }, {8, }, {-1, }, "multi", 0, false, false, {-1, }, {-1, })
		SetFlag("South", 12, 180, false, 180, 0, {"infantry_group", }, {"", }, true, {"", }, {0, }, {8, }, {-1, }, "multi", 0, false, false, {-1, }, {-1, })
	end
	do
		AIparts:AddOneTime(AIparts:GetUniqueId("TIMER_DO_"), 60*10, function()  msl.CountdownTimer = 180 end)
		AIparts:AddOneTime(AIparts:GetUniqueId("TIMER_DO_"), 60*10, function()  SetCountdownObjectives({"North","South","Center","East","West", }) end)
	end
	do
		SetFlag("East", 12, 60, false, 1500, 0, {"infantry_platoon", }, {"infantry_group", }, false, {"", }, {0, }, {-1, }, {5, }, "multi", 0, true, true, {-1, }, {0, })
		SetFlag("Center", 12, 180, false, 2220, 0, {"sturm_platoon","heavybonus1","heavybonus4","spzbat","spzbat1", }, {"heavybonus3", }, false, {"", }, {0, }, {1,1,8, }, {8,8,1,1, }, "multi", 0, true, true, {-1, }, {-1, })
		SetFlag("West", 12, 240, false, 1800, 0, {"infantry_group","spzbat", }, {"infantry_group", }, false, {"", }, {0, }, {5, }, {5, }, "multi", 0, true, true, {0, }, {0, })
		SetFlag("East-Northville", 60, 180, true, 1380, 0, {"", }, {"reinf2","reinf1", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, true, {-1, }, {-1, })
		SetFlag("N-ville", 60, 180, true, 1380, 0, {"", }, {"reinf", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, true, {-1, }, {-1, })
		SetFlag("South-Westville", 60, 180, true, 1380, 0, {"", }, {"reinf2","reinf1", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, true, {-1, }, {-1, })
		SetFlag("West-ville", 60, 180, true, 1380, 0, {"", }, {"reinf", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, true, {-1, }, {-1, })
		SetFlag("town", 60, 180, true, 1380, 0, {"", }, {"reinf3", }, true, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, true, {-1, }, {-1, })
	end
end

function func_Aircrafts()
	do
		SetPlaneDesc("germany", "fighter", "german/fw_190_bomber.dsc")
		SetPlaneDesc("ussr", "fighter", "ussr/il_2.dsc")
		SetPlaneDesc("usa", "fighter", "american/f4f_wildcat.dsc")
		SetPlaneDesc("uk", "fighter", "british/tempest_mk_ii.dsc")
		SetPlaneDesc("germany", "scout", "german/fw_189.dsc")
		SetPlaneDesc("ussr", "scout", "ussr/yak_9t.dsc")
		SetPlaneDesc("germany", "bomber", "german/ju_88s.dsc")
		SetPlaneDesc("ussr", "bomber", "ussr/tu_2.dsc")
		SetPlaneDesc("usa", "bomber", "american/b_17f.dsc")
		SetPlaneDesc("uk", "bomber", "american/b_17f.dsc")
		SetPlaneSide(6, "NW")
		SetPlaneSide(7, "NE")
		SetPlaneSide(8, "SW")
		SetPlaneSide(9, "SE")
	end
end

function func_Bonus()
	do
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 3", }, false)
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 4", }, false)
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 5", }, false)
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 6", }, false)
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 7", }, false)
		SpawnUnit("Units/Artillery/Mortars/german/8cm_grwr34.dsc", "", {"Waypoint 8", }, false)
		SpawnUnit("Units/Vehicles/Tanks/british/sherman_vc_firefly_d.dsc", "", {"Sherman","Sherman1", }, false)
		SpawnAmmoFuel("ammo_8000.dsc", {"Random ammo2","Random ammo3", }, false)
		SpawnAmmoFuel("ammo_8000.dsc", {"Random ammo","Random ammo1", }, false)
		SpawnAmmoFuel("fuel_3600.dsc", {"Random fuel","Random fuel1", }, true)
		SpawnAmmoFuel("fuel_3600.dsc", {"Random fuel2","Random fuel3", }, true)
	end
end

function func_BonusX()
	do
		msd_vars.Random8 = RandomHalf(2)
	end
	if msd_vars.Random8 < 1 then
		AddBonus(6, 2, 2, -1, -1)
		AddBonus(7, 1, 2, -1, -1)
		AddBonus(8, 2, 2, -1, -1)
		AddBonus(9, 1, 2, -1, -1)
	else
		AddBonus(6, 1, 2, -1, -1)
		AddBonus(7, 2, 2, -1, -1)
		AddBonus(8, 1, 2, -1, -1)
		AddBonus(9, 2, 2, -1, -1)
	end
end
--user code
--global var
selected_bonus_id = -1
--redef PlaneBonus (mission.lua) for map
function mission_lua.PlaneBonus( self )
	if self.gate then
		Spawn({
            desc     = self.desc, 
            position = mission_lua.CalculateGate( self.gate ),
			player   = self.player, 
            commands = self.commands, 
            cargo    = self.cargo
        });
	else
		Spawn({
            desc     = self.desc, 
            position = mission_lua.CalculateGate( utils.detail.plane_side[self.player] ),
			player   = self.player, 
            commands = self.commands, 
            cargo    = self.cargo
        });
	end
    --if plane isn't bomber or fighter
    if selected_bonus_id == 0 or 
       selected_bonus_id == 7 or 
       selected_bonus_id == 8 then
        return
    end
    --if plane is bomber or fighter
    if self.gate then
		Spawn({
            desc     = self.desc, 
            position = mission_lua.CalculateGate( self.gate ),
			player   = self.player, 
            commands = self.commands, 
            cargo    = self.cargo
        });
	else
		Spawn({ 
            desc     = self.desc, 
            position = mission_lua.CalculateGate( utils.detail.plane_side[self.player] ),
			player   = self.player, 
            commands = self.commands, 
            cargo    = self.cargo 
        });
	end
end
--redef PlaneBonus (mission.lua) for map
function mission_lua.ExecuteBonus( player, bonus_id, param, position )
	if bonus_id == 0 or bonus_id == 1 or bonus_id == 2 or bonus_id == 7 or bonus_id == 8 then
		assert( player.Country ~= player.unknown, "country is not defined for Player " .. player.Id );
		
        selected_bonus_id = bonus_id

        local s = AIparts:AddOneTime(
            AIparts:GetUniqueId( "PLANE" ), 
            10, 
            function( self ) mission_lua.PlaneBonus( self ) end
        );

		s.player   = player.Id;
		s.commands = player.Id;
		s.desc     = utils.getplane( player.CountryName, mission_lua.bonus_types[bonus_id] );

		local inbound, outbound = mission_lua.CalculateGate( gate );
        -- transport
		if bonus_id == 7 or bonus_id == 8 then
			s.commands = {
                { unload_to = position },
				{ dislocation = outbound },
				{ disappear = true }
            };
			if bonus_id == 7 then
				s.cargo = utils.airborne( player.CountryName, param );
			else
				s.cargo = utils.getcargo();
			end
        -- bomber
        elseif bonus_id == 2 then
            s.commands = { 
                { attack_place = position },
                { attack_place = GetRandomRadiusPoint( position, RandomHalf( 65 ) ) },
                { dislocation  = outbound }, 
                { disappear    = true }
            };
        -- fighter
		else
		    s.commands = { 
                { attack_place = position }, 
                { attack_place = position },
                { attack_place = GetRandomRadiusPoint( position, RandomHalf( 65 ) ) }, 
                { attack_place = GetRandomRadiusPoint( position, RandomHalf( 115 ) ) }, 
                { attack_place = GetRandomRadiusPoint( position, RandomHalf( 85 ) ) },
                { dislocation  = inbound }, 
                { disappear    = true }
            };
		end
    -- Outmap bombardment
	elseif bonus_id == 3 then
		local num, period, time_offset = 8, 6, 30;
		AIparts:AddOneTime(
            AIparts:GetUniqueId( "WHSTL" ), 
            0, 
            function( self ) PlaySound2D( "shellfly" ); end
        );
		for i = 1, num do
			local s = AIparts:AddOneTime(
                AIparts:GetUniqueId( "STRK" ), 
                time_offset + i * period + Random( period ),
				function( self ) mission_lua.BombardmentBonus( self ) end
            );
			s.position = position;
			s.desc     = "Detonations/he400.dsc";
			s.radius   = 24;
			s.player   = player.Id;
		end
	end
end

ExecuteBonus = mission_lua.ExecuteBonus;