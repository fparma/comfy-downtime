if (!isServer) exitWith {};
private _add = if (typeName _this != typeName []) then {[_this]} else {_this};
{_x addCuratorEditableObjects [_add,  true];} foreach allCurators;