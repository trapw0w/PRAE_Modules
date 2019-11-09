/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addHaltAction

Description:
	Add a scroll wheel option to the agent that will allow them to be stopped

Parameters:
	_unit - Object to add the action to

Returns:
	N/A

Examples:
    Given _target will have action applied to it
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_unit"];

_condition = "alive _target" + "&&" + "!(_target getvariable ['target_halted',false])";

[_unit, ["Halt Civilian", {
	params ["_unit", "_caller", "_actionId"];
	//_unit removeAction _actionId;
	[_unit, _actionId] remoteExec ["removeAction", 2, true];
	_unit setVariable["target_halted", true, true];
	[_unit, _caller] call PRAE_fnc_haltCiv;
}, [], 1, false, true, "", _condition, 3]] remoteExec ["addAction", 2, true];