params ["_object"];
hint "ayy lmao";
if (!local _object) exitWith {false};

_object call FP_fnc_clearVehicle;
_object allowDamage false;
["AmmoboxInit",[_object,true]] spawn BIS_fnc_arsenal;
true