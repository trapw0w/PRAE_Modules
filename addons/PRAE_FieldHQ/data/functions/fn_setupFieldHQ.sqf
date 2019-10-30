/* ----------------------------------------------------------------------------
Function: PRAE_fnc_setupFieldHQ

Description:

Parameters:

Returns:

Examples:
    (begin example)

    (end)

Author: Lewis

---------------------------------------------------------------------------- */
params ["_target"];

[_target,0,["ACE_MainActions","Field_HQ"]] call ace_interact_menu_fnc_removeActionFromObject;

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

_fieldHQsignin = ["Field_HQ_Sign","Sign in to Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target] call PRAE_fnc_signFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

_fieldHQDecon = ["Field_HQ_Deconstruct","Deconstruct Field HQ","",{
	params ["_target", "_player", "_params"];
	[_target] call PRAE_fnc_deconFieldHQ;
},{true}] call ace_interact_menu_fnc_createAction;

[_target, 0, ["ACE_MainActions"], _fieldHQsignin] call ace_interact_menu_fnc_addActionToObject;
[_target, 0, ["ACE_MainActions"], _fieldHQDecon] call ace_interact_menu_fnc_addActionToObject;