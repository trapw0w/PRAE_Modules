/* ----------------------------------------------------------------------------
Function: PRAE_fnc_praeKilled

Description:
	

Parameters:
	_player - 

Returns:
	N/A

Examples:
    
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_player", "_aliveGear"];

if !(isPlayer _player) exitWith{};

[] spawn {
	titleText ["Respawning...", "BLACK OUT", 10];
	waituntil {playerRespawnTime <= 4};
};

