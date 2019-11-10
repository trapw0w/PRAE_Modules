/* ----------------------------------------------------------------------------
Function: PRAE_fnc_sendHint

Description:
	Generic function to sendHint to player

Parameters:
	_player - Object that you wish to send the hint to
	_module - Module that the hint has been sent from
	_message - Message to send to client

Returns:
	N/A

Examples:
    [player, "PRAE Field HQ", "You have successfully signed into the Field HQ. Please check back later for further information"] call PRAE_fnc_sendHint;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_player", "_module", "_message"];
_image = "<img size='6' image='\PRAE_Utilities\data\images\prae_logoSmall.paa' align='center'/>";
_hintOutput = _image + "<br/><t color='#ff0000'>" + _module + "</t><br/><br/><t size='1.0' shadow='1' shadowColor='#000000' align='center'>" + _message + "</t><br/><br/>";
hint parseText (_hintOutput)