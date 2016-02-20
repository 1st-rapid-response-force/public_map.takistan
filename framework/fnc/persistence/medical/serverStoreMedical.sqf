/*
	File: serverStoreMedical.sqf

	Description:
	Called upon by local player side to store medical array, this will call Persistence
  Fusion engine to store player medical status.

	Parameter(s):
  _this:	Array - 0 - Player UUID
                  1 - ACE Medical Array
	Returns: Nothing
*/

_uuid = _this select 0;
_medical = _this select 1;

[[_uuid, _medical]] spawn {

        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _uuid = _perms select 0;
        _medical = _perms select 1;

        _method = "SAVE_PLAYER_MEDICAL";
        _params = [_uuid, _medical];
        _response = [_method, _params] call sock_rpc;

};
