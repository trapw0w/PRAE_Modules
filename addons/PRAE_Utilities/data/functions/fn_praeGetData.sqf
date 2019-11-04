/* ----------------------------------------------------------------------------
Function: PRAE_fnc_praeGetData

Description:
	Function to store custom variables within ALiVE persistence

Parameters:
	_local - Boolean, is the mission saving persistence locally
	_customVar - Name of custom var to get data from
	_value - Data to store to _customVar

Returns:
	_value - Output of data stored to _customVar

Examples:
    _value = [true, "_praeAwesomeTeam"] call PRAE_fnc_praeGetData;
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