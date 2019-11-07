/* ----------------------------------------------------------------------------
Function: PRAE_fnc_destFieldHQ

Description:
Function to be called when a Field HQ is destroyed. This function removes all event handlers from players signed into the HQ similar to the deconstruction function.
Parameters:
[_unit] - This is a reference to the object that has been destroyed. It is passed from the "Killed" event handler.
Returns:
Nil
Examples:

_object addEventHandler ["Killed",{[(_this select 0)] call PRAE_fnc_destFieldHQ}];

Author: Lewis

---------------------------------------------------------------------------- */
params ["_unit"];

_element = FieldHQs_Deployed find _unit;
FieldHQs_Deployed deleteAt _element;
_unit setVariable ["FieldHQ_Deployed", false];
[_unit, true, [0, 3, 1], 0] call ace_dragging_fnc_setCarryable;
[_unit,0] call BIS_fnc_dataTerminalAnimate;
[_unit,0,["ACE_MainActions","Field_HQ_Sign"]] call ace_interact_menu_fnc_removeActionFromObject;
[_unit,0,["ACE_MainActions","Field_HQ_Deconstruct"]] call ace_interact_menu_fnc_removeActionFromObject;
[_unit,0,["ACE_MainActions","Field_HQ_Signout"]] call ace_interact_menu_fnc_removeActionFromObject;
deleteMarker (format["respawn_%1",(_unit getVariable["FIELD_HQ_DES", Nil])]); //Temporary fix

_HQName = _unit getVariable["FIELD_HQ_DES", Nil];
diag_log format ["%1",_HQName];
{
	if ((_x getVariable["FIELD_HQ_DES", Nil]) == _HQName) then {
		if (_x getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
			_x removeAllEventHandlers "Killed";
			_x removeAllEventHandlers "Respawn";
			_x setVariable["FIELD_HQ_Signed", false, true];
			_x setVariable["FIELD_HQ_DES", Nil, true];
			[_x, "PRAE Field HQ", format ["You have been signed out of a Field HQ as it was destroyed or deconstructed"]] call PRAE_fnc_sendHint;
		_x addEventHandler ["Killed",{
			PLAYERGEAR = [objNull, [(_this select 0)]] call ALiVE_fnc_setGear;
			[(_this select 0), true] call PRAE_fnc_praeKilled;
		}];
		_x addEventHandler ["Respawn",{[(_this select 0), (faction (_this select 0)), true] call PRAE_fnc_praeRespawned}];
		}else{
			_x removeAllEventHandlers "Killed";
			_x removeAllEventHandlers "Respawn";
			_x setVariable["FIELD_HQ_Signed", false, true];
			_x setVariable["FIELD_HQ_DES", Nil, true];
			[_x, "PRAE Field HQ", format ["You have been signed out of a Field HQ as it was destroyed or deconstructed"]] call PRAE_fnc_sendHint;
			_x addEventHandler ["Killed",{[(_this select 0), false] call PRAE_fnc_praeKilled}];
			_x addEventHandler ["Respawn",{[(_this select 0), (faction (_this select 0)), false] call PRAE_fnc_praeRespawned}];
		};
	};
}foreach allPlayers;