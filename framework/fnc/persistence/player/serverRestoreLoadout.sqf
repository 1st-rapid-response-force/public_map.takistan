/*
	File: serverRestoreLoadout.sqf

	Description:
	Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the position of the player was using before last disconnect. If the server
  cannot pull any information (first connect it will bypass and allow user to spawn on original spawn position)

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

        _method = "RESTORE_PLAYER_EQUIPMENT";
        _params = [_uuid];
        _response = [_method, _params] call sock_rpc;
	_loadoutArray = _response;

	//Fusion will need to return a null for no value found
	    [_player,_loadoutArray,["ammo"]] remoteExecCall ["rrf_fnc_persistence_player_restorePlayerLoadout",_ownerID];

};
