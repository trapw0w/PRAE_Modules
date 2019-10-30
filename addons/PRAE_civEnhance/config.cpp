class CfgPatches {
	class PRAE_civEnhance{
		requiredVersion = 0.1; //
      requiredAddons[] = {"cba_settings"};
	};
};

class Extended_PreInit_EventHandlers
{ 
   class PRAE_civEnhance
   {
      init = "call compile preprocessFileLineNumbers '\PRAE_civEnhance\XEH_preInit.sqf'";
   };
};

class cfgFunctions 
{   
   class PRAE 
   {
      class CIV_Enhancement
      {
         class addEvacCIV {file = "\PRAE_civEnhance\data\functions\fn_addEvacCIV.sqf";};
         class evacCIV {file = "\PRAE_civEnhance\data\functions\fn_evacCIV.sqf";};
      };
   };
};