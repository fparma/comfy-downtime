/*
  Executed only on server when mission is started.
  See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
    for details about when the script is exactly executed.
*/

// Create AI centers
private _allUnits = allUnits;
private _sideHasNoUnits = {
  params ["_side"];
  (({if ((side _x) isEqualTo _side) exitWith {1}} count _allUnits) isEqualTo 0)
};
if ([east] call _sideHasNoUnits) then {createCenter east};
if ([west] call _sideHasNoUnits) then {createCenter west};
if ([resistance] call _sideHasNoUnits) then {createCenter resistance};
if ([civilian] call _sideHasNoUnits) then {createCenter civilian};

// Add all objects to the curator on mission begin
{
  private _curator = _x;
  _curator addCuratorEditableObjects [vehicles,true];
  _curator addCuratorEditableObjects [(allMissionObjects "CAManBase"),false];
  _curator addCuratorEditableObjects [(allMissionObjects "Air"),true];
  _curator addCuratorEditableObjects [(allMissionObjects "Ammo"),false];
  _curator setCuratorWaypointCost 0;
  {_curator setCuratorCoef [_x, 0]} forEach ["place","edit","delete","destroy","group","synchronize"];
} forEach allCurators;

// Init Dynamic Group Manager
["Initialize", [true]] call BIS_fnc_dynamicGroups;

//Init the Spawn
[] spawn FPC_fnc_initSpawn;