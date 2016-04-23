/*
* 1st RRF - Framework - Player Initalization - init_player.sqf
* Player Initalization
* Version 1.0
*/

[] execVM "framework\doc.sqf";

[] spawn {
	waitUntil {!isNull player};

	titleText ["PUBLIC SERVER \n\n TAKISTAN \n\n 1st RRF", "BLACK FADED", .5];
	
	//Gets ID used for remoteExec
	_ownerID = owner player;
	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
	if (rrfFusion == 1) then {
		if (rrfPersistence == 1) then {
				[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_player_serverRestoreLoadout",2];
				[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_player_serverRestorePosition",2];
				//[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_medical_serverRestoreMedical",2];
				sleep 60;
				_h = [player,_ownerID] spawn rrf_fnc_loops_criticalLoop;
				_h = [player,_ownerID] spawn rrf_fnc_loops_nonCriticalLoop;
		};
	};

	_uuid = getPlayerUID player;

};


