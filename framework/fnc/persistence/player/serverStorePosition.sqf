/*
	File: getPlayerPosition.sqf

	Description:
  Saves Players Current Position to the Database

	Parameter(s):
  _this:	Array
        0 - Player Information [0 - Name, 1 - UUID]
        1 - Player Position

	Returns: Nothing
*/
_positionArray = _this select 0;

[[_positionArray]] spawn {

        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _loadout = _perms select 0;

        _method = "SAVE_PLAYER_POSITION";
        _params = [_loadout];
        _response = [_method, _params] call sock_rpc;

};
