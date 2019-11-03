/* ----------------------------------------------------------------------------
Function: PRAE_fnc_praeRespawned

Description:
	

Parameters:
	

Returns:
	N/A

Examples:
    
		
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