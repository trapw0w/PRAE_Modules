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


if ((PRAE_HUMRATS) && (side _unit == CIVILIAN)) then {
	_giveHumrat = ["GIVE_HUMRAT","Give Humanitarian Ration","",{
		params ["_target", "_player", "_params"];
		[_target, _player, "humrat"] spawn PRAE_fnc_giveItem;
	},{true}] call ace_interact_menu_fnc_createAction;

	_giveWater = ["GIVE_WATER","Give Water","",{
		params ["_target", "_player", "_params"];
		[_target, _player, "water"] spawn PRAE_fnc_giveItem;
	},{true}] call ace_interact_menu_fnc_createAction;

	[_unit, 0, ["ACE_MainActions"], _giveHumrat] call ace_interact_menu_fnc_addActionToObject;
    [_unit, 0, ["ACE_MainActions"], _giveWater] call ace_interact_menu_fnc_addActionToObject;

};
