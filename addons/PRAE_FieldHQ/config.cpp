class CfgPatches {
    class PRAE_fieldHQ{
	    requiredVersion = 0.1;
        requiredAddons[] = {"cba_settings"};
        units[] = {};
        weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers
{ 
   class PRAE_fieldHeadQuaters
   {
      init = "call compile preprocessFileLineNumbers '\PRAE_FieldHQ\XEH_preInit.sqf'";
   };
};

class cfgFunctions 
{   
   class PRAE 
   {
      class PRAE_fieldHQs
      {
         class addFieldHQ {file = "\PRAE_FieldHQ\data\functions\fn_addFieldHQ.sqf";};
         class setupFieldHQ {file = "\PRAE_FieldHQ\data\functions\fn_setupFieldHQ.sqf";};
         class signFieldHQ {file = "\PRAE_FieldHQ\data\functions\fn_signFieldHQ.sqf";};
         class deconFieldHQ {file = "\PRAE_FieldHQ\data\functions\fn_deconFieldHQ.sqf";};
      };
   };
};