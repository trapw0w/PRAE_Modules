/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addReleaseAction

Description:
	Function adds the release action to an object once the halt action has been called

Parameters:
	_target - Object to add action to 

Returns:
	N/A

Examples:
    _target will have the Move Civilian Along addAction added
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_target"];

_condition = "alive _target" + "&&" + "_target getvariable ['target_halted',false]";
_target addAction["Move Civilian Along", {
	params ["_target", "_caller", "_actionId"];
	_target removeAction _actionId;
	_target setVariable["target_halted", false, true];
	[_target, _caller] call PRAE_fnc_releaseCiv;		
}, [], 1, false, true, "", _condition, 3];