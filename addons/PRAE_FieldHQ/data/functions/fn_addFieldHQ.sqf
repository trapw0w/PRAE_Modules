/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addFieldHQ

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: trapw0w

---------------------------------------------------------------------------- */
params [_values];

// Ensure PRAE Field HQ's are enabled
if !(PRAE_civEvac_enable) exitWith {diag_log "[PRAE Field HQ] - Please enable PRAE Field HQs to use this feature"};
diag_log "[PRAE Field HQs] - Initialising";
// Create Action to Create Field HQ
_fieldHQCreate = ["Field_HQ","Create Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target] spawn PRAE_fnc_setupFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

// Get object variable names to apply interaction to
_fobjects = [];

{
_object = missionNamespace getVariable [_x, objNull];
_fobjects pushback _object;
} foreach _values;

{
	// Apply ACE interaction to vehicles
	format["[PRAE Field HQs] - Interaction added to Object: %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2];
	[_x, 0, ["ACE_MainActions"], _fieldHQCreate] call ace_interact_menu_fnc_addActionToObject;
} forEach _fobjects;
