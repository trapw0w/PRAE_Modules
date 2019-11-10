/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addEvacCIV

Description:
	Function to add Evac ACE action to a given target

Parameters:
	_target - This can be any object

Returns:
	N/A

Examples:
    Given _target will have ACE Action "PRAE Evacuate Civilians" applied to it
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_target"];

_evacCIV = ["EVAC_CIV","PRAE Evacuate Civilians","",{
	params ["_target", "_player", "_params"];
	if (_target getVariable["EVAC_IN_USE", false]) exitWith {[_player, "PRAE Civilian Enhancements", "Evacuation currently underway.."] call PRAE_fnc_sendHint};
	[_target, _player] remoteExec["PRAE_fnc_evacCIV", 2];
},{true}] call ace_interact_menu_fnc_createAction;

// Apply ACE interaction to vehicles
[_target, 0, ["ACE_MainActions"], _evacCIV] call ace_interact_menu_fnc_addActionToObject;
format["[PRAE Evactuate Civilians] - Interaction added to Vehicle: %1 - %2", _target, (typeOf _target)] remoteExec ["diag_log", 2];
// Set variable to declare object already has an interaction
_target setVariable["PRAE_EVAC_ACTION", true, true];