/* ----------------------------------------------------------------------------
Function: PRAE_fnc_addBluforEvacCIV

Description:
	Function add ACE interaction to all BLUFOR vehicles that are not air assets

Parameters:
	Requires PRAE_evacBluforCIV to be true

Returns:
	N/A

Examples:
    BLUFOR Humvee will have an ACE interaction added to it with the option of "PRAE Evacuate Civilians"
		
Author: trapw0w

---------------------------------------------------------------------------- */

diag_log "[PRAE Evactuate Civilians] - Initialising.. Adding to BLUFOR Vehicles..";

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
		// Add ACE interaction to vehicles
		[_x] call PRAE_fnc_addEvacCIV;
  };
} forEach _vehicles;
