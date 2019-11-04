/* ----------------------------------------------------------------------------
Function: PRAE_fnc_signFieldHQ

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: Lewis

---------------------------------------------------------------------------- */
params ["_player", "_marker"];

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeEventHandler ["killed", 0];
    _player removeEventHandler ["respawned", 0];

    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [_player, true] call PRAE_fnc_praeKilled
    }];
    _player addEventHandler ["Respawn",{[_player, _marker, true] call PRAE_fnc_praeRespawned}];
}else{
    player addEventHandler ["Killed",{[_player, false] call PRAE_fnc_praeKilled}];
    player addEventHandler ["Respawn",{[_player, _marker, false] call PRAE_fnc_praeRespawned}];
};