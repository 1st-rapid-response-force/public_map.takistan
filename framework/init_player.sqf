/*
* 1st RRF - Framework - Player Initalization - init_player.sqf
* Player Initalization
* Version 1.0
*/

[] execVM "framework\doc.sqf";

[] spawn {
	waitUntil {!isNull player};

	titleText ["Takistan\n\n 1st RRF", "BLACK FADED", .5];
	sleep 5;

	//Gets ID used for remoteExec

	_player = player;
	_ownerID = owner player;
	// Lock the Status until loadout is restored
	_player setVariable ["rrf_persistence_restored",false,true];
	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
	if (rrfFusion == 1) then {
		if (rrfPersistence == 1) then {
				[player] remoteExecCall ["rrf_fnc_persistence_player_serverRestoreLoadout",2];
				[player] remoteExecCall ["rrf_fnc_persistence_player_serverRestorePosition",2];
				//[player,_ownerID] remoteExecCall ["rrf_fnc_persistence_medical_serverRestoreMedical",2];

				// Mark Player as restored
				_player setVariable ["rrf_persistence_restored",true,true];
		};
	};
};


