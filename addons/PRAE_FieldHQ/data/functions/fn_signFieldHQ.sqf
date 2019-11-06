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


if (_player getVariable["FIELD_HQ_Signed", false]) exitWith {[_player, "PRAE Field HQ", "You are already signed into another HQ. Sign out of that HQ and try again."] call PRAE_fnc_SendHint};

[_target,0,["ACE_MainActions","Field_HQ_Sign"]] call ace_interact_menu_fnc_removeActionFromObject;

[_player, "PRAE Field HQ", "You have sucessfully signed into this Field HQ"] call PRAE_fnc_SendHint;

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", true, true];
    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [player, true] call PRAE_fnc_praeKilled;
    }];
    _player addEventHandler ["Respawn",{[player, (player getVariable["FIELD_HQ", Nil]), true] call PRAE_fnc_praeRespawned}];
}else{
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", true, true];
    player addEventHandler ["Killed",{[player, false] call PRAE_fnc_praeKilled}];
    player addEventHandler ["Respawn",{[player, (player getVariable["FIELD_HQ", Nil]), false] call PRAE_fnc_praeRespawned}];
};

_fieldHQsignout = ["Field_HQ_Signout","Sign out of the Field HQ","",{
    params ["_target", "_player", "_params"];
    [_target, _player] call PRAE_fnc_signoutFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQsignout] call ace_interact_menu_fnc_addActionToObject;