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

// Set Custom Fatigue Settings
player setCustomAimCoef 0.6;
player setAnimSpeedCoef 1;
player allowSprint true;
player forceWalk false;
player SetStamina 120;
setStaminaScheme "Normal";

//Backup just in case.
FP_oldAce_detonate = ACE_explosives_fnc_detonateExplosive;

// Init the Spawn Protection
player addEventHandler ["Respawn", {
  [_this select 0] remoteExecCall ["FP_fnc_addToCurators", 2];
  waitUntil {alive player};
  if (primaryWeapon player != "") then {[{player switchMove "amovpercmstpslowwrfldnon";}, []] call ACE_common_fnc_execNextFrame;};
  [] spawn {
    LASTSTATUS = false;
    while {alive player} do {
      _shouldBlock = false;
      if ((player distance2D SPAWNBOARD) < 20) then {_shouldBlock = true;} else {_shouldBlock = false;};
      
      if (!(LASTSTATUS isEqualTo _shouldBlock)) then {
        [player, _shouldBlock] call FP_fnc_disableWeapons;
        LASTSTATUS = _shouldBlock;
      };

      sleep 5;
    };
  };
}];