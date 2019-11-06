/* ----------------------------------------------------------------------------
Function: PRAE_fnc_removeItem

Description:
	Function to remove an item from a players inventory

Parameters:
	_player - Player object to remove item from 
	_item - Item to remove from players inventory

Returns:
	N/A

Examples:
    [player, "ACE_Humanitarian_Ration_Item"] call PRAE_fnc_removeItem;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_player", "_item"];

if !(_item in items _player) exitWith {[_player, "PRAE Civilian Enhancements", format["You do not have %1 in your inventory!", _item]] call PRAE_fnc_sendHint};

_player removeItem _item;