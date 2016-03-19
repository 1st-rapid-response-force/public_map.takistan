/*
	File: serverRestoreMedical.sqf

	Description:
	Called upon by MP_Connected event that invokes the server to contact the Fusion
  API to get the medical array of the player was using before last disconnect. If the server
  cannot pull any information (first connect it will bypass and do nothing)

	Parameter(s):
  _this:	Object - Player who needs to have loadout Restored

	Returns: Nothing
*/

_serverID = server_id;
_player = _this select 0;
_ownerID = _this select 1;
_playerUUID = getPlayerUID _player;
//Fusion Code to Pull and store information
[_playerUUID,_player,_ownerID] spawn {
		_uuid = _this select 0;
		_player = _this select 1;
		_ownerID = _this select 2;
		_position = _this select 3;
        _method = "restore_medical";
        _params = [[server_id,_uuid]];
        _response = [_method, _params] call sock_rpc;
		_medical = _response;


		//Fusion will need to restore loadout or store existing if no match is found.
 		_h = [_player,_medical] remoteExecCall ["rrf_fnc_persistence_medical_restorePlayerMedical",_ownerID];

};
