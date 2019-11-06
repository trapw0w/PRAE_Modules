/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addFieldHQ

Description:
A function to add PRAE Field HQ interactions onto mission objects.
Parameters:
[_values] - the values passed to PRAE_fnc_addFieldHQ should be a string of mission object variable names which will act as Field HQ objects.
Returns:
Nil
Examples:
    (begin example)
	[_values] call PRAE_fnc_addFieldHQ;
    (end)
Author: Lewis

---------------------------------------------------------------------------- */
params ["_values"];
// Create a global array for limiting how many active field HQs there are
FieldHQs_Deployed = [];
// Check to see if PRAE_Multispawn is enabled
if !(PRAE_Multispawn) exitwith {diag_log "[PRAE Field HQs] Please enable PRAE_Multispawn to use PRAE Field HQs"};
// Ensure PRAE Field HQ's are enabled
diag_log "[PRAE Field HQs] - Initialising";
// Create Action to Create Field HQ
_fieldHQCreate = ["Field_HQ","Setup PRAE Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target, _player] call PRAE_fnc_setupFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

// Get object variable names to apply interaction to
_fobjects = [];

// Grab missiob objects to assign PRAE Field HQ Actions on
{
_object = missionNamespace getVariable [_x, objNull];
_fobjects pushback _object;
} foreach _values;

// Add PRAE Field HQ actions onto the designated objects
{
	// Check the PRAE Field HQ actions aren't already applied to the object
	if (_x getVariable["PRAE_FIELDHQ_ACTION", false]) exitWith { format["[PRAE Field HQs] - Interaction already present on %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2]};
	// Apply ACE interaction to vehicles
	format["[PRAE Field HQs] - Interaction added to Object: %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2];
	[_x, 0, ["ACE_MainActions"], _fieldHQCreate] call ace_interact_menu_fnc_addActionToObject;
	// Set variable on the object to designate that the actions have been added
	_x setVariable["PRAE_FIELDHQ_ACTION", true, true];
} forEach _fobjects;