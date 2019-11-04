
[
    "PRAE_Multispawn", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable PRAE Multispawn", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules - Multispawn", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if ((_value) && !(PRAE_Multispawn_ALiVE_GEAR)) then {
            player addEventHandler ["Killed",{[player, false] call PRAE_fnc_praeKilled}];
			player addEventHandler ["Respawn",{[player, (faction player), false] call PRAE_fnc_praeRespawned}];
					
			format["[PRAE Multispawn] - Event Handlers added to %1", player] remoteExec ["diag_log", 2];
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_Multispawn_ALiVE_GEAR", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable ALiVE Gear Save", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules - Multispawn", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if (_value) then {
            player setVariable["PRAE_USE_ALIVE_GEAR", true, true];
            player addEventHandler ["Killed",{
                PLAYERGEAR = [objNull, [_this select 0]] call ALiVE_fnc_setGear;
                [player, true] call PRAE_fnc_praeKilled
            }];
			player addEventHandler ["Respawn",{[player, (faction player), true] call PRAE_fnc_praeRespawned}];
			format["[PRAE Multispawn] - ALiVE Event Handlers added to %1", player] remoteExec ["diag_log", 2];
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;