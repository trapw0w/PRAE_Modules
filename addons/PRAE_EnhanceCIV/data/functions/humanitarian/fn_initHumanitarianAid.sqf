/* ----------------------------------------------------------------------------
Function: PRAE_fnc_initHumanitarianAid

Description:
	Function to initialise the use of ACEX Humanitarian Rations & Water

Parameters:
	_unit - Object in which we will add the ACE interact to

Returns:
	N/A

Examples:
    Given _target will have ACE Action "Give Humanitarian Ration" & "Give Water" applied to it
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_unit"];

// Check if PRAE Humanitarian Aid is enabled & that the object is Civilian
if ((PRAE_HUMRATS) && (side _unit == CIVILIAN)) then {

	// Generate both water and humanitarian ration ACE actions
	_giveHumrat = ["GIVE_HUMRAT","Give Humanitarian Ration","",{
		params ["_target", "_player", "_params"];
		[_target, _player, "humrat"] spawn PRAE_fnc_giveItem;
	},{true}] call ace_interact_menu_fnc_createAction;

	_giveWater = ["GIVE_WATER","Give Water","",{
		params ["_target", "_player", "_params"];
		[_target, _player, "water"] spawn PRAE_fnc_giveItem;
	},{true}] call ace_interact_menu_fnc_createAction;

	// Apply ACE interactions to object
	[_unit, 0, ["ACE_MainActions"], _giveHumrat] call ace_interact_menu_fnc_addActionToObject;
    [_unit, 0, ["ACE_MainActions"], _giveWater] call ace_interact_menu_fnc_addActionToObject;

	// Add ability to halt unit
	_condition = "alive _unit" + "&&" + "!(_unit getvariable ['target_halted',false])";

	_unit addAction ["Halt Civilian", {
		params ["_unit", "_caller", "_actionId"];
		//_unit removeAction _actionId;
		[_unit, _actionId] remoteExec ["removeAction", 2, true];
		_unit setVariable["target_halted", true, true];
		[_unit, _caller] call PRAE_fnc_haltCiv;
	}, [], 1, false, true, "", _condition, 3];
	
	
	//[_unit] remoteExec["PRAE_fnc_addHaltAction", 2, true];
};
