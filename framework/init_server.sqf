/*
* 1st RRF - Framework - Player Initalization - init_server.sqf
* Server Initalization
* Version 1.0
*/

// Fusion Enabled
if (rrfFusion == 1) then {
    // Load the SQF Log
    private["_h"];
    _h = [] execVM "framework\lib\log.sqf";
    waitUntil {scriptDone _h};

    // Load the Sock RPC Library
    private["_h"];
    _h = [] execVM "framework\lib\sock.sqf";
    waitUntil {scriptDone _h};

    _h =  ["deployment","wake"] call rrf_fnc_utility_serverGetID;
};


// Third Party
[] execVM "framework\3rd_party\fn_advancedTowingInit.sqf";
[] execVM "framework\3rd_party\fn_advancedSlingLoadingInit.sqf";

missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED",true,true];