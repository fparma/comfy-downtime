enableSaving [false,false];
setGroupIconsVisible [true,false]; //Show only 2D
enableCamShake true;
setViewDistance 2000;
setObjectViewDistance 1800;
setTerrainGrid 25;

if (hasInterface) then {
	// Log ace markers. yes, overwrite ace functions
	ACE_markers_fnc_placeMarker = compile preProcessFileLineNumbers "base\scripts\log_ace_markers.sqf";
	ACE_maptools_fnc_handleMouseButton = compile preProcessFileLineNumbers "base\scripts\log_ace_line_markers.sqf";

	[] spawn {
		waitUntil {!isNull player};

		// Add new unit to zeus
		player addEventHandler ["Respawn", {[_this select 0, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;}];

		// Fix so player cant join ENEMY side, where all sides fires on him
		player addEventHandler ["HandleRating", {_rating = _this select 1;(abs _rating)}];

		// Lower weapon after mission start
		sleep  0.3;
		player switchMove "amovpercmstpslowwrfldnon";
	};
};

if (!isNil "FP_JRM_fnc_init") then {[] call FP_JRM_fnc_init;};