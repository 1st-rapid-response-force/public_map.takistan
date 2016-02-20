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

_uuid = _this select 0;
_name = _this select 1;
_qualification = _this select 2;

[_uuid,_name,_qualification] spawn {

        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _loadout = _perms select 0;

        _method = "SAVE_PLAYER_POSITION";
        _params = [_loadout];
        _response = [_method, _params] call sock_rpc;

};
