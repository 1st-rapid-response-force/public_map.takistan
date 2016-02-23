/*
* 1st RRF - Framework - Common Initalization - init_common.sqf
* Common Initalization used by both Server and Player
* Version 1.0
*/


if (rrfWebLoadout == 1) then {
    _arm = [arm] call rrf_fnc_loadout_setupArmory;
};

_toc = [[comp1,comp2,comp3]] call rrf_fnc_toc_setupTOC;