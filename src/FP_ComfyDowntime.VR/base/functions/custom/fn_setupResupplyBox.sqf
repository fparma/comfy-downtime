params ["_object"];
if (!local _object) exitWith {false};

_object spawn FP_fnc_clearVehicle;
_object allowDamage false;

// Add ACE Actions to the Box.
_action_arsenal = ["fpc_arsenal", "Open Arsenal", "", {["Open",true] spawn BIS_fnc_arsenal;}, {true}] call ace_interact_menu_fnc_createAction;
_action_bandage = ["fpc_bandage", "Fix yourself up", "", {
  player setDamage 0;
  player allowDamage true;
  player setCaptive false;
  player playMove "";
  [player, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
  [player, false] call ace_medical_fnc_setUnconscious;
  [player, -1] call ace_medical_fnc_adjustPainLevel;
  resetCamShake;
}, {true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_arsenal] spawn ace_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions"], _action_bandage] spawn ace_interact_menu_fnc_addActionToObject;
true