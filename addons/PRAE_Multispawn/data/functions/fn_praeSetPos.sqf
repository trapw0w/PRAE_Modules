/* ----------------------------------------------------------------------------
Function: PRAE_fnc_setPos

Description:
	

Parameters:
	

Returns:
	N/A

Examples:
    
		
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