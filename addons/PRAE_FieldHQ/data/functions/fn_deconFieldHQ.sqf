/* ----------------------------------------------------------------------------
Function: PRAE_fnc_deconFieldHQ

Description:
Function to deconstruct the PRAE Field HQ, removes relevent event handlers from players who were signed into the HQ and adding back the original
interactions to the Field HQ object to carry and set it up again.
Parameters:
[_target] - _target is a reference to the object which will be deconstructed.
Returns:

Examples:

[_target] call PRAE_fnc_deconFieldHQ;

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target", "_player"];
// Remove this Field HQ from the array of deployed Field HQs
_element = FieldHQs_Deployed find _target;
FieldHQs_Deployed deleteAt _element;
_target setVariable ["FieldHQ_Deployed", false];
// Allow the Field HQ to be ACE Carried by players again.
[_target, true, [0, 3, 1], 0] call ace_dragging_fnc_setCarryable;
// Animate the object to close down.
[_target,0] call BIS_fnc_dataTerminalAnimate;
// Remove possible interactions from the Field HQ.
[_target,0,["ACE_MainActions","Field_HQ_Sign"]] call ace_interact_menu_fnc_removeActionFromObject;
[_target,0,["ACE_MainActions","Field_HQ_Deconstruct"]] call ace_interact_menu_fnc_removeActionFromObject;
[_target,0,["ACE_MainActions","Field_HQ_Signout"]] call ace_interact_menu_fnc_removeActionFromObject;
// Alert player deconstructing that it has been deconstructed succesfully
[_player, "PRAE Field HQ", "You have successfully deconstructed this Field HQ"] call PRAE_fnc_sendHint;
// Remove the respawn marker assigned to the Field HQ.
deleteMarker (format["respawn_%1",(_target getVariable["FIELD_HQ_DES", Nil])]); //Temporary fix

//Get the specific HQ name of this object to check players against.
_HQName = _target getVariable["FIELD_HQ_DES", Nil];
{
	// Check to see if the player is signed into the Field HQ.
	if ((_x getVariable["FIELD_HQ_DES", Nil]) == _HQName) then {
		// Check to see if ALiVE Gear settings are being utilised and remove event handlers.
		if (_x getVariable["PRAE_USE_ALIVE_GEAR", false]) then {
			_x removeAllEventHandlers "Killed";
			_x removeAllEventHandlers "Respawn";
			_x setVariable["FIELD_HQ_Signed", false, true];
			_x setVariable["FIELD_HQ_DES", Nil, true];
			[_x, "PRAE Field HQ", format ["You have been signed out of a Field HQ as it was destroyed or deconstructed"]] call PRAE_fnc_sendHint;
		// Add original event handlers to players who were signed into this Field HQ.
		_x addEventHandler ["Killed",{
			PLAYERGEAR = [objNull, [(_this select 0)]] call ALiVE_fnc_setGear;
			[(_this select 0), true] call PRAE_fnc_praeKilled;
		}];
		_x addEventHandler ["Respawn",{[(_this select 0), (faction (_this select 0)), true] call PRAE_fnc_praeRespawned}];
		}else{
		// If ALiVE Gear settings are not being used then just remove event handlers and not use ALiVE gear set.
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

// Add Setup Interaction back onto the Field HQ object.
_fieldHQCreate = ["Field_HQ","Setup PRAE Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target, _player] call PRAE_fnc_setupFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQCreate] call ace_interact_menu_fnc_addActionToObject;