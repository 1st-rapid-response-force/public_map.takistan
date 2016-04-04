/*
* 1st RRF - Framework - Master Initalization File - init.sqf
* Used to call all Initalization files
* Version 1.0
*/

enableSaving [false, false];

//Perms
debugEnabled = "debugEnabled" call BIS_fnc_getParamValue;
rrfFusion = "rrfFusion" call BIS_fnc_getParamValue;
rrfPersistence = "rrfPersistence" call BIS_fnc_getParamValue;
rrfWebLoadout = "rrfWebLoadout" call BIS_fnc_getParamValue;
rrfAnalytics = "rrfAnalytics" call BIS_fnc_getParamValue;

nopop = true;

// Call Init Files for both Server and Player 1st RRF Framework
call compile preprocessFile "framework\fnc\compile.sqf";

if (isServer) then {
	call compile preprocessFile "framework\init_server.sqf";
};

call compile preprocessFile "framework\init_common.sqf";

if (!isDedicated) then {
	call compile preprocessFile "framework\init_player.sqf";
};

MISSION_ROOT = call {
private "_arr";
_arr = toArray __FILE__;
_arr resize (count _arr - 8);
toString _arr
};

[] execVM "framework\3rd_party\CoalaOS\initCoalaAfter.sqf";

