/*
* 1st RRF - Framework - Player Initalization - init_server.sqf
* Server Initalization
* Version 1.0
*/

//Load Server events
//_h = [] execVM "framework\fnc\serverEvents.sqf";

rifleScores =  [0,0,0,0,0,0,0];
pistolScores = [0,0,0,0,0,0,0];

publicVariable "rifleScores";
publicVariable "pistolScores";

// Load the SQF Log
private["_h"];
_h = [] execVM "framework\lib\log.sqf";
waitUntil {scriptDone _h};

// Load the Sock RPC Library
private["_h"];
_h = [] execVM "framework\lib\sock.sqf";
waitUntil {scriptDone _h};

// Fusion Enabled
if (rrfFusion == 1) then {
	_h =  ["public","takistan"] call rrf_fnc_utility_serverGetID;
};


// Third Party
[] execVM "framework\3rd_party\fn_advancedTowingInit.sqf";
[] execVM "framework\3rd_party\fn_advancedSlingLoadingInit.sqf";

missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED",true,true];

// Event Handlers
disconnectedEvent = addMissionEventHandler ["HandleDisconnect",{[(_this select 0)] call rrf_fnc_events_playerDisconnect}];
