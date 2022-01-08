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