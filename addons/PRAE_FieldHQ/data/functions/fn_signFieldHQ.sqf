/* ----------------------------------------------------------------------------
Function: PRAE_fnc_signFieldHQ

Description:
Function to have players sign into the Field HQ. When called, the player's Multispawn respawn location becomes set on the Field HQ and removes their default respawn.
Parameters:
[_target, _player] - _target is a reference to the object which the player is signing in to. _player is a reference 
to the player who has signed into the HQ, and will have the relevent event handlers assigned to them to respawn at the Field HQ.
Returns:
Nil
Examples:

[_target, _player] call PRAE_fnc_signFieldHQ;

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target","_player"];
// Get the relevent reference for the Field HQ.
_name = _target getVariable["FIELD_HQ_DES", Nil];

// Check to see how many Field HQ's the player attempting to sign in is currently signed into. If already signed in, exit.
if (_player getVariable["FIELD_HQ_Signed", false]) exitWith {[_player, "PRAE Field HQ", "You are already signed into a Field HQ."] call PRAE_fnc_sendHint};
// Remove player's ability to sign into this HQ.
//[_target,0,["ACE_MainActions","Field_HQ_Sign"]] call ace_interact_menu_fnc_removeActionFromObject;

if (_player getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", true, true];
    _player setVariable["FIELD_HQ_DES", _name, true];
    _player addEventHandler ["Killed",{
        PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
        [(_this select 0), true] call PRAE_fnc_praeKilled;
    }];
    _player addEventHandler ["Respawn",{[(_this select 0), ((_this select 0) getVariable["FIELD_HQ_DES", Nil]), true] call PRAE_fnc_praeRespawned}];
    [_player, "PRAE Field HQ", "You have sucessfully signed into this Field HQ"] call PRAE_fnc_sendHint;
}else{
    _player removeAllEventHandlers "Killed";
    _player removeAllEventHandlers "Respawn";
    _player setVariable["FIELD_HQ_Signed", true, true];
    _player setVariable["FIELD_HQ_DES", _name, true];
    _player addEventHandler ["Killed",{[(_this select 0), false] call PRAE_fnc_praeKilled}];
    _player addEventHandler ["Respawn",{[(_this select 0), ((_this select 0) getVariable["FIELD_HQ_DES", Nil]), false] call PRAE_fnc_praeRespawned}];
    [_player, "PRAE Field HQ", "You have sucessfully signed into this Field HQ"] call PRAE_fnc_sendHint;
};

/*
_fieldHQsignout = ["Field_HQ_Signout","Sign out of the Field HQ","",{
    params ["_target", "_player", "_params"];
    [_target, _player] call PRAE_fnc_signoutFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQsignout] call ace_interact_menu_fnc_addActionToObject;
*/