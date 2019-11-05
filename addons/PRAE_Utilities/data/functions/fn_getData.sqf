/* ----------------------------------------------------------------------------
Function: PRAE_fnc_getData

Description:
	Function to get custom variables data within ALiVE persistence

Parameters:
	_local - Boolean, is the mission saving persistence locally
	_customVar - Name of custom var to get data from

Returns:
	_value - Output of data stored to _customVar

Examples:
    _value = [true, "_praeAwesomeTeam"] call PRAE_fnc_getData;
	diag_log _value;

	["Trap", "Lewis"]
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_local", "_customVar"];

if (_local) then {
	_value = _customVar call ALiVE_fnc_ProfileNameSpaceLoad;
} else {
	_value = [_customVar] call ALiVE_fnc_getData;
};