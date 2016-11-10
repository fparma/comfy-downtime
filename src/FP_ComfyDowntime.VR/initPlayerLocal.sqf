params ["_player", "_isJip"];

// Add JIP players to zeus
if (_isJip) then {[_player] remoteExecCall ["FP_fnc_addToCurators", 2]};

// Fix so player cant join ENEMY side, where all sides fires on him
player addEventHandler ["HandleRating", {abs (_this select 1);}];

// Init the Spawn Protection
player addEventHandler ["Respawn", {
  [_this select 0] remoteExecCall ["FP_fnc_addToCurators", 2];

  // Set Custom Fatigue Settings
  player setCustomAimCoef 0.6;
}];

[{
    if (hasInterface &&
        {!isServer} &&
        {isNull (getAssignedCuratorLogic player)}
    ) then {
        disableRemoteSensors true;
    };
}, [], 1] call CBA_fnc_waitAndExecute;
