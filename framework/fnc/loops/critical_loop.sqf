/*
	File: crticial_loop.sqf

	Description:
	This Loops is labeled critical and will run every 15 seconds on the server
*/

_player = _this select 0;

while {true} do {
        sleep 15;  
        // Save Loadout
        _h = [_player] call rrf_fnc_persistence_player_getPlayerLoadout;

        // Save Position
        _h = [_player] call rrf_fnc_persistence_player_getPlayerPosition;

        // Save Medical Status
        //_h = [_player] call rrf_fnc_persistence_medical_getPlayerMedical;
    };