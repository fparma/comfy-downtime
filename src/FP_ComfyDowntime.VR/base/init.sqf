/*
	General FP init. Not for editing unless you know what you doing
*/

// Run config
[] call compile preprocessFileLineNumbers "config.sqf";

enableSaving [false,false];
setGroupIconsVisible [true,false]; //Show only 2D
enableCamShake true;
setViewDistance FP_VD;
setObjectViewDistance FP_OVD;
setTerrainGrid 25;

if (hasInterface) then {
	// Clients

	// Log ace markers. yes, overwrite ace functions
	ACE_markers_fnc_placeMarker = compile preProcessFileLineNumbers "base\scripts\log_ace_markers.sqf";
	ACE_maptools_fnc_handleMouseButton = compile preProcessFileLineNumbers "base\scripts\log_ace_line_markers.sqf";

	// Hide all UPS markers with correct name, e.g: "area0", "area1", "area_0", "area_1"
	for "_i" from 0 to 50 do {
		(format ["area%1",_i]) setMarkerAlphaLocal 0;
		(format ["area_%1",_i]) setMarkerAlphaLocal 0;
	};

	[] spawn {
		waitUntil {!isNull player};

		// is set by fn_getKit
		FP_kit_type = player getVariable ["FP_kit_type", []];

		player addEventHandler ["Respawn", {
			// Add new unit to zeus
			[_this select 0, "FP_fnc_addCuratorObject", false] call BIS_fnc_MP;
		}];

		// Fix so player cant join ENEMY side, where all sides fires on him
		player addEventHandler ["HandleRating", {
			_rating = _this select 1;
			(abs _rating)
		}];

		// Lower weapon after mission start
		sleep  0.3;
		player switchMove "amovpercmstpslowwrfldnon";
	};
};

if (!isNil "FP_JRM_fnc_init") then {
	[] call FP_JRM_fnc_init;
};

FP_fnc_baseInit = nil;
