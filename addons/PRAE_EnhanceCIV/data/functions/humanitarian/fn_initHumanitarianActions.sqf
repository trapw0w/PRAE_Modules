
params["_unit"];
if ((PRAE_HUMRATS) && (side _unit == CIVILIAN)) then {
	// Add ability to halt unit
	_condition = "alive _unit" + "&&" + "!(_unit getvariable ['target_halted',false])";

	_unit addAction ["Halt Civilian", {
		params ["_unit", "_caller", "_actionId"];
		//_unit removeAction _actionId;
		[_unit, _actionId] remoteExec ["removeAction", 2, true];
		_unit setVariable["target_halted", true, true];
		[_unit, _caller] call PRAE_fnc_haltCiv;
	}, [], 1, false, true, "", _condition, 3];
};