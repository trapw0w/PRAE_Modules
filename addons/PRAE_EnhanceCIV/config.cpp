#include "eventhandlers.hpp"

class CfgPatches {
	class PRAE_EnhanceCIV{
		requiredVersion = 0.1; //
      requiredAddons[] = {"cba_settings", "ALIVE_main", "ace_main", "ace_modules"};
      units[] = {};
      weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers
{ 
   class PRAE_EnhanceCIV
   {
      init = "call compile preprocessFileLineNumbers '\PRAE_EnhanceCIV\XEH_preInit.sqf'";
   };
};

class cfgFunctions 
{   
   class PRAE 
   {
      class CIV_Enhancement
      {
         class addEvacCIV {file = "\PRAE_EnhanceCIV\data\functions\evacuation\fn_addEvacCIV.sqf";};
         class addBluforEvacCIV {file = "\PRAE_EnhanceCIV\data\functions\evacuation\fn_addBluforEvacCIV.sqf";};
         class evacCIV {file = "\PRAE_EnhanceCIV\data\functions\evacuation\fn_evacCIV.sqf";};
         class initHumanitarianAid {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_initHumanitarianAid.sqf";};
         class giveItem {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_giveItem.sqf";};
         class removeItem {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_removeItem.sqf";};
         class addHaltAction {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_addHaltAction.sqf";};
         class addReleaseAction {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_addReleaseAction.sqf";};
         class haltCiv {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_haltCiv.sqf";};
         class releaseCiv {file = "\PRAE_EnhanceCIV\data\functions\humanitarian\fn_releaseCiv.sqf";};
      };
   };
};