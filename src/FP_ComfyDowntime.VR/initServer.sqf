
// Create AI Center
private _allUnits = allUnits;
private _sideHasNoUnits = {
  params ["_side"];
  (({if ((side _x) isEqualTo _side) exitWith {1}} count _allUnits) isEqualTo 0)
};
if ([east] call _sideHasNoUnits) then {createCenter east};
if ([west] call _sideHasNoUnits) then {createCenter west};
if ([resistance] call _sideHasNoUnits) then {createCenter resistance};
if ([civilian] call _sideHasNoUnits) then {createCenter civilian};

// Init Dynamic Group Manager
["Initialize", [true]] call BIS_fnc_dynamicGroups;

//Init the Spawn
[] spawn FPC_fnc_initSpawn;

// Init Headless Client Tracker
[] call FPC_fnc_initHC;