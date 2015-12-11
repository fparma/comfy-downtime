/*
  Executed locally when player joins mission (includes both mission start and JIP).
  See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
    for details about when the script is exactly executed.

  Parameters:
    0 - Player object
    1- Did player JiP
*/

params ["_player", "_isJip"];

[] call compile preProcessFileLineNumbers "base\initPlayer.sqf";

// Add JIP players to zeus
if (_isJip) then {[_player] remoteExecCall ["FP_fnc_addToCurators", 2]};

//Init the Player for the Dynamic Group System
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups; 