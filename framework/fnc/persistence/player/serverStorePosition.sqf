/*
	File: getPlayerPosition.sqf

	Description:
  Saves Players Current Position to the Database

	Parameter(s):
  _this:	Array
        0 - Player Information [0 - Name, 1 - UUID]
        1 - Player Position

	Returns: Nothing
*/

_server_id = server_id;
_uuid = _this select 0;
_position = _this select 1;

[_uuid, _position] spawn {
        _uuid = _this select 0;
        _position = _this select 1;
        _method = "save_position";
        _params = [[server_id,_uuid, _position]];
        _response = [_method, _params] call sock_rpc;

};
