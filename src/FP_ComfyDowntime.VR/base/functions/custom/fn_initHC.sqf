/*

  This function starts an eventHandler that automatically converts all Zeus placed AI (Well, only Zeus can spawn AI in this mission)
  into Headless Client controlled AI units.

*/

if (!isServer) exitWith {};
_HC = owner "HC_1";
waitUntil {!isNil "HC_1"};

["FPC_HCConvert", "onEachFrame", {
  if ((isPlayer) || (_x in units group _HC)) exitWith {};
  if (isNull _HC) ExitWith{};
  { _x setGroupOwner _HC;}forEach allUnits;
}] call BIS_fnc_addStackedEventHandler;