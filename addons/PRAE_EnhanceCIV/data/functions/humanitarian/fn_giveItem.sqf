/* ----------------------------------------------------------------------------
Function: PRAE_fnc_giveItem

Description:
	Gives and item to a Civilian, removes item from player and then has a chance to reduce hostility	

Parameters:
	_target - Object to give an item to 
	_player - Object to remove item from
	_type - Type of object to give/remove. Needs to be created under the switch statement

Returns:
	N/A

Examples:
    [_object, _player, "humrat"] call PRAE_fnc_giveItem;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_target", "_player", "_type"];



switch (_type) do {

	case "humrat": {
		// Exit if player doesn't have a humrat
		if !("ACE_Humanitarian_Ration" in items _player) exitWith {[_player, "PRAE Enhanced Civilians", "You do not have a Humanitarian Ration to give this civ!"] call PRAE_fnc_sendHint};
		
		// Grab amount of humrats the Civilian has been given (Global)
		_countHumrat = _target getVariable["AMOUNT_HUMRATS", 0];
		// Exit if its too many
		if !(_countHumrat < 2) exitWith {[_player, "PRAE Enhanced Civilians", "You have already given this Civilian too many Humanitarian Rations.. Please move on"] call PRAE_fnc_sendHint};
		
		// Play action & remove item
		_player playAction "putdown";
		[_player, "ACE_Humanitarian_Ration"] call PRAE_fnc_removeItem;
		sleep 1;
		_target playAction "putdown";

		// Increase total humrats the Civilian has been handed
		_target setVariable["AMOUNT_HUMRATS", (_countHumrat + 1)];
		
		// 30% chance that this act will reduce sector hostility by -10
		if (30 > random 100) then {
			[getPos _player, [side _player], -10] call ALIVE_fnc_updateSectorHostility;
		};

	};

	case "water": {
		// Exit if player doesn't have a water bottle
		if !("ACE_WaterBottle" in items _player) exitWith {[_player, "PRAE Enhanced Civilians", "You do not have a bottle of water to give this civ!"] call PRAE_fnc_sendHint};

		// Grab amount of Water bottles the Civilian has been given (Global)
		_countWater = _target getVariable["AMOUNT_WATER", 0];
		// Exit if its too many
		if !(_countWater < 3) exitWith {[_player, "PRAE Enhanced Civilians", "You have already given this Civilian too much Water.. Please move on"] call PRAE_fnc_sendHint};

		// Play action & remove item
		_player playAction "putdown";
		[_player, "ACE_WaterBottle"] call PRAE_fnc_removeItem;
		sleep 1;
		_target playAction "putdown";

		// Increase total water bottles the Civilian has been handed
		_target setVariable["AMOUNT_WATER", (_countWater + 1)];

		// 30% chance that this act will reduce sector hostility by -10
		if (30 > random 100) then {
			[getPos _player, [side _player], -10] call ALIVE_fnc_updateSectorHostility;
		};
	};
};