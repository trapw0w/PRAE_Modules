/* ----------------------------------------------------------------------------
Function: PRAE_fnc_removeEventHandler

Description:
	

Parameters:
	_object - Object to remove event handler from
	_event - Event to be removed

Returns:
	N/A

Examples:
	[player, "Killed"] call PRAE_fnc_removeEventHandler;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_object", "_event"];

_object removeAllEventHandlers _event;
