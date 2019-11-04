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
         class praeSendHint {file = "\PRAE_Utilities\data\functions\fn_praeSendHint.sqf";};
         class praeGetData {file = "\PRAE_Utilities\data\functions\fn_praeGetData.sqf";};
         class praeSetData {file = "\PRAE_Utilities\data\functions\fn_praeSetData.sqf";};
         class praeSendDebug {file = "\PRAE_Utilities\data\functions\fn_praeSendDebug.sqf";};
      };
   };
};