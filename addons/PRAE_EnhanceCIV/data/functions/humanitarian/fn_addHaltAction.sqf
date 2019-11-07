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
_unit addAction["Halt Civilian", {
	params ["_target", "_caller", "_actionId"];
	_target removeAction _actionId;
	_target setVariable["target_halted", true, true];
	[_target, _caller] call PRAE_fnc_haltCiv;		
}, [], 1, false, true, "", _condition, 3];