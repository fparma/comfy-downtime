params ["_player", "_isJip"];

// Add JIP players to zeus
if (_isJip) then {[_player] remoteExecCall ["FP_fnc_addToCurators", 2]};

//Init the Player for the Dynamic Group System
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups; 

// Fix so player cant join ENEMY side, where all sides fires on him
player addEventHandler ["HandleRating", {abs (_this select 1);}];

// Init the Spawn Protection
player addEventHandler ["Respawn", {
  [_this select 0] remoteExecCall ["FP_fnc_addToCurators", 2];
  
  // Set Custom Fatigue Settings
  player setCustomAimCoef 0.6;
}];