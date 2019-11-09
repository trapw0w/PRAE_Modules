class Extended_Init_EventHandlers
{
    class MAN
    {
        class ADDON
        {
            Init = "_this spawn PRAE_fnc_initHumanitarianActions";
            clientInit = "_this call PRAE_fnc_initHumanitarianAid";
        };
    };

    class Car_F
    {
        class ADDON 
        {
            clientInit = "_this call PRAE_fnc_addBluforEvacCIV";
        };
    };
};