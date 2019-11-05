/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addEventHandler

Description:
	

Parameters:
	_object - Object to apply the event handler to
	_event - Event to listen for
	_script - Script to execute once event has triggered

Returns:
	N/A

Examples:
	[player, "Killed", {player setPos (getMarkerPos "respawn_west")}] call PRAE_fnc_removeEventHandler;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_object", "_event", "_script"];

_object addEventHandler[_event, _script];