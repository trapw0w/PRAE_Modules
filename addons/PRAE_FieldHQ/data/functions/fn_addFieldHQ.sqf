/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addFieldHQ

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: Lewis

---------------------------------------------------------------------------- */
params ["_values"];

// Ensure PRAE Field HQ's are enabled
diag_log "[PRAE Field HQs] - Initialising";
// Create Action to Create Field HQ
_fieldHQCreate = ["Field_HQ","Setup PRAE Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target] call PRAE_fnc_setupFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

// Get object variable names to apply interaction to
_fobjects = [];

{
_object = missionNamespace getVariable [_x, objNull];
_fobjects pushback _object;
} foreach _values;

diag_log _fobjects;

{
	if (_x getVariable["PRAE_FIELDHQ_ACTION", false]) exitWith { format["[PRAE Field HQs] - Interaction already present on %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2]};
	// Apply ACE interaction to vehicles
	format["[PRAE Field HQs] - Interaction added to Object: %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2];
	[_x, 0, ["ACE_MainActions"], _fieldHQCreate] call ace_interact_menu_fnc_addActionToObject;
	_x setVariable["PRAE_FIELDHQ_ACTION", true, true];
} forEach _fobjects;
