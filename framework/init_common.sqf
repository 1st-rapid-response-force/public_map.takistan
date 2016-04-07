/*
* 1st RRF - Framework - Common Initalization - init_common.sqf
* Common Initalization used by both Server and Player
* Version 1.0
*/

if (rrfFusion == 1) then {
	if (rrfWebLoadout == 1) then {
	    _arm = [armory] call rrf_fnc_loadout_setupArmory;
	};
};