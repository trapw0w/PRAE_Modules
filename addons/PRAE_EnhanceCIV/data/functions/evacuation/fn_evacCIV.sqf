/* ----------------------------------------------------------------------------
Function: PRAE_fnc_evacCIV

Description:
	Code executed once player selects "PRAE Evac Civilians" on a BLUFOR vehicle. Will play a random audio file from _sounds
	array and disable the use of the action for 20 seconds.

Parameters:
	_target - This is the item that the addAction has been executed on. This will be a vehicle.

Returns:
	N/A

Examples:
    N/A

Author:
	trapw0w
---------------------------------------------------------------------------- */

params ["_target", "_player"];

// Define sleep between uses
_interval = 20;

// Define sound files
_sounds = ["PRAE_EnhanceCIV\data\audio\civ_evac_1.ogg", "PRAE_EnhanceCIV\data\audio\civ_evac_1.ogg"];

// Set the area to currently evacuating
_target setVariable["EVAC_IN_USE", true, true];

// Play evac sound file
playSound3D [(selectRandom _sounds), _target];

// Find all Agents(Civs) within a 200 metre radius from the calling vehicle
_agentObjects = [];
_allAgents = agents;
{
	_x = agent _x;
	// Check if agent is within 200 metre radius of the calling vehicle
	if (_x inArea[(getPos _target), 200, 200, 0, false]) then {
		// Quick check to make sure we haven't picked up <NULL-Object> by accident
		if !(isNull _x) then {
			_agentObjects pushBack _x;
		};
	};
} forEach _allAgents;

{
	// Set animation
	_anim = "ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon";
	
	[_anim, _x] spawn {
		params ["_anim", "_civ"];
		// Use ALiVE to set Animation, checks for local or remote exec
		[_civ, _anim] call ALIVE_fnc_switchMove;
		// Allow agent to run
		_civ setSpeedMode "FULL";
		// Grab random Safe Position
		_fleePos = [position _civ, 60, 200, 1, 0, 1, 0] call BIS_fnc_findSafePos;
		_civ moveTo _fleePos;
	};

} forEach _agentObjects;
"[PRAE Evactuate Civilians] - Civilians within 200 Metres are being evacuated!" remoteExec ["diag_log", 2];

// Sleep for _interval, give civs a chance to flee
sleep _interval;

// Set back to no longer evacing
_target setVariable["EVAC_IN_USE", false, true];
