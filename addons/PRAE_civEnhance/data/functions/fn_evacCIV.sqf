/* ----------------------------------------------------------------------------
Function: PRAE_fnc_evacCIV

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author:

---------------------------------------------------------------------------- */

params ["_target"];

// Define sleep between uses
_interval = 20;

// Define sound files
_sounds = ["PRAE_civEnhance\data\audio\civ_evac_1.ogg", "PRAE_civEnhance\data\audio\civ_evac_1.ogg"];

// Check if area is already evacuating
if (_target getVariable["EVAC_IN_USE", false]) exitWith {hint "Evacuation Currently Underway..."};

// Set the area to currently evacuating
_target setVariable["EVAC_IN_USE", true, true];

// Play evac sound file
playSound3D [(selectRandom _sounds), _target];

// Find all Agents(Civs) within a 200 metre radius from the calling vehicle
/*_agentObjects = [];
_allAgents = agents;
{
	_x = agent _x;
	if (_x inArea[(getPos _target), 200, 200]) then {
		_agentObjects pushBack _x;
	};
} forEach _allAgents;

// Iterate over all agents and set them to flee
{
	// Grab object for the agent
	[_x, []] call ALIVE_fnc_cc_flee;
} forEach _agentObjects;
*/
// Sleep for _interval, give civs a chance to flee
sleep _interval;

// Set back to no longer evacing
_target setVariable["EVAC_IN_USE", false, true];
