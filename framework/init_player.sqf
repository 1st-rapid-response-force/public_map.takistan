/*
* 1st RRF - Framework - Player Initalization - init_player.sqf
* Player Initalization
* Version 1.0
*/

[] execVM "framework\doc.sqf";

[] spawn {
	waitUntil {!isNull player};
	//Gets ID used for remoteExec
	_ownerID = owner player;


	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
/*
if (rrfPersistence == 1) then {
		[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_player_serverRestoreLoadout",2];
		[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_player_serverRestorePosition",2];
};
*/

};
