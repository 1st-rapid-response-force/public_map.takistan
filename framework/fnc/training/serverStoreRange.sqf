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
_name = _this select 1;
_score = _this select 2;
_scoreMax = _this select 3;
_weaponUsed = _this select 4;

[_uuid, _name, _score, _scoreMax, _weaponUsed] spawn {
        _uuid = _this select 0;
		_name = _this select 1;
		_score = _this select 2;
		_scoreMax = _this select 3;
		_weaponUsed = _this select 4;
        _method = "save_qualification";
        _params = [[server_id,_uuid, _name, _score, _scoreMax, _weaponUsed]];
        _response = [_method, _params] call sock_rpc;

};
