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
      };
   };
};