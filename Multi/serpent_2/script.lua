dofile("Scripts/mission.lua");
dofile("Scripts/msl.lua");

function PostCreate()
    mission_lua.BasicMissionInitialize()
    AIparts:AddOneTime("scouts", 10, func_scouts)
    AIparts:AddOneTime("define_flags", 11, func_define_flags)
    AIparts:AddOneTime("inf_platoon1", 310, func_inf_platoon1)
    AIparts:AddOneTime("tanks_earlywar", 610, func_tanks_earlywar)
    AIparts:AddOneTime("spg_earlywar", 1010, func_spg_earlywar)
    AIparts:AddOneTime("arty_with_inf", 1310, func_arty_with_inf)
    AIparts:AddOneTime("sappers", 1460, func_sappers)
    AIparts:AddOneTime("inf_platoon2", 6510, func_inf_platoon2)
    AIparts:AddOneTime("tanks_midwar", 6810, func_tanks_midwar)
    AIparts:AddOneTime("spg_midwar", 7210, func_spg_midwar)
    AIparts:AddPeriodic("inf_bonus", 24000, func_inf_bonus, 7500 + RandomHalf(100))
    AIparts:AddOneTime("medium_tanks", 7810, func_medium_tanks)
    AIparts:AddOneTime("heavy_bonus", 8210, func_heavy_bonus)
    AIparts:AddOneTime("howitzers", 9010, func_howitzers)
    AIparts:AddOneTime("rocket", 24010, func_rocket)
    AIparts:AddPeriodic("airbonus", 36000, func_airbonus, 9000 + RandomHalf(100))
    AIparts:AddPeriodic("support", 36000, func_support, 36000 + RandomHalf(100))
    msd_vars = {
        a1 = 1,
        a2 = 2,
        random = 0,
        town = 0,
        town_alliance = 0,
        town_flag = 0,
    }
end

function func_scouts()
    do
        RunMultiSpawn(msd_vars.a1, "motobike_platoon")
        RunMultiSpawn(msd_vars.a2, "motobike_platoon")
    end
end

