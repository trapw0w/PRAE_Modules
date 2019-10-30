// Grab the module logic passed from config.cpp
_module = param [0];

// Grab the boolean that holds the value of PRAE multispawn on/off
_enabled = _module getVariable["Multispawn_Enabled",false];
format["[PRAE Mutlispawn] - PRAE Multispawn is %1", _enabled] remoteExec ["diag_log", 2];

// Grab the boolean that holds the value of ALiVE gear save
_aliveEnabled = _module getVariable["ALiVE_Enabled",false];
format["[PRAE Mutlispawn] - ALiVE Gear save is %1", _enabled] remoteExec ["diag_log", 2];

if (_enabled) then {
	addMissionEventHandler ["EntityKilled", 
	{
		format["[PRAE Multispawn] - Added EntityKilled EH to %1",(this select 0)];
		[(this select 0)] call PRAE_fnc_praeKilled;
	}];
	addMissionEventHandler ["EntityRespawned", 
	{
		format["[PRAE Multispawn] - Added EntityRespawned EH to %1",(this select 0)];
		[(this select 0)] call PRAE_fnc_praeRespawned;
	}];
};

