params ["_pos"];

_sphere = createVehicle ["Sign_Sphere25cm_F", [_pos select 0, _pos select 1, 0], [], 0, "CAN_COLLIDE"];
_sphere setPosASL [_pos select 0, _pos select 1, 0];
_newpos = (getPosATL _sphere);
COMFY_LHD = createVehicle ["CUP_B_LHD_WASP_USMC_Empty", _newpos, [], 0, "CAN_COLLIDE"];
publicVariable "COMFY_LHD";
deleteVehicle _sphere;