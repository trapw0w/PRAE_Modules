
[
    "PRAE_fieldHQ_Enable", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable PRAE Field HQ", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules - Field HQ", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, 
    1,// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        if (_value) then {
            PRAE_fieldHQ_enable = true;
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_fieldHQ_Add", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Add PRAE Field HQ interactions to object (variable)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules - Field HQ", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '',
    1,// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        if (PRAE_fieldHQ_enable) then {
			_values = _value splitString ",";
            [_values] call PRAE_fnc_addFieldHQ;
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "PRAE_fieldHQ_Limit", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Number of Field HQ's active at once", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "PRAE Modules - Field HQ", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 4, 1, 0],
    nil,// "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        PRAE_fieldHQ_Limit = _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;