/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addEvacCIV

Description:
	Function add ACE interaction to all BLUFOR vehicles that are not air assets

Parameters:
	N/A

Returns:
	N/A

Examples:
    BLUFOR Humvee will have an ACE interaction added to it with the option of "PRAE Evacuate Civilians"
		
Author: trapw0w

---------------------------------------------------------------------------- */

diag_log "[PRAE Evactuate Civilians] - Initialising";

// Create Action to Evactuate Civilians
_evacCIV = ["EVAC_CIV","PRAE Evacuate Civilians","",{
	params ["_target", "_player", "_params"];
	[_target] spawn PRAE_fnc_evacCIV;
},{true}] call ace_interact_menu_fnc_createAction;

// Grab an array of all vehicles in the mission
_vehicles = vehicles; 
{
	// Check if configFile shows vehicle as side WEST and confirm vehicle is NOT a helicopter.
	if ((getNumber(configfile >> "CfgVehicles" >> (typeOf _x) >> "side") == 1) && !((typeOf _x) isKindOf ["Air", configFile >> "CfgVehicles"])) then {
		// Check if ACE interaction has already been applied
		if (_x getVariable["PRAE_EVAC_ACTION", false]) exitWith { format["[PRAE Evactuate Civilians] - Interaction already present on %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2]};
		// Apply ACE interaction to vehicles
		format["[PRAE Evactuate Civilians] - Interaction added to Vehicle: %1 - %2", _x, (typeOf _x)] remoteExec ["diag_log", 2];
		[_x, 0, ["ACE_MainActions"], _evacCIV] call ace_interact_menu_fnc_addActionToObject;
		// Set variable to declare object already has an interaction
		_x setVariable["PRAE_EVAC_ACTION", true, true];
  };
} forEach _vehicles;
