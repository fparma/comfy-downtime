params ["_object"];
if (local _object) then {_object spawn FP_fnc_clearVehicle;};

_object allowDamage false;

// Arsenal as Addaction
["AmmoboxInit",[_object,true]] spawn BIS_fnc_arsenal;

true