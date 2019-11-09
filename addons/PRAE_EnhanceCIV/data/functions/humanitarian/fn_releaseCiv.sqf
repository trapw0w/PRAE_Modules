/* ----------------------------------------------------------------------------
Function: PRAE_fnc_releaseCiv

Description:
	Function removes the freeze applied from PRAE_fnc_haltCiv

Parameters:
	_target - Object to unfreeze
	_called - Object that has executed the action

Returns:
	N/A

Examples:
    _target will be allowed to move again along with the halt action re-added
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_target", "_caller"];

// Stop civilian
[[[_target],{(_this select 0) enableAI "MOVE"}],"BIS_fnc_spawn",_target,false,true] call BIS_fnc_MP;
// Add halt action
[_target] remoteExec["PRAE_fnc_addHaltAction", -2, true];
//[_target] call PRAE_fnc_addHaltAction;