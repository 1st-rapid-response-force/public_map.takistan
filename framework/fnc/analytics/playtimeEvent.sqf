/*
	File: PlayTimeEvent.sqf

	Description:
	Used to credit a user a minute of gametime

	Parameter(s):
    STRING	- UUID of player who invoked the function call
	Returns:
	Nothing
*/

_server_id = server_id;
_uuid = _this select 0;

[_uuid] spawn {
        _uuid = _this select 0;
        _position = _this select 1;
        _method = "analytics_playtime";
        _params = [[server_id,_uuid,1]];
        _response = [_method, _params] call sock_rpc;

};
