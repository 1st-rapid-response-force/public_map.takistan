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

        _method = "RESTORE_PLAYER_MEDICAL";
        _params = [_uuid];
        _response = [_method, _params] call sock_rpc;
	_medicalArray = _response;

	//Fusion will need to return a null for no value found
	    [_player,_medicalArray] remoteExecCall ["rrf_fnc_persistence_medical_restorePlayerMedical",_ownerID];

};