function func_define_flags()
    do
        SetPlaneDesc("usa", "fighter", "american/f4f_wildcat.dsc")
        SetPlaneDesc("germany", "fighter", "german/fw_190_bomber.dsc")
        SetPlaneDesc("ussr", "fighter", "ussr/il_2.dsc")
        SetPlaneDesc("uk", "fighter", "british/tempest_mk_ii.dsc")
        SetPlaneSide(1, "NW")
        SetPlaneSide(2, "SW")
        SetPlaneSide(3, "SE")
        SetPlaneSide(4, "NE")
        SetPlaneDesc("ussr", "scout", "ussr/yak_9t.dsc")
        SetPlaneDesc("uk", "scout", "british/spitfire_mk_i.dsc")
    end
    do
        msl.CountdownTimer = 180
        SetCountdownObjectives({"West Flag","East Flag","Central Flag1","Central Flag2","South Flag","North Flag", })
    end
    do
        SetFlag("West Flag", 15, 180, false, 0, 0, {"commandos","atguns", }, {"", }, false, {"", }, {0, }, {0, }, {-1, }, "multi", 0, true, true, {0, }, {-1, })
        SetFlag("East Flag", 15, 180, false, 0, 0, {"commandos","atguns", }, {"", }, false, {"", }, {0, }, {0, }, {-1, }, "multi", 0, true, true, {0, }, {-1, })
        SetFlag("Central Flag1", 15, 180, false, 2400, 0, {"mediumtanks","heavytanks","heavybonus2", }, {"infantry_bonus3","tanks_midwar","heavytanks", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, false, {-1, }, {-1, })
        SetFlag("Central Flag2", 15, 180, false, 2400, 0, {"mediumtanks","heavytanks","infantry_bonus2", }, {"infantry_bonus3","tanks_midwar","heavytanks", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, true, false, {-1, }, {-1, })
        SetFlag("North Flag", 15, 300, false, 3600, 0, {"infantry_platoon","atguns","atguns_infantry","infantry_bonus1", }, {"infantry_bonus1","infantry_bonus3","atguns_infantry", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, false, false, {-1, }, {-1, })
        SetFlag("South Flag", 15, 300, false, 3600, 0, {"infantry_platoon","infantry_bonus3","spg_earlywar", }, {"infantry_bonus1","infantry_bonus3","atguns_infantry", }, false, {"", }, {0, }, {-1, }, {-1, }, "multi", 0, false, false, {-1, }, {-1, })
    end
end

function func_inf_platoon1()
    do
        RunMultiSpawn(msd_vars.a1, "infantry_platoon")
        RunMultiSpawn(msd_vars.a2, "infantry_platoon")
    end
end

function func_tanks_earlywar()
    do
        RunMultiSpawn(msd_vars.a1, "tanks_earlywar")
        RunMultiSpawn(msd_vars.a2, "tanks_earlywar")
    end
end

function func_spg_earlywar()
    do
        RunMultiSpawn(msd_vars.a1, "spg_earlywar")
        RunMultiSpawn(msd_vars.a2, "spg_earlywar")
    end
end

function func_arty_with_inf()
    do
        RunMultiSpawn(msd_vars.a1, "atguns_infantry")
        RunMultiSpawn(msd_vars.a2, "atguns_infantry")
    end
end

function func_sappers()
    do
        RunMultiSpawn(msd_vars.a1, "sappers")
        RunMultiSpawn(msd_vars.a2, "sappers")
    end
end

function func_inf_platoon2()
    do
        RunMultiSpawn(msd_vars.a1, "infantry_platoon")
        RunMultiSpawn(msd_vars.a2, "infantry_platoon")
    end
end

function func_tanks_midwar()
    do
        RunMultiSpawn(msd_vars.a1, "tanks_midwar")
        RunMultiSpawn(msd_vars.a2, "tanks_midwar")
    end
end

function func_spg_midwar()
    do
        RunMultiSpawn(msd_vars.a1, "spg_midwar")
        RunMultiSpawn(msd_vars.a2, "spg_midwar")
    end
end

function func_inf_bonus()
    do
        RunMultiSpawn(msd_vars.a1, "antiair_arty6_guns")
        RunMultiSpawn(msd_vars.a2, "antiair_arty6_guns")
    end
    do
        msd_vars.random = RandomHalf(3)
    end
    if msd_vars.random < 1 then
        RunMultiSpawn(msd_vars.a1, "infantry_bonus1")
    elseif msd_vars.random < 2 then
        RunMultiSpawn(msd_vars.a1, "infantry_bonus2")
    else
        RunMultiSpawn(msd_vars.a1, "infantry_bonus3")
    end
    do
        msd_vars.random = RandomHalf(3)
    end
    if msd_vars.random < 1 then
        RunMultiSpawn(msd_vars.a2, "infantry_bonus1")
    elseif msd_vars.random < 2 then
        RunMultiSpawn(msd_vars.a2, "infantry_bonus2")
    else
        RunMultiSpawn(msd_vars.a2, "infantry_bonus3")
    end
end

function func_medium_tanks()
    do
        RunMultiSpawn(msd_vars.a1, "mediumtanks")
        RunMultiSpawn(msd_vars.a2, "mediumtanks")
    end
end

function func_heavy_bonus()
    do
        msd_vars.random = RandomHalf(3)
    end
    if msd_vars.random < 1 then
        RunMultiSpawn(msd_vars.a1, "heavybonus1")
    elseif msd_vars.random < 2 then
        RunMultiSpawn(msd_vars.a1, "heavybonus2")
    else
        RunMultiSpawn(msd_vars.a1, "heavybonus3")
    end
    do
        msd_vars.random = RandomHalf(3)
    end
    if msd_vars.random < 1 then
        RunMultiSpawn(msd_vars.a2, "heavybonus1")
    elseif msd_vars.random < 2 then
        RunMultiSpawn(msd_vars.a2, "heavybonus2")
    else
        RunMultiSpawn(msd_vars.a2, "heavybonus3")
    end
end

function func_howitzers()
    if AreHowitzersDisabled() then
        RunMultiSpawn(msd_vars.a1, "support_platoon")
        RunMultiSpawn(msd_vars.a2, "support_platoon")
    else
        RunMultiSpawn(msd_vars.a1, "support_platoon_howitzers")
        RunMultiSpawn(msd_vars.a2, "support_platoon_howitzers")
    end
end

function func_rocket()
    do
        RunMultiSpawn(msd_vars.a2, "rocket")
        RunMultiSpawn(msd_vars.a1, "rocket")
    end
end

function func_airbonus()
    do
        AddBonus(1, 8, 2, -1, -1)
        AddBonus(2, 8, 2, -1, -1)
        AddBonus(3, 8, 2, -1, -1)
        AddBonus(4, 8, 2, -1, -1)
    end
    do
        msd_vars.random = RandomHalf(2)
    end
    if msd_vars.random < 1 then
        AddBonus(1, 1, 2, -1, -1)
        AddBonus(2, 2, 1, -1, -1)
        AddBonus(3, 1, 2, -1, -1)
        AddBonus(4, 2, 1, -1, -1)
    else
        AddBonus(1, 2, 1, -1, -1)
        AddBonus(2, 1, 2, -1, -1)
        AddBonus(3, 2, 1, -1, -1)
        AddBonus(4, 1, 2, -1, -1)
    end
end

function func_support()
    do
        RunMultiSpawn(msd_vars.a1, "support_platoon")
        RunMultiSpawn(msd_vars.a2, "support_platoon")
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