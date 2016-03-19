/*
  File: serverStoreMedical.sqf

  Description:
  Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the position the player was using before last disconnect. If the server
  cannot pull any information (first connect it will establish the default loadout and invoke it on the player)

  Parameter(s):
  _this:  Object - Player who needs to have loadout Restored

  Returns: Nothing
*/

_serverID = server_id;
_player = _this select 0;
_playerUUID = getPlayerUID _player;
_array = _this select 1;

//Fusion Code to Pull and store information
[_serverID, _playerUUID, _array] spawn {
        _uuid = _this select 1;
        _array = _this select 2;
        _method = "save_inventory";
        _params = [[server_id,_uuid, _array]];
        _response = [_method, _params] call sock_rpc;

};
