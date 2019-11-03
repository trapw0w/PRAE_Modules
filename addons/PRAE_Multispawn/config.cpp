class CfgPatches {
	class PRAE_Multispawn{
		requiredVersion = 0.1; //
      requiredAddons[] = {"cba_settings"};
      units[] = {};
      weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers
{ 
   class PRAE_Multispawn
   {
      init = "call compile preprocessFileLineNumbers '\PRAE_Multispawn\XEH_preInit.sqf'";
   };
};

class cfgFunctions 
{   
   class PRAE 
   {
      class PRAE_Multispawn
      {
         class praeKilled {file = "\PRAE_Multispawn\data\functions\fn_praeKilled.sqf";};
         class praeRespawned {file = "\PRAE_Multispawn\data\functions\fn_praeRespawned.sqf";};
         class praeSetPos {file = "\PRAE_Multispawn\data\functions\fn_praeSetPos.sqf";};
      };
   };
};