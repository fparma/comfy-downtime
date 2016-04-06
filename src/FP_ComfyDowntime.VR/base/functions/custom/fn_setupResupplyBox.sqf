params ["_object"];
if (local _object) then {_object spawn FP_fnc_clearVehicle;};

// Mission Params:
_param_paradrop = ["ParadropEnable"] call BIS_fnc_getParamValue;
_param_bandage = ["FixYourselfUpEnable"] call BIS_fnc_getParamValue;
_param_arsenal = ["ArsenalEnable"] call BIS_fnc_getParamValue;

_object allowDamage false;

// Add ACE Actions to the Box.
if (_param_paradrop isEqualTo 1) then {
  FPC_paradropping = false;
  
  ["FPC_paradrop_map", "onMapSingleClick", {
      if (FPC_paradropping) then {
        openMap [false, false];
        [_pos] spawn FPC_fnc_paradrop;
        FPC_paradropping = false;
      };
    }] call BIS_fnc_addStackedEventHandler;
    
  _drop_code = {
    hintC "Select LZ for HALO Jump on the map";
    // Open the map and let the Person click where he wants to land
    FPC_paradropping = true;
    openMap true;
  };

  _action_paradrop = ["fpc_paradrop", "Start Paradrop", "", _drop_code, {true}] call ace_interact_menu_fnc_createAction;
  [_object, 0, ["ACE_MainActions"], _action_paradrop] spawn ace_interact_menu_fnc_addActionToObject;
};

if (_param_bandage isEqualTo 1) then {
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
  [_object, 0, ["ACE_MainActions"], _action_bandage] spawn ace_interact_menu_fnc_addActionToObject;
};

if (_param_arsenal isEqualTo 1) then {
  ["AmmoboxInit",[_object,true]] spawn BIS_fnc_arsenal;
};

true
