/* ----------------------------------------------------------------------------
Function: PRAE_fnc_haltCiv

Description:
	Function to halt the civilian and then add the release action

Parameters:
	_target - Object in which the action has been called on
	_caller - Object in which the action was called from

Returns:
	N/A

Examples:
    _target will be frozen and have a new addAction added that will allow the ability to release
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_target", "_caller"];

// Stop civilian
[[[_target],{(_this select 0) disableAI "MOVE"}],"BIS_fnc_spawn",_target,false,true] call BIS_fnc_MP;
// Add release action
[_target] remoteExec ["PRAE_fnc_addReleaseAction", -2, true];
//[_target] call PRAE_fnc_addReleaseAction;
