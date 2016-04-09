/*
	File: training_serverRangeReport.sqf

	Description:
	Gets the range score report from Fusion

	Parameter(s):
  	_this:	integer	- uniqueId for range
	Returns:
	_response = integer of range
*/

_server_id = server_id;
_rangeId = _this select 0;
_maxScore = _this select 1;
_player = _this select 2;
_ownerID = owner _player;

[_rangeId,_maxScore,_player,_ownerID] spawn {
        _rangeId = _this select 0;
        _maxScore = _this select 1;
		_player = _this select 2;
		_ownerID = _this select 3;

        _method = "range_read";
        _params = [[server_id,_rangeId]];
        _response = [_method, _params] call sock_rpc;

};
