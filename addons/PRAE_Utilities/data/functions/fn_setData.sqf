/* ----------------------------------------------------------------------------
Function: PRAE_fnc_setData

Description:
	Function to store custom variables within ALiVE persistence

Parameters:
	_local - Boolean, is the mission saving persistence locally
	_customVar - Name of custom var to store data to
	_value - Data to store to _customVar

Returns:
	N/A

Examples:
	_value = ["Trap", "Lewis"];
    [true, "_praeAwesomeTeam", _value] call PRAE_fnc_setData;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_local", "_customVar", "_value"];

if (_local) then {
	[_customVar,_value] call ALiVE_fnc_ProfileNameSpaceSave;
} else {
	[_customVar, _value] call ALiVE_fnc_setData;
};