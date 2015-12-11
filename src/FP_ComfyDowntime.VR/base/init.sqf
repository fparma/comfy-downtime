enableSaving [false,false];
setGroupIconsVisible [true,false]; //Show only 2D
enableCamShake true;
setViewDistance 2000;
setObjectViewDistance 1800;
setTerrainGrid 25;

if (hasInterface) then {
  [] spawn {
    waitUntil {!isNull player};

    // Add new unit to zeus
    player addEventHandler ["Respawn", {[_this select 0, "FP_fnc_addToCurators", false] call BIS_fnc_MP;}];

    // Fix so player cant join ENEMY side, where all sides fires on him
    player addEventHandler ["HandleRating", {_rating = _this select 1;(abs _rating)}];

    // Set Custom Fatigue Settings
    player setCustomAimCoef 0.6;
    player setAnimSpeedCoef 1;
    player allowSprint true;
    player forceWalk false;
    player SetStamina 120;
    setStaminaScheme "Normal";

    // Lower weapon after mission start
    sleep  0.3;
    player switchMove "amovpercmstpslowwrfldnon";
  };
};