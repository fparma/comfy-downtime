params ["_pos"];
_param_distance = ["ParadropMaxDistEnemy"] call BIS_fnc_getParamValue;

_exit = false;
if (_param_distance > 0) then {
  _units = allUnits select {alive _x && {!((side _x) in [side group player, civilian])}};
  _close = _units select {((getPosATL _x) select 2) < 10 && {(_x distance _pos) < _param_distance}};
  _exit = count _close > 0;
};

if (_exit) exitWith {
  hintC format ["Cannot paradrop with enemies within %1m", _param_distance];
};

player setPos [_pos select 0, _pos select 1, (_pos select 2) + 600];

// Get Loadout the player currently has
_backpack_type = backpack player;
_backpack_items = getItemCargo (unitBackpack player);
_backpack_weaps = getWeaponCargo (unitBackpack player);
_backpack_magas = getMagazineCargo (unitBackpack player);
_headgear = headgear player;

// Replace Loadout with Paradrop fitting gear
removeBackpack player;
removeHeadgear player;
player addBackpack "B_Parachute";
player addHeadgear "H_CrewHelmetHeli_B";

sleep 5;
waitUntil { isTouchingGround player || !alive player};
if (!alive player) exitWith {};

// Reapply gear we had before the jump
removeBackpack player;
removeHeadgear player;
player addBackpack _backpack_type;
player addHeadgear _headgear;

_bp = unitBackpack player;
if (count (_backpack_weaps select 0) > 0) then {for "_i" from 0 to (count (_backpack_weaps select 0) - 1) do {
  _bp addweaponCargoGlobal [(_backpack_weaps select 0) select _i,(_backpack_weaps select 1) select _i];};
};
if (count (_backpack_magas select 0) > 0) then {for "_i" from 0 to (count (_backpack_magas select 0) - 1) do {
  _bp addMagazineCargoGlobal [(_backpack_magas select 0) select _i,(_backpack_magas select 1) select _i];};
};
if (count (_backpack_items select 0) > 0) then {for "_i" from 0 to (count (_backpack_items select 0) - 1) do {
  _bp addItemCargoGlobal [(_backpack_items select 0) select _i,(_backpack_items select 1) select _i];};
};
