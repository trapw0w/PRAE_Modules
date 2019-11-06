class CfgPatches {
	class PRAE_Utilities{
		requiredVersion = 0.1; //
      requiredAddons[] = {"cba_settings"};
      units[] = {};
      weapons[] = {};
	};
};

class cfgFunctions 
{   
   class PRAE 
   {
      class PRAE_Utilities
      {
         class sendHint {file = "\PRAE_Utilities\data\functions\fn_sendHint.sqf";};
         class getData {file = "\PRAE_Utilities\data\functions\fn_getData.sqf";};
         class setData {file = "\PRAE_Utilities\data\functions\fn_setData.sqf";};
         class sendDebug {file = "\PRAE_Utilities\data\functions\fn_sendDebug.sqf";};
         class addEventHandler {file = "\PRAE_Utilities\data\functions\fn_addEventHandler.sqf";};
         class removeEventHandler {file = "\PRAE_Utilities\data\functions\fn_removeEventHandler.sqf";};
      };
   };
};