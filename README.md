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
`PRAE_fnc_setPos` | Function used to `setPos` on a player given a marker location. This presumes that respawn markers have been placed using the players faction. (e.g. respawn_blu_f), if no marker is found, `setPos` will default to `respawn_(side player)`

## PRAE Enhance Civilian 
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

## PRAE FieldHQ

## PRAE Utilities
### Function Library 
Function | Description
------------ | -------------
`PRAE_fnc_praeSendHint` |  Generic function to `sendHint` to player. Takes input of `_player` as the object, `_module` as the calling module (e.g. `PRAE_FIELD_HQ`) & `_message` as the string to display on the hint dialog.

## PRAE Insignia
