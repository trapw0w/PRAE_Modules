/* ----------------------------------------------------------------------------
Function: PRAE_fnc_praeRespawned

Description:
	Function executed via event handler once a player has respawned. Checks the status of 
	PRAE_Multispawn_ALiVE_GEAR and will use ALiVE_fnc_getGear accordingly. Player will be 
	moved to the location of _location via PRAE_fnc_praeSetPos

Parameters:
	_player - Object of the player that has executed the event handler
	_location - Faction of _player. PRAE_fnc_praeSetPos expects this to be a marker
	that starts with respawn_xxxx (e.g. respawn_blu_f)
	_aliveGear - Boolean, based on the _value of PRAE_Multispawn_ALiVE_GEAR

Returns:
	N/A

Examples:
    [player, (faction player), true] call PRAE_fnc_praeRespawned;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_player", "_location", "_aliveGear"];

if !(_aliveGear) then {
	[_player, _location] spawn {
		params["_player", "_location"];

		waituntil {!isNull _player};
		[_player, _location] call PRAE_fnc_praeSetPos;

		sleep 3;
		titleText ["", "PLAIN"];
	};
} else {
	[_player, _location] spawn {
		params["_player", "_location"];

		waituntil {!isNull _player};
		[_player, _location] call PRAE_fnc_praeSetPos;

		_hdl = [objNull, [_player,PLAYERGEAR]] spawn ALiVE_fnc_getGear;

		sleep 3;
		titleText ["", "PLAIN"];
	};
};