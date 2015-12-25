// Get Info 
// _name = toLower(worldName);_pos = getPos player;_info = [_name,[_pos select 0, _pos select 1]];copyToClipboard str _info;

_coords = [0,0];
_mapname = toLower(worldName);
switch (_mapname) do {
  case "utes": { _coords = [4373.85,2432.24]; };
  case "sara": { _coords = [16719.6,4684.97]; };
  case "chernarus": { _coords = [14828,13700.7]; };
  case "isoladicapraia": { _coords = [1274.99,9501.36]; };
  case "takistan": { _coords = [2102.93,322.132]; };
  case "zargabad": { _coords = [4960.26,162.131]; };
  case "woodland_acr": { _coords = [7553.03,2555.66]; };
  case "stratis": { _coords = [7100.61,5970.34]; };
  case "anim_helvantis_v2": { _coords = [239.005,4538.56]; };
  case "altis": { _coords = [8483.09,25085.9]; };
  case "pja310": { _coords = [805.322,1356.01]; };
  default { _coords = [0,0]; };
};

//Spawn Whiteboard that Gives access to Arsenal and Everything
SPAWNBOARD = "MapBoard_altis_F" createVehicle [_coords select 0, (_coords select 1) + 3, 0];
SPAWNBOARD enableSimulationGlobal false;
[SPAWNBOARD] remoteExec ["FPC_fnc_setupResupplyBox", 0, true];

// Attach the Initial Respawn to the Whiteboard
SPAWN_WEST setPos [_coords select 0, _coords select 1, 0];

//Spawn the Markers for the Respawn Zone
SPAWN_MARKER_ZONE = createMarker ["SPAWN_MARKER_ZONE", getPos SPAWNBOARD];
SPAWN_MARKER_ZONE setMarkerShape "ELLIPSE";
SPAWN_MARKER_ZONE setMarkerSize [100,100];
SPAWN_MARKER_ZONE setMarkerColor "ColorBLUFOR";
SPAWN_MARKER_ZONE setMarkerBrush "SolidBorder";

// Ensure that the Marker is always over the Spawn
[] spawn {
  while {alive SPAWNBOARD} do {
    SPAWN_MARKER_ZONE setMarkerPos (getPos SPAWNBOARD);
    SPAWN_WEST setPos (getPos SPAWNBOARD);
    sleep 15;
  };
};

// Make the Box Visible for the Curator
[SPAWNBOARD] remoteExecCall ["FP_fnc_addToCurators", 2];