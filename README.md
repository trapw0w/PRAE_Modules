# PRAE Modules

## PRAE Multispawn
### Description
PRAE Multispawn provides mission makers the ability to define custom respawn locations based on players faction. Similar to ALiVE Multispawn however, does not rely on Helicopter Insertion for faction based Multispawn. PRAE Multispawn has a toggleable option to respawn players with saved ALiVE gear.
### Technical Description
Using CBA postInit, `Killed` & `Respawned` event handlers are added to each player that will trigger relevant PRAE functions. Once event handlers are triggered, markers are located and players position is set using `setPos`.
### How To
Create a respawn marker on the map named `respawn_` followed by the players faction. Once a player dies, their location will be set to that marker. If a respawn marker doesn't exist for the faction, respawn location will default to the output of:
```sqf
_side = side player;
_markerPos = getMarkerPos format["respawn_%1", _side];
player setPos _markerPos;
```
### Example
`respawn_BLU_F` will respawn default BLUFOR units.
### Function Library 
Function | Description
------------ | -------------
`PRAE_fnc_praeKilled` | Function executed when player is Killed. This function is passed both the player and the status of PRAE_Multispawn_ALiVE_GEAR. Currently, _aliveGear has no use here.
`PRAE_fnc_praeRespawned` |  Function executed via event handler once a player has respawned. Checks the status of `PRAE_Multispawn_ALiVE_GEAR` and will use `ALiVE_fnc_getGear accordingly`. Player will be moved to the location of `_location` via `PRAE_fnc_praeSetPos`
`PRAE_fnc_praeSetPos` | Function used to `setPos` on a player given a marker location. This presumes that respawn markers have been placed using the players faction. (e.g. respawn_blu_f), if no marker is found, `setPos` will default to `respawn_(side player)`

## PRAE Enhanced Civilians 
### Description
PRAE Enhanced Civilians aims to add more of a gameplay focused interaction with Civilians. So far, BLUFOR personnel have the ability to Evacuate Civilians within a 200 metre radius of a loud speaker enabled BLUFOR vehicle. This is used to prevent loss of ALiVE reputation when opening fire within range of Civilians. 
### Technical Description
### How To
To add Interaction to all BLUFOR vehicles by default, enable `PRAE_evacBluforCIV` via CBA Addon Options. 
### Example
### Function Library 
Function | Description
------------ | -------------
`PRAE_fnc_evacCIV` | Code executed once player selects "PRAE Evac Civilians" on an Initialised vehicle. Will play a random audio file from `_sounds` array and disable the use of the action for 20 seconds.
`PRAE_fnc_addEvacCIV` | Function to add "PRAE Evac Civilians" ACE action to a given target
`PRAE_fnc_addBluforEvacCIV` | Function add ACE interaction to all BLUFOR vehicles that are not air assets. Will only be run via CBA Init if `PRAE_evacBluforCIV` is `True`.
`PRAE_fnc_addHaltAction` | Will add a "Halt" scroll wheel action to a given unit. This is `remoteExec'd` to all clients but NOT executed on the server.
`PRAE_fnc_addReleaseAction` | Will add a "Move along" scroll wheel action to a given unit. Again, this is `remoteExec'd` to all clients.
`PRAE_fnc_haltCiv` | Function disables the AI move behaviour. This is executed server side. This will then execute `PRAE_fnc_addReleaseAction` on all clients
`PRAE_fnc_releaseCiv` | Function re-enables the AI move behaviour. This is executed server side. This will then execute `PRAE_fnc_addHaltAction` on all clients
`PRAE_fnc_initHumanitarianAid` | Function adds ACE interactions for the ability to provide the `_unit` with Humanitarian Aid. This is recommended to be called from a `CBA` `Extended_Init_EventHandler` using `clientInit`
`PRAE_fnc_initHumanitarianActions` | Function adds a local, client side addAction to halt the given `_unit`. This is used for init so that the intial addition of the `addAction` is done client side to avoid double ups.
`PRAE_fnc_giveItem` | Function is used to give an item to a civilian. This takes input of the type (E.g. `humrat` or `water`), does a check to ensure the caller has the item, calls `PRAE_fnc_removeItem` and then has a 30% chance of reducing sector hostility. 
`PRAE_fnc_removeItem` | Function will take the input of `_player` and `_item`. `_item` is expected as a class name. Function will remove `_item` from `_player`'s inventory if present



## PRAE FieldHQ

## PRAE Utilities
### Function Library 
Function | Description
------------ | -------------
`PRAE_fnc_sendHint` |  Generic function to `sendHint` to player. Takes input of `_player` as the object, `_module` as the calling module (e.g. `PRAE_FIELD_HQ`) & `_message` as the string to display on the hint dialog.
`PRAE_fnc_setData` | Function to store custom variables within ALiVE persistence. Takes input of `_local` to check if persistence is done locally, `_customVar` as your custom variable name & `_value` as your data to store to `_customVar`
`PRAE_fnc_getData` | Function to get custom variables data within ALiVE persistence. Takes `_local` to check if persistence is done locally & `_customVar` as the variable name that the data is stored to. Returns `_value`
`PRAE_fnc_addEventHandler` | Function is used to add an `eventHandler` to a given object. Expects `_object`, `_event` & `_script`
`PRAE_fnc_removeEventHandler` | Function to remove a given `eventHandler` from an object. Takes both `_object` & `_event` as params
`PRAE_fnc_sendDebug` | Function is used to `remoteExec` a `diag_log` to the server. Takes input of `_function` & `_message`

## PRAE Insignia
