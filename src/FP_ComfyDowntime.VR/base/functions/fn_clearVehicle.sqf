if (!params [["_veh", objNull, [objNull]]]) exitWith {false};

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearItemCargoGlobal _veh;

true