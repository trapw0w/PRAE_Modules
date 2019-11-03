/* ----------------------------------------------------------------------------
Function: PRAE_fnc_setPos

Description:
	Function used to setPos on a player given a marker location. This presumes that respawn markers have been 
	placed using the players faction. (e.g. respawn_blu_f), if no marker is found, setPos will default to 
	respawn_(faction player)

Parameters:
	_player - Object that we intend to setPos on
	_location - Faction of the player

Returns:
	N/A

Examples:
    [player, (faction player)] call PRAE_fnc_praeSetPos;
	[player, "BLU_F"] call PRAE_fnc_praeSetPos;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_player", "_location"];

_markerPos = getMarkerPos (format["respawn_%1",_location]);
if (_markerPos isEqualTo [0,0,0]) then {
	format["[PRAE Multispawn] - No respawn marker found for %1.. Sending player to default respawn_%1", _location, (side _player)] remoteExec ["diag_log", 2];
	_player setPos (getMarkerPos (format["respawn_%1",(side _player)]));
} else {
	_player setPos (getMarkerPos (format["respawn_%1",_location]));
};