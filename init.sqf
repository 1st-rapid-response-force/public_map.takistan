/*
* 1st RRF - Framework - Master Initalization File - init.sqf
* Used to call all Initalization files
* Version 1.0
*/

enableSaving [false, false];

//Perms
debugEnabled = "debugEnabled" call BIS_fnc_getParamValue;
rrfPersistence = "rrfPersistence" call BIS_fnc_getParamValue;
rrfWebLoadout = "rrfWebLoadout" call BIS_fnc_getParamValue;

// Call Init Files for both Server and Player 1st RRF Framework
call compile preprocessFile "framework\fnc\compile.sqf";

if (isServer) then {
	call compile preprocessFile "framework\init_server.sqf";
};

call compile preprocessFile "framework\init_common.sqf";

if (!isDedicated) then {
	call compile preprocessFile "framework\init_player.sqf";
};

_null = [[monitor1,monitor2,monitor3,monitor4,monitor5,monitor6],
["test",
"rodtest",
"flying"]
] execVM "framework\3rd_party\lfc\feedInit.sqf";