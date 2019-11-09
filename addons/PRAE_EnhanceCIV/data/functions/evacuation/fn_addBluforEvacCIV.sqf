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
params["_target"];

// Check if configFile shows vehicle as side WEST 
if (getNumber(configfile >> "CfgVehicles" >> (typeOf _target) >> "side") == 1) then {
	[_target] call PRAE_fnc_addEvacCIV;
};