
[
    "PRAE_civEnhance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable PRAE Civillian Enhancement", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0,
    {
        params ["_value"];
        if (_value) then {
            PRAE_civEnhance_enable = true;
        } else {
            PRAE_civEnhance_enable = false;
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_evacCIV", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Add PRAE Civ Evacuation to Blufor Vehicles", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    0,
    {
        params ["_value"];
        if (_value && PRAE_civEnhance_enable) then {
            PRAE_civEvac_enable = true;
            call PRAE_fnc_addEvacCIV;
        } else {
            if ((_value) && !(PRAE_civEnhance_enable)) exitWith {diag_log "[PRAE Evactuate Civilians] - Please enable PRAE Civilian Enhancement to use this feature"};
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;