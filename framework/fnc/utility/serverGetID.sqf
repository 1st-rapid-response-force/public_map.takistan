/*
	File: serverGetID.sqf

	Description:
	Used to get and store the server id from Fusion

	Parameter(s):
  _this:	ARRAY - 
  				[0] - Server Name
  				[1] - Server Map

	Returns: Nothing
*/

_serverName = _this select 0;
_serverMap = _this select 1;

[_serverName,_serverMap] spawn {
        _method = "register_server";
        _serverName = _this select 0;
        _serverMap = _this select 1;
        server_id = ["register_server", [[["name", _serverName], ["map", _serverMap]]]] call sock_rpc;
        publicVariable "server_id";
};
