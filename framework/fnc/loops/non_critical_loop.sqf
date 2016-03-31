/*
	File: non_critical_loop.sqf

	Description:
	This Loops is labeled non-critical and will run every 60 seconds on the server
*/
_player = _this select 0;
_playerName = name _player;
_playerUUID = getPlayerUID _player;
_ownerID = _this select 1;

while {true} do {
        sleep 60;

        // Credit Playtime
        //_h = [_playerUUID] call rrf_fnc_analytics_playtimeEvent;
        
    };