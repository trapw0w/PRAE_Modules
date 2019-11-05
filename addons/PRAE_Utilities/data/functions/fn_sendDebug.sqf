/* ----------------------------------------------------------------------------
Function: PRAE_fnc_sendDebug

Description:
	Function to send debug output to RPT

Parameters:
	_local - Calling function, this will be displayed in brackets for debug purposes
	_message - Message to send to RPT

Returns:
	N/A

Examples:
    ["PRAE_fnc_praeGetData", "Traceback: No data found within _value"] call PRAE_fnc_sendDebug;
		
Author: trapw0w

---------------------------------------------------------------------------- */

params["_function", "_message"];

format["[%1] - %2", _function, _message] remoteExec ["diag_log", 2];