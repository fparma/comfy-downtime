params ["_object"];
if (!local _object) exitWith {false};

_object spawn FP_fnc_clearVehicle;
_object allowDamage false;

// Add ACE Actions to the Box.
_action_arsenal = ["fpc_arsenal", "Open Arsenal", "", {["Open",true] spawn BIS_fnc_arsenal;}, {true}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_arsenal] spawn ace_interact_menu_fnc_addActionToObject;
true