/*
  Executed locally when player joins mission (includes both mission start and JIP).
  See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
    for details about when the script is exactly executed.

  Parameters:
    0 - Player object
    1- Did player JiP
*/

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
  
  [] spawn {
    player allowDamage false;
    while {alive player} do {
      if ((player distance2D SPAWNBOARD) < 100) then {player allowDamage false;} else {player allowDamage true;};
      sleep 5;
    };
  };
}];