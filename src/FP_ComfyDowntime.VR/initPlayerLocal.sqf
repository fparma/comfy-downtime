params ["_player", "_isJip"];

[missionNamespace, "arsenalClosed", {
  private _loadout = getUnitLoadout player;
  private _replaceRadioAcre = {
    params ["_item"];
    if (!(_item isEqualType []) && {[_item] call acre_api_fnc_isRadio}) then {
      _this set [0, [_item] call acre_api_fnc_getBaseRadio];
    };
  };
  if !((_loadout select 3) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 3) select 1); // Uniform items
  };
  if !((_loadout select 4) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 4) select 1); // Vest items
  };
  if !((_loadout select 5) isEqualTo []) then {
    {_x call _replaceRadioAcre} forEach ((_loadout select 5) select 1); // Backpack items
  };

  missionNamespace setVariable ["fpc_loadout", _loadout];
}] call BIS_fnc_addScriptedEventHandler;

player addEventHandler ["Respawn", {
  private _saved = missionNamespace getVariable ["fpc_loadout", []];
  if !(_saved isEqualTo []) then {
    player setUnitLoadout _saved;
  };
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
