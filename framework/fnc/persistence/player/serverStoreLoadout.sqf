/*
	File: serverStoreLoadout.sqf

	Description:
	Called upon by local player side to store loadout, this will call Persistence
  Fusion engine to store player loadout.

	Parameter(s):
  _this:	Array - 0 - Player UUID
                  1 - Array Loadout

	Returns: Nothing
*/

_server_id = server_id;
_uuid = _this select 0;
_loadout = _this select 1;

[_server_id, _uuid, _loadout] spawn {
        _uuid = _this select 1;
        _loadout = _this select 2;
        _method = "save_inventory";
        _params = [[server_id,_uuid, _loadout]];
        _response = [_method, _params] call sock_rpc;

};
