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
params ["_target","_player"];

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeEventHandler ["Killed", 0];
    _player removeEventHandler ["Respawn", 0];

    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [player, true] call PRAE_fnc_praeKilled;
    }];
    _player addEventHandler ["Respawn",{[player, (player getVariable["FIELD_HQ", Nil]), true] call PRAE_fnc_praeRespawned}];
}else{
    player addEventHandler ["Killed",{[player, false] call PRAE_fnc_praeKilled}];
    player addEventHandler ["Respawn",{[player, (player getVariable["FIELD_HQ", Nil]), false] call PRAE_fnc_praeRespawned}];
};