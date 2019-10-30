params ["player"];

if !(isPlayer player) exitWith{};
_playerFaction = faction player;

try {
	player setPos (getMarkerPos (format["respawn_",_playerFaction]));
}
catch {
	format["[PRAE Multispawn - Exception] - No respawn marker found for %1", _playerFaction] remoteExec ["diag_log", 2];
};

// Add ALiVE option