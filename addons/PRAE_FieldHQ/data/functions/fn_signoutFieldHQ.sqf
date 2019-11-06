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

[_target,0,["ACE_MainActions","Field_HQ_Signout"]] call ace_interact_menu_fnc_removeActionFromObject;

[_player, "PRAE Field HQ", "You have sucessfully signed out of this Field HQ"] call PRAE_fnc_praeSendHint;

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
	_player setVariable["FIELD_HQ", Nil, true];
	_player setVariable["FIELD_HQ_Signed", false, true];
    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [player, true] call PRAE_fnc_praeKilled;
    }];
    _player addEventHandler ["Respawn",{[player, (faction player), true] call PRAE_fnc_praeRespawned}];
}else{
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
	_player setVariable["FIELD_HQ", Nil, true];
    _player setVariable["FIELD_HQ_Signed", false, true];
    player addEventHandler ["Killed",{[player, false] call PRAE_fnc_praeKilled}];
    player addEventHandler ["Respawn",{[player, (faction player), false] call PRAE_fnc_praeRespawned}];
};

_fieldHQsignin = ["Field_HQ_Sign","Sign in to Field HQ","",{
    params ["_target", "_player", "_params"];
    [_target, _player] call PRAE_fnc_signFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQsignin] call ace_interact_menu_fnc_addActionToObject;