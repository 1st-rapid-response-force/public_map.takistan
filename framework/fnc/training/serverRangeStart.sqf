/*
	File: training_serverRangeStart.sqf

	Description:
	Starts the Range by invoking Fusion

	Parameter(s):
  	_this:	integer	- uniqueId for range
	Returns:
	Nothing
*/

_server_id = server_id;
_rangeId = _this select 0;

_score = [_rangeId] spawn {
        _rangeId = _this select 0;
        _method = "range_begin";
        _params = [[server_id,_rangeId]];
        _response = [_method, _params] call sock_rpc;
};
