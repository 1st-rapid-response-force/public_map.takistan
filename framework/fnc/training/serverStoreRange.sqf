/*
	File: rrf_fnc_training_serverStoreRange.sqf

	Description:
	Server stores gun qualification via a generic logging function.

	Parameter(s):
  	_this:	STRING	- UUID of player who invoked the function call
	STRING	- Name of player who invoked the function call
	ARRAY -  0 - rangeType
			 1 - scoreAchieved
			 2 - scoreMax
			 3 - weaponUsed
	Returns:
	Nothing
*/

_server_id = server_id;
_uuid = _this select 0;
_position = _this select 1;

[_uuid, _name, _qualification] spawn {
        _uuid = _this select 0;
        _position = _this select 1;
        _method = "save_qualification";
        _params = [[server_id,_uuid, _uuid, _qualification]];
        _response = [_method, _params] call sock_rpc;

};
