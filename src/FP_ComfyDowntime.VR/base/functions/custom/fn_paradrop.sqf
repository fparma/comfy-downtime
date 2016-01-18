hintC "Select Altitude and Designate LZ for HALO Jump on the map";

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

// Open the map and let the Person click where he wants to land
openMap true;
onMapSingleClick {
  player setPos [_pos select 0, _pos select 1, (_pos select 2) + 600];
  openMap [false, false];
  onMapSingleClick {};
};

waitUntil { not visibleMap };
sleep 5;
waitUntil { isTouchingGround player };

// Reapply gear we had before the jump
removeBackpack player;
removeHeadgear player;
player addBackpack _backpack_type;
player addHeadgear _headgear;

if (count (_backpack_weaps select 0) > 0) then {for "_i" from 0 to (count (_backpack_weaps select 0) - 1) do {
  (unitBackpack player) addweaponCargoGlobal [(_backpack_weaps select 0) select _i,(_backpack_weaps select 1) select _i];};
};
if (count (_backpack_magas select 0) > 0) then {for "_i" from 0 to (count (_backpack_magas select 0) - 1) do {
  (unitBackpack player) addMagazineCargoGlobal [(_backpack_magas select 0) select _i,(_backpack_magas select 1) select _i];};
};
if (count (_backpack_items select 0) > 0) then {for "_i" from 0 to (count (_backpack_items select 0) - 1) do {
  (unitBackpack player) addItemCargoGlobal [(_backpack_items select 0) select _i,(_backpack_items select 1) select _i];};
};