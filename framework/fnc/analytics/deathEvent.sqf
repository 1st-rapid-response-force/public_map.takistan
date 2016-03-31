/*
	File: analyticEvent.sqf

	Description:
	Used to log an analytic Event

	Parameter(s):
  _this:	STRING	- Event Log
    STRING	- UUID of player who invoked the function call
	Returns:
	Nothing
*/

_uuid = _this select 0;

// Fusion Code needs to go here
[_uuid] spawn {
        _uuid = _this select 0;
        _method = "analytics_death";
        _params = [[server_id,_uuid]];
        _response = [_method, _params] call sock_rpc;

};
