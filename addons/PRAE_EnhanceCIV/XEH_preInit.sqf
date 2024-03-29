/*
Description:
    CBA preInit handler, being used to add Addon Options to the game

Author:
    trapw0w
*/
[
    "PRAE_EnhanceCIV", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable PRAE Civillian Enhancement", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0,
    {
        params ["_value"];
        if (_value) then {
            PRAE_EnhanceCIV_enable = true;
        } else {
            PRAE_EnhanceCIV_enable = false;
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_evacBluforCIV", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Add PRAE Civ Evacuation to Blufor Vehicles", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0,
    {
        params ["_value"];
        if (_value && PRAE_EnhanceCIV_enable) then {
            PRAE_civEvac_enable = true;
        } else {
            if ((_value) && !(PRAE_EnhanceCIV_enable)) exitWith {diag_log "[PRAE Evactuate Civilians] - Please enable PRAE Civilian Enhancement to use this feature"};
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_HUMRATS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable the use of Humanitarian Rations/Water", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0] call CBA_Settings_fnc_init;