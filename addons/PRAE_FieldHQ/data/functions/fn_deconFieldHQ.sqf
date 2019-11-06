/* ----------------------------------------------------------------------------
Function: PRAE_fnc_deconFieldHQ

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target", "_player"];
_element = FieldHQs_Deployed find _target;
FieldHQs_Deployed deleteAt _element;
_target setVariable ["FieldHQ_Deployed", false];
[_target, true, [0, 3, 1], 0] call ace_dragging_fnc_setCarryable;
[_target,0] call BIS_fnc_dataTerminalAnimate;
[_target,0,["ACE_MainActions","Field_HQ_Sign"]] call ace_interact_menu_fnc_removeActionFromObject;
[_target,0,["ACE_MainActions","Field_HQ_Deconstruct"]] call ace_interact_menu_fnc_removeActionFromObject;
[_target,0,["ACE_MainActions","Field_HQ_Signout"]] call ace_interact_menu_fnc_removeActionFromObject;
deleteMarker (format["respawn_%1",(_target getVariable["FIELD_HQ_DES", Nil])]); //Temporary fix

_HQName = _target getVariable["FIELD_HQ_DES", Nil];
{
	if ((_x getVariable["FIELD_HQ_DES", Nil]) == _HQName) then {
		if (_x getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
			_x removeAllEventHandlers "Killed";
			_x removeAllEventHandlers "Respawn";
			_x setVariable["FIELD_HQ_Signed", false, true];
			_x setVariable["FIELD_HQ_DES", Nil, true];
			[_x, "PRAE Field HQ", format ["You have been signed out of a Field HQ as it was destroyed or deconstructed"]] call PRAE_fnc_sendHint;
		_x addEventHandler ["Killed",{
			PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
			[_x, true] call PRAE_fnc_praeKilled;
		}];
		_x addEventHandler ["Respawn",{[_x, (faction _x), true] call PRAE_fnc_praeRespawned}];
		}else{
			_x removeAllEventHandlers "Killed";
			_x removeAllEventHandlers "Respawn";
			_x setVariable["FIELD_HQ_Signed", false, true];
			_x setVariable["FIELD_HQ_DES", Nil, true];
			[_x, "PRAE Field HQ", format ["You have been signed out of a Field HQ as it was destroyed or deconstructed"]] call PRAE_fnc_sendHint;
			_x addEventHandler ["Killed",{[_x, false] call PRAE_fnc_praeKilled}];
			_x addEventHandler ["Respawn",{[_x, (faction _x), false] call PRAE_fnc_praeRespawned}];
		};
	};
}foreach allPlayers;

_fieldHQCreate = ["Field_HQ","Setup PRAE Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target, _player] call PRAE_fnc_setupFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQCreate] call ace_interact_menu_fnc_addActionToObject;