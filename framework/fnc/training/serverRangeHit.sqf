/*
	File: training_serverRangeHit.sqf

	Description:
	Registers a hit on a specific range

	Parameter(s):
  	_this:	integer	- uniqueId for range
	Returns:
	Nothing
*/

_server_id = server_id;
_rangeId = _this select 0;

[_rangeId] spawn {
        _rangeId = _this select 0;
        _method = "range_increment";
        _params = [[server_id,_rangeId]];
        _response = [_method, _params] call sock_rpc;

};
