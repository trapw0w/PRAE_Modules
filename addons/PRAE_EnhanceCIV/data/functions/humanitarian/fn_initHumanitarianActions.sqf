/* ----------------------------------------------------------------------------
Function: PRAE_fnc_initHumanitarianActions

Description:
	Function to initialise the halt addAction to a unit. 

Parameters:
	_unit - Unit to add the action to

Returns:
	N/A

Examples:
    [_unit] call PRAE_fnc_initHumanitarianActions;
		
Author: trapw0w

---------------------------------------------------------------------------- */


params["_unit"];

// Quick check if PRAE Humanitarian is enabled + the _unit is a civilian
if ((PRAE_HUMRATS) && (side _unit == CIVILIAN)) then {
	// Add ability to halt unit
	_condition = "alive _target" + "&&" + "!(_target getvariable ['target_halted',false])";

	_unit addAction ["Halt Civilian", {
		params ["_unit", "_caller", "_actionId"];
		//_unit removeAction _actionId;
		[_unit, _actionId] remoteExec ["removeAction", -2, true];
		_unit setVariable["target_halted", true, true];
		[_unit, _caller] call PRAE_fnc_haltCiv;
	}, [], 1, false, true, "", _condition, 3];

};