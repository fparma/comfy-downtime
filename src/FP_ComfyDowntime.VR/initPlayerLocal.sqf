/*
	Executed locally when player joins mission (includes both mission start and JIP).
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.

	Parameters:
		0 - Player object
		1- Did player JiP
*/

if (!hasInterface) exitWith {};
_isJip = _this select 1;

// Add JIP players to zeus
if (_isJip) then {[player, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;};

//Init the Player for the Dynamic Group System
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups; 