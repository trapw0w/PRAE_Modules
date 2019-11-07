/* ----------------------------------------------------------------------------
Function: PRAE_fnc_setupFieldHQ

Description:
Setup the Field HQ and it's actions for players to interact with.
Parameters:
[_target, _player] - _target is a reference to the object which will be setup as a PRAE Field HQ. _player is a temporary reference 
to the player who has setup the HQ to reference vital variables on.
Returns:
Nil
Examples:

[_target, _player] call PRAE_fnc_setupFieldHQ;

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target","_player"];
if !((count(FieldHQs_Deployed))>= PRAE_fieldHQ_Limit) then {
    [_target,0,["ACE_MainActions","Field_HQ"]] call ace_interact_menu_fnc_removeActionFromObject;
    _target addEventHandler ["Killed",{[(_this select 0)] call PRAE_fnc_destFieldHQ}];
    [_target,3] call BIS_fnc_dataTerminalAnimate;

    with uiNamespace do {
        disableserialization;
        _target setObjectTexture [0,""];
        1100 cutRsc ["RscMissionScreen","PLAIN"];
        _scr = BIS_RscMissionScreen displayCtrl 1100;
        _scr ctrlSetPosition [-10,-10,0,0];
        _scr ctrlSetText "";
        _scr ctrlAddEventHandler ["VideoStopped", {
            (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
        }];
        _scr ctrlCommit 0;
    };

    _target setVariable ["FieldHQ_Deployed", true];
    _target setvariable ["ALiVE_SYS_LOGISTICS_DISABLE",true];
	[_target, false, [0, 3, 1], 0] call ace_dragging_fnc_setCarryable;
    FieldHQs_Deployed pushback _target;
    
    _postion = [(getPosASL _target), 1, 5, 1, 0] call BIS_fnc_findSafePos;
    _markerName = (format["respawn_FieldHQ%1",(count(FieldHQs_Deployed))]);
    _tempname = (format["FieldHQ%1",(count(FieldHQs_Deployed))]);
    _marker = createMarker [_markerName, _postion];
    _marker setMarkerType "respawn_inf";
    _marker setMarkerAlpha 0;

    _player setVariable["FIELD_HQ", _tempname, true];
    _target setVariable["FIELD_HQ_DES", _tempname, true];
    _fieldHQsignin = ["Field_HQ_Sign","Sign in to Field HQ","",{
        params ["_target", "_player", "_params"];
        [_target, _player] call PRAE_fnc_signFieldHQ;
    },{true}] call ace_interact_menu_fnc_createAction;

    _fieldHQDecon = ["Field_HQ_Deconstruct","Deconstruct Field HQ","",{
        params ["_target", "_player", "_params"];
        [_target, _player] call PRAE_fnc_deconFieldHQ;
    },{true}] call ace_interact_menu_fnc_createAction;

    [_target, 0, ["ACE_MainActions"], _fieldHQsignin] call ace_interact_menu_fnc_addActionToObject;
    [_target, 0, ["ACE_MainActions"], _fieldHQDecon] call ace_interact_menu_fnc_addActionToObject;
}else{
    [_player, "PRAE Field HQ", format ["There are already %1 Field HQ's deployed. Deconstruct one first and try again.",PRAE_fieldHQ_Limit]] call PRAE_fnc_sendHint;
};