/* ----------------------------------------------------------------------------
Function: PRAE_fnc_praeKilled

Description:
	Function executed when player is Killed. This function is passed both the player and 
	the status of PRAE_Multispawn_ALiVE_GEAR. Currently, _aliveGear has no use here.

Parameters:
	_player - object of the player that has triggered the event handler

Returns:
	N/A

Examples: 
	[player, true] call PRAE_fnc_praeKilled;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params ["_player", "_aliveGear"];

if !(isPlayer _player) exitWith{};

[] spawn {
	titleText ["Respawning...", "BLACK OUT", 10];
	waituntil {playerRespawnTime <= 4};
};

