/*
	File: serverStoreLoadout.sqf

	Description:
	Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the loadout the player was using before last disconnect. If the server
  cannot pull any information (first connect it will establish the default loadout and invoke it on the player)

	Parameter(s):
  _this:	Object - Player who needs to have loadout Restored

	Returns: Nothing
*/

_player = _this select 0;
_playerUUID = getPlayerUID _player;
_ownerID = owner _player;

//Fusion Code to Pull and store information
[[_playerUUID,_player,_ownerID]] spawn {

        private["_method", "_response", "_params"];
        _perms = _this select 0;
        _uuid = _perms select 0;
				_player = _perms select 1;
				_ownerID = _perms select 2;

        _method = "RESTORE_PLAYER_POSITION";
        _params = [_uuid];
        _response = [_method, _params] call sock_rpc;
	       _positionArray = _response;

	//Fusion will need to return a null for no value found
	    [_player,_positionArray] remoteExecCall ["rrf_fnc_persistence_player_restorePlayerPosition",_ownerID];

};
