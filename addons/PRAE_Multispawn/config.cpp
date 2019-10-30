class CfgPatches {
	class PRAE_Multispawn{
		requiredVersion = 0.1; //
      requiredAddons[] = {"cba_settings"};
	};
};

class Extended_PreInit_EventHandlers
{ 
   class PRAE_Multispawn
   {
      init = "call compile preprocessFileLineNumbers '\PRAE_Multispawn\XEH_preInit.sqf'";
   };
};