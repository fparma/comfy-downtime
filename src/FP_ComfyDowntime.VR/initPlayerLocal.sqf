params ["_player", "_isJip"];

// Init the Spawn Protection
player addEventHandler ["Respawn", {

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
