
[
    "PRAE_Multispawn", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable PRAE Multispawn", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0,
    {  
        params["_value"];
        if (_value) then {
            player addEventHandler ["Killed",{[player] call PRAE_fnc_praeKilled}];
			player addEventHandler ["Respawn",{[player] call PRAE_fnc_praeRespawned}];
					
			format["[PRAE Multispawn] - Event Handlers added to %1", player] remoteExec ["diag_log", 2];
        } else {
            format["[PRAE Multispawn] - I'm stupid and value is %1", _value] remoteExec ["diag_log", 2];
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;