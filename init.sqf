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



// 3rd Party Init
_null = [[monitor],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";
_null = [[monitor1],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";
_null = [[monitor2],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";
_null = [[monitor3],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";
_null = [[monitor4],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";
_null = [[monitor5],["command","theatreCommand","cam1","cam2","cam3","cam4","cam5","cam6","cam7","cam8","cam9","cam10","cam11","cam12","cam13","cam14","cam15","cam16","cam17","cam18","cam19","cam20"]] execVM "framework\3rd_party\lfc\feedInit.sqf";

MISSION_ROOT = call { 
private "_arr"; 
_arr = toArray __FILE__; 
_arr resize (count _arr - 8); 
toString _arr 
};

[] execVM "framework\3rd_party\CoalaOS\initCoalaAfter.sqf";

[] execVM "framework\3rd_party\fn_advancedSlingLoadingInit.sqf";
missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED",true,true];