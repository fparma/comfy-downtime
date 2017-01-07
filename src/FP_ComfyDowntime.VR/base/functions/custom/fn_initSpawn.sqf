// Get Info 
// _name = toLower(worldName);_pos = getPos player;_info = [_name,[_pos select 0, _pos select 1]];copyToClipboard str _info;
// _pos = getPos player;_info = [_pos select 0, _pos select 1];copyToClipboard str _info;

_b_coords = [0,0];
_o_coords = [0,0];
_i_coords = [0,0];

_param_lhd = ["LHDEnable"] call BIS_fnc_getParamValue;

if (_param_lhd == 0) then {
  _mapname = toLower(worldName);
  switch (_mapname) do {
    case "utes": {_b_coords = [3510.1,2977.23];_o_coords = [4248.5,2681.87];_i_coords = [4409.5,3552.94];};
    case "sara": {_b_coords = [9417.41,5187.49];_o_coords = [7857.26,7442.88];_i_coords = [12361,8480.58];};
    case "chernarus": {_b_coords = [12910.9,12761.3];_o_coords = [1875,12423.3];_i_coords = [963.135,4412.42];};
    case "isoladicapraia": {_b_coords = [4332.29,1163.45];_o_coords = [6590.92,4373.76];_i_coords = [6673.88,5910.61];};
    case "takistan": {_b_coords = [8268.7,11625.7];_o_coords = [11478.8,8208.26];_i_coords = [10899,1529.41];};
    case "zargabad": {_b_coords = [4966.15,148.877];_o_coords = [6716.92,4178.49];_i_coords = [927.918,6274.72]; };
    case "woodland_acr": {_b_coords = [7339.14,542.105];_o_coords = [691.716,744.421];_i_coords = [3082.22,5470.63];};
    case "stratis": {_b_coords = [2625.7,608.866];_o_coords = [4442.63,2813.77];_i_coords = [3493.41,7222.64];};
    case "anim_helvantis_v2": {_b_coords = [8622.77,1593.01];_o_coords = [2190.7,2676.65];_i_coords = [1188.86,6654.29];};
    case "altis": {_b_coords = [11291.8,10923.4];_o_coords = [5230.92,12029.6];_i_coords = [6967.11,14883.2];};
    case "pja310": {_b_coords = [18294.9,1837.85];_o_coords = [9524.04,3097.78];_i_coords = [13943.9,9675.46];};
    case "tanoa": {_b_coords = [11014.5,11495.1];_o_coords [12501.5,2450.64];_i_coords = [10544,7934.78];};
    default {_b_coords = [0,0];_o_coords = [0,0];_i_coords = [0,0];};
  };

  // Blufor Spawn Setup (Also harbors Civ Faction)
  SPAWNBOARD_B = "MapBoard_altis_F" createVehicle [_b_coords select 0, (_b_coords select 1) + 3, 0];
  SPAWNBOARD_B enableSimulationGlobal false;
  [SPAWNBOARD_B] remoteExec ["FPC_fnc_setupResupplyBox", 0, true];
  SPAWN_WEST setPos [_b_coords select 0, _b_coords select 1, 0];
  SPAWN_MARKER_ZONE_B = createMarker ["SPAWN_MARKER_ZONE_B", getPos SPAWNBOARD_B];
  SPAWN_MARKER_ZONE_B setMarkerShape "ELLIPSE";
  SPAWN_MARKER_ZONE_B setMarkerSize [100,100];
  SPAWN_MARKER_ZONE_B setMarkerColor "ColorBLUFOR";
  SPAWN_MARKER_ZONE_B setMarkerBrush "SolidBorder";
  [SPAWNBOARD_B] remoteExecCall ["FPA_common_fnc_addToCurators", 2];

  // Opfor Spawn Setup
  SPAWNBOARD_O = "MapBoard_altis_F" createVehicle [_o_coords select 0, (_o_coords select 1) + 3, 0];
  SPAWNBOARD_O enableSimulationGlobal false;
  [SPAWNBOARD_O] remoteExec ["FPC_fnc_setupResupplyBox", 0, true];
  SPAWN_EAST setPos [_o_coords select 0, _o_coords select 1, 0];
  SPAWN_MARKER_ZONE_O = createMarker ["SPAWN_MARKER_ZONE_O", getPos SPAWNBOARD_O];
  SPAWN_MARKER_ZONE_O setMarkerShape "ELLIPSE";
  SPAWN_MARKER_ZONE_O setMarkerSize [100,100];
  SPAWN_MARKER_ZONE_O setMarkerColor "ColorOPFOR";
  SPAWN_MARKER_ZONE_O setMarkerBrush "SolidBorder";
  [SPAWNBOARD_O] remoteExecCall ["FPA_common_fnc_addToCurators", 2];

  // Independent spawn setup
  SPAWNBOARD_I = "MapBoard_altis_F" createVehicle [_i_coords select 0, (_i_coords select 1) + 3, 0];
  SPAWNBOARD_I enableSimulationGlobal false;
  [SPAWNBOARD_I] remoteExec ["FPC_fnc_setupResupplyBox", 0, true];
  SPAWN_INDEP setPos [_i_coords select 0, _i_coords select 1, 0];
  SPAWN_MARKER_ZONE_I = createMarker ["SPAWN_MARKER_ZONE_I", getPos SPAWNBOARD_I];
  SPAWN_MARKER_ZONE_I setMarkerShape "ELLIPSE";
  SPAWN_MARKER_ZONE_I setMarkerSize [100,100];
  SPAWN_MARKER_ZONE_I setMarkerColor "ColorIndependent";
  SPAWN_MARKER_ZONE_I setMarkerBrush "SolidBorder";
  [SPAWNBOARD_I] remoteExecCall ["FPA_common_fnc_addToCurators", 2];

  // Ensure that the Marker is always over the Spawn
  [] spawn {
    while {alive SPAWN_WEST} do {
      _b_pos = (getPos SPAWNBOARD_B);
      SPAWN_MARKER_ZONE_B setMarkerPos _b_pos;SPAWN_WEST setPos _b_pos;
      SPAWN_MARKER_ZONE_B setMarkerPos _b_pos;SPAWN_CIV setPos _b_pos;
      SPAWN_MARKER_ZONE_O setMarkerPos (getPos SPAWNBOARD_O);SPAWN_EAST setPos (getPos SPAWNBOARD_O);
      SPAWN_MARKER_ZONE_I setMarkerPos (getPos SPAWNBOARD_I);SPAWN_INDEP setPos (getPos SPAWNBOARD_I);
      sleep 15;
    };
  };
} else {
  // LHD is Active
  
  _lhd_coords = [2000,2000];
  _mapname = toLower(worldName);
  switch (_mapname) do {
    case "sara": {_lhd_coords = [6555.88,12225.4];};
    case "stratis": {_lhd_coords = [6558.99,1443.22];};
    case "chernarus": {_lhd_coords = [12550.1,948.518];};
    case "utes": {_lhd_coords = [1370.68,2667.96];};
    case "pja310": {_lhd_coords = [4995.57,1236.3];};
    case "isoladicapraia": {_lhd_coords = [8509.83,1710.5];};
    case "altis": {_lhd_coords = [18760.1,21303.9];};
    case "anim_helvantis_v2": {_lhd_coords = [5939.74,10240.4];};
    default {_lhd_coords = [2000,2000];};
  };
  
  [_lhd_coords] call FPC_fnc_initLHD;
  
  //Spawn the Respawn Point and Arsenal Box
  SPAWNBOARD_B = "MapBoard_altis_F" createVehicle [0,0,100];
  SPAWNBOARD_B enableSimulationGlobal false;
  [SPAWNBOARD_B] remoteExec ["FPC_fnc_setupResupplyBox", 0, true];
  
  _position = [-7, 18, 16.71];
  _height = (getPosASL COMFY_LHD) select 2;
  _pos_oject = (COMFY_LHD modelToWorld _position);
  SPAWNBOARD_B setPosASL [_pos_oject select 0, (_pos_oject select 1) + 3, (_height + (_position select 2))];
  
  // Set Spawn points. CIV and WEST go onto the Ship, while EAST and INDEP spawn in the Ocean (non-compatible with the LHD).
  SPAWN_WEST setVehiclePosition [SPAWNBOARD_B, [], 0, "CAN_COLLIDE"];
  SPAWN_CIV setVehiclePosition [SPAWNBOARD_B, [], 0, "CAN_COLLIDE"];
  SPAWN_EAST setPos [0,0,0];
  SPAWN_INDEP setPos [0,0,0];
};
