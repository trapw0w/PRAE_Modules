/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addEvacCIV

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: trapw0w

---------------------------------------------------------------------------- */

diag_log "[PRAE Evactuate Civilians] - Initialising";

// Create Action to Evactuate Civilians
_evacCIV = ["EVAC_CIV","Evacuate Civilians","",{
	params ["_target", "_player", "_params"];
	[_target] spawn PRAE_fnc_evacCIV;
},{true}] call ace_interact_menu_fnc_createAction;

// Grab an array of all vehicles in the mission
_vehicles = vehicles; 
{
	// Check if configFile shows vehicle as side WEST and confirm vehicle is NOT a helicopter.
	_type = typeOf _x;
	if ((getNumber(configfile >> "CfgVehicles" >> _type >> "side") == 1) && !((typeOf _x) isKindOf ["Air", configFile >> "CfgVehicles"])) then {
		// Apply ACE interaction to vehicles
		format["[PRAE Evactuate Civilians] - Interaction added to Vehicle: %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2];
		[_x, 0, ["ACE_MainActions"], _evacCIV] call ace_interact_menu_fnc_addActionToObject;
  };
} forEach _vehicles;
