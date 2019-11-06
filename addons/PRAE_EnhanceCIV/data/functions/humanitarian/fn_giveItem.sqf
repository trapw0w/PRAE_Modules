/* ----------------------------------------------------------------------------
Function: PRAE_fnc_giveItem

Description:
	

Parameters:
	

Returns:
	N/A

Examples:
    
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_target", "_player", "_type"];



switch (_type) do {

	case "humrat": {
		if !("ACE_Humanitarian_Ration" in items _player) exitWith {[_player, "PRAE Enhanced Civilians", "You do not have a Humanitarian Ration to give this civ!"] call PRAE_fnc_sendHint};
		
		_player playAction "putdown";
		[_player, "ACE_Humanitarian_Ration"] call PRAE_fnc_removeItem;
		sleep 2;
		_target playAction "pickup";

		if (30 > random 100) then {
			[getPos _player, [side _player], -3] call ALIVE_fnc_updateSectorHostility;
			["PRAE_fnc_giveItem", "Sector Hostility Reduced!"] call PRAE_fnc_sendDebug;
		};

	};

	case "water": {
		diag_log "water";
	};
};