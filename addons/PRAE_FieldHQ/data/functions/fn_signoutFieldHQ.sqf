/* ----------------------------------------------------------------------------
Function: PRAE_fnc_signFieldHQ

Description:
Function to have a player signout of the PRAE Field HQ. When the player signs out, their eventhandlers are reset to their original state
and the player can sign back in if they wish.
Parameters:
[_target, _player] - _target is a reference to the object (PRAE Field HQ) that the player is signing out of. _player is a local reference 
to the player who is signing out of the PRAE Field HQ.
Returns:
Nil
Examples:

[_target, _player] call PRAE_fnc_signoutFieldHQ;

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target","_player"];

//[_target,0,["ACE_MainActions","Field_HQ_Signout"]] call ace_interact_menu_fnc_removeActionFromObject;

//[_player, "PRAE Field HQ", "You have sucessfully signed out of this Field HQ"] call PRAE_fnc_sendHint;

_HQName = _target getVariable["FIELD_HQ_DES", Nil];
if ((_player getVariable["FIELD_HQ_DES", Nil]) != _HQName) exitWith {[_player, "PRAE Field HQ", "You are not signed into this Field HQ"] call PRAE_fnc_sendHint;};
if (!(_player getVariable["FIELD_HQ_Signed", false])) exitWith {[_player, "PRAE Field HQ", "You are not signed into a Field HQ."] call PRAE_fnc_sendHint};

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", false, true];
    _player setVariable["FIELD_HQ_DES", Nil, true];
    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [(_this select 0), true] call PRAE_fnc_praeKilled;
    }];
    _player addEventHandler ["Respawn",{[(_this select 0), (faction (_this select 0)), true] call PRAE_fnc_praeRespawned}];
    [_player, "PRAE Field HQ", "You have sucessfully signed out of this Field HQ"] call PRAE_fnc_sendHint;
}else{
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", false, true];
    _player setVariable["FIELD_HQ_DES", Nil, true];
    _player addEventHandler ["Killed",{[(_this select 0), false] call PRAE_fnc_praeKilled}];
    _player addEventHandler ["Respawn",{[(_this select 0), (faction (_this select 0)), false] call PRAE_fnc_praeRespawned}];
    [_player, "PRAE Field HQ", "You have sucessfully signed out of this Field HQ"] call PRAE_fnc_sendHint;
};

/*
_fieldHQsignin = ["Field_HQ_Sign","Sign in to Field HQ","",{
    params ["_target", "_player", "_params"];
    [_target, _player] call PRAE_fnc_signFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQsignin] call ace_interact_menu_fnc_addActionToObject;
*/