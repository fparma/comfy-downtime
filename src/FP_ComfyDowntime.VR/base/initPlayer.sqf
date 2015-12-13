// Fix so player cant join ENEMY side, where all sides fires on him
player addEventHandler ["HandleRating", {abs (_this select 1);}];

// Set Custom Fatigue Settings
player setCustomAimCoef 0.6;
player setAnimSpeedCoef 1;
player allowSprint true;
player forceWalk false;
player SetStamina 120;
setStaminaScheme "Normal";